import 'dart:collection';
import 'dart:math';

import 'package:flutter_map/flutter_map.dart' hide Polygon;
import 'package:harcapp/_common_classes/polygon.dart';
import 'package:harcapp/logger.dart';
import 'package:latlong2/latlong.dart';
import 'package:polybool/polybool.dart';

import 'model/marker_data.dart';
import 'utils.dart';

class SamplePointsOptimizer{

  static Polygon seenMap = const Polygon(regions: []);

  static double? cachedZoom;

  static HashMap<double, HashMap<double, HashMap<double, bool>>> cached = HashMap();

  static addSeenMapFragment({
    required northDist,
    required southDist,
    required westDist,
    required eastDist,
  }) => seenMap = seenMap.union(Polygon(regions: [[
      Coordinate(westDist, northDist),
      Coordinate(eastDist, northDist),
      Coordinate(eastDist, southDist),
      Coordinate(westDist, southDist),
    ]]));

  static void cacheSamplePoints(
      List<LatLng> samples,
      double zoom,
  ){
    cachedZoom = zoom;

    for(LatLng sample in samples) {
      if(cached[zoom] == null)
        cached[zoom] = HashMap();

      if(cached[zoom]![sample.latitude] == null)
        cached[zoom]![sample.latitude] = HashMap();

      cached[zoom]![sample.latitude]![sample.longitude] = true;
    }

    int count = 0;
    for(var zoomVal in cached.keys)
      for(var latVal in cached[zoomVal]!.keys)
          count += cached[zoomVal]![latVal]!.length;

    logger.d("LoadedPointsCache :: Cached sample count: $count");

  }

  static bool isSamplePointCached(
      LatLng sample,
      double zoom,
  ){
    if(cached[zoom] == null)
      return false;
    if(cached[zoom]![sample.latitude] == null)
      return false;

    return cached[zoom]![sample.latitude]![sample.longitude] != null;
  }

  static (List<LatLng>, List<List<bool>>, bool) createSamplePoints(
      double northLat,
      double southLat,
      double westLng,
      double eastLng,

      double zoom,

      { bool skipCached = false,
        bool inUnseenMapOnly = false,
      }
  ){

    if(northLat.isNaN) return const ([], [], true);
    if(southLat.isNaN) return const ([], [], true);
    if(westLng.isNaN) return const ([], [], true);
    if(eastLng.isNaN) return const ([], [], true);
    if(zoom.isNaN) return const ([], [], true);

    SphericalMercator mercator = const SphericalMercator();

    var (latDistDelta, lngDistDelta) = HarcMapUtils.getDistanceDeltas(zoom);

    CustomPoint startPoint = mercator.project(LatLng(southLat, westLng));
    CustomPoint endPoint = mercator.project(LatLng(northLat, eastLng));

    int westDist = startPoint.x.toInt();
    int southDist = startPoint.y.toInt();
    int eastDist = endPoint.x.toInt();
    int northDist = endPoint.y.toInt();

    int samplingLatPointCount = (northDist - southDist) ~/ latDistDelta;
    int samplingLngPointCount = (eastDist - westDist) ~/ lngDistDelta;

    int westDistOnGrid = westDist - (westDist % lngDistDelta) + lngDistDelta;
    int southDistOnGrid = southDist - (southDist % latDistDelta) + latDistDelta;

    List<LatLng> samples = [];
    List<List<bool>> rectDecompMatrix = List.generate(
        samplingLngPointCount,
        (i) => List.filled(samplingLatPointCount, false),
        growable: false
    );

    List<LatLng> uncertaintySamples = otherMarkersUncertaintySamplePoints(
      northLat,
      southLat,
      westLng,
      eastLng,
      zoom,
      samples,
    );

    bool nothingSkipped = true;
    for(int iLat=0; iLat<samplingLatPointCount; iLat++){
      int latDist = southDistOnGrid + iLat*latDistDelta;
      for(int iLng=0; iLng<samplingLngPointCount; iLng++) {

        int x = westDistOnGrid + iLng * lngDistDelta;
        int y = latDist;

        LatLng sample = mercator.unproject(CustomPoint(x, y));

        if(!uncertaintySamples.contains(sample)) {
          if (skipCached && SamplePointsOptimizer.isSamplePointCached(sample, zoom)) {
            nothingSkipped = false;
            continue;
          }

          if (inUnseenMapOnly && seenMap.isNotEmpty && seenMap.contains(x.toDouble(), y.toDouble())) {
            nothingSkipped = false;
            continue;
          }
        }

        rectDecompMatrix[iLng][iLat] = true;

        samples.add(sample);
      }
    }

    return (samples, rectDecompMatrix, nothingSkipped);

  }

  static List<LatLng> otherMarkersUncertaintySamplePoints(
      double northLat,
      double southLat,
      double westLng,
      double eastLng,

      double zoom,

      List<LatLng> samplingPoints,
  ){

    CustomPoint nothWestPoint = const SphericalMercator().project(LatLng(northLat, westLng));
    int northLatDist = nothWestPoint.y.toInt();
    int westLngDist = nothWestPoint.x.toInt();
    CustomPoint southEastPoint = const SphericalMercator().project(LatLng(southLat, eastLng));
    int southLatDist = southEastPoint.y.toInt();
    int eastLngDist = southEastPoint.x.toInt();

    Set<MarkerData> markersInBounds = MarkerData.findMarkersInBounds(
        northLat: northLat,
        southLat: southLat,
        westLng: westLng,
        eastLng: eastLng,

        zoom: zoom
    );

    // cachedZoom == null means that caching is disabled.
    if(markersInBounds.isEmpty || cachedZoom == null)
      return [];

    var (latDistDelta, lngDistDelta) = HarcMapUtils.getDistanceDeltas(zoom);

    List<LatLng> samplePointsWithPotentialMarkers = [];
    for(MarkerData marker in markersInBounds){

      int closestGridPointLatDist = marker.latDist - (marker.latDist % latDistDelta);
      int startLatDist = closestGridPointLatDist - marker.otherMarkersUncertaintyDist + (marker.otherMarkersUncertaintyDist % latDistDelta);
      int endLatDist = marker.latDist + marker.otherMarkersUncertaintyDist;

      startLatDist = max(startLatDist, southLatDist);
      endLatDist = min(endLatDist, northLatDist);

      for(int y = startLatDist; y <= endLatDist; y += latDistDelta){
        int closestGridPointLngDist = marker.lngDist - (marker.lngDist % lngDistDelta);
        int startLngDist = closestGridPointLngDist - marker.otherMarkersUncertaintyDist + (marker.otherMarkersUncertaintyDist % lngDistDelta);
        int endLngDist = marker.lngDist + marker.otherMarkersUncertaintyDist;

        startLngDist = max(startLngDist, westLngDist);
        endLngDist = min(endLngDist, eastLngDist);

        for(int x = startLngDist; x <= endLngDist; x += lngDistDelta)
          samplePointsWithPotentialMarkers.add(const SphericalMercator().unproject(CustomPoint(x, y)));

      }
    }

    return samplePointsWithPotentialMarkers;

  }

  static clear() => cached.clear();

}