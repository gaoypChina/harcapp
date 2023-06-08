import 'dart:collection';
import 'dart:math';

import 'package:flutter_map/flutter_map.dart' hide Polygon;
import 'package:harcapp/_common_classes/polygon.dart';
import 'package:harcapp/logger.dart';
import 'package:latlong2/latlong.dart';
import 'package:polybool/polybool.dart';
import 'package:tuple/tuple.dart';

import 'model/marker_data.dart';
import 'utils.dart';

class SamplePointsOptimizer{

  // This variable stores areas of the map that are already seen by the user and
  // that turned out to be empty. If a user zooms into such an area, it will not be sampled.
  static Polygon seenMap = const Polygon(regions: []);

  // This variable stores the area of a already loaded map layer for each zoom
  // level of a public map (loaded when not logged in).
  // When reading, if the zoom level should be rounded up.
  // When writing, if the zoom level should be rounded down.
  static Map<int, Polygon> seenPublicMap = {};

  static double? cachedZoom;

  static HashMap<int, HashMap<double, HashMap<double, bool>>> cached = HashMap();

  static addSeenMapFragment({
    required double northDist,
    required double southDist,
    required double westDist,
    required double eastDist,
  }){

    Polygon newArea = Polygon(regions: [[
      Coordinate(westDist, northDist),
      Coordinate(eastDist, northDist),
      Coordinate(eastDist, southDist),
      Coordinate(westDist, southDist),
    ]]);

    try {
      seenMap = seenMap.union(newArea);
    } catch (e){
      // For some reason this sometime throws an error. It's a library implementation problem.
      logger.e("SamplePointsOptimizer :: addSeenMapFragment :: ${e.toString()}");
    }
  }

  static addSeenPublicMapFragment({
    required double northDist,
    required double southDist,
    required double westDist,
    required double eastDist,
    required double zoom,
  }){

    Polygon newArea = Polygon(regions: [[
      Coordinate(westDist, northDist),
      Coordinate(eastDist, northDist),
      Coordinate(eastDist, southDist),
      Coordinate(westDist, southDist),
    ]]);

    int _zoom = zoom.floor();

    for(int itZoom = _zoom; itZoom>0; itZoom--){
      if(seenPublicMap[itZoom] == null)
        seenPublicMap[itZoom] = const Polygon(regions: []);

      try {
        seenPublicMap[itZoom.floor()] = seenPublicMap[itZoom.floor()]!.union(newArea);
      } catch (e){
        // For some reason this sometime throws an error. It's a library implementation problem.
        logger.e("SamplePointsOptimizer :: addSeenMapFragment :: ${e.toString()}");
      }
    }
  }

  static bool isPublicMapSeen({
    required double northDist,
    required double southDist,
    required double westDist,
    required double eastDist,
    required double zoom,
  }){
    if(seenPublicMap[zoom.ceil()] == null) return false;

    return seenPublicMap[zoom.ceil()]!.containsPoly(Polygon(regions: [[
      Coordinate(westDist, northDist),
      Coordinate(eastDist, northDist),
      Coordinate(eastDist, southDist),
      Coordinate(westDist, southDist),
    ]]));
  }

  static void cacheSamplePoints(
      List<LatLng> samples,
      double zoom,
  ){
    cachedZoom = zoom;
    int zoomToLookup = zoom.floor();

    if(cached[zoomToLookup] == null)
      cached[zoomToLookup] = HashMap();

    for(LatLng sample in samples) {
      if(cached[zoomToLookup]![sample.latitude] == null)
        cached[zoomToLookup]![sample.latitude] = HashMap();

      cached[zoomToLookup]![sample.latitude]![sample.longitude] = true;
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
    int zoomToLookup = zoom.floor();

    if(cached[zoomToLookup] == null)
      return false;
    if(cached[zoomToLookup]![sample.latitude] == null)
      return false;

    return cached[zoomToLookup]![sample.latitude]![sample.longitude] != null;
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

    // Samples around currently found markers.
    List<LatLng> uncertaintySamples = otherMarkersUncertaintySamplePoints(
      northLat,
      southLat,
      westLng,
      eastLng,
      zoom,
    );

    bool nothingSkipped = true;
    for(int iLat=0; iLat<samplingLatPointCount; iLat++){
      int latDist = southDistOnGrid + iLat*latDistDelta;
      for(int iLng=0; iLng<samplingLngPointCount; iLng++) {

        int x = westDistOnGrid + iLng * lngDistDelta;
        int y = latDist;

        LatLng sample = mercator.unproject(CustomPoint(x, y));

        // If already cached, skip.
        if (skipCached && SamplePointsOptimizer.isSamplePointCached(sample, zoom)) {
          nothingSkipped = false;
          continue;
        }

        // If sample is not uncertain...
        if(!uncertaintySamples.contains(sample)) {

          // If sample is in the seen part of the map, skip.
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

      double zoom
  ){

    CustomPoint nothWestPoint = const SphericalMercator().project(LatLng(northLat, westLng));
    double northLatDist = nothWestPoint.y.toDouble();
    double westLngDist = nothWestPoint.x.toDouble();
    CustomPoint southEastPoint = const SphericalMercator().project(LatLng(southLat, eastLng));
    double southLatDist = southEastPoint.y.toDouble();
    double eastLngDist = southEastPoint.x.toDouble();

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
    Set<Tuple2<double, double>> duplicationSet = {};
    for(MarkerData marker in markersInBounds){

      // Closest sampling point, left of marker.
      double closestGridPointLatDist = marker.latDist - (marker.latDist % latDistDelta);
      double startLatDist = closestGridPointLatDist - marker.otherMarkersUncertaintyDist + (marker.otherMarkersUncertaintyDist % latDistDelta) + latDistDelta;
      double endLatDist = marker.latDist + marker.otherMarkersUncertaintyDist;

      startLatDist = max(startLatDist, southLatDist);
      endLatDist = min(endLatDist, northLatDist);

      for(double y = startLatDist; y <= endLatDist; y += latDistDelta){
        // Closest sampling point, below marker.
        double closestGridPointLngDist = marker.lngDist - (marker.lngDist % lngDistDelta);
        double startLngDist = closestGridPointLngDist - marker.otherMarkersUncertaintyDist + (marker.otherMarkersUncertaintyDist % lngDistDelta) + lngDistDelta;
        double endLngDist = marker.lngDist + marker.otherMarkersUncertaintyDist;

        startLngDist = max(startLngDist, westLngDist);
        endLngDist = min(endLngDist, eastLngDist);

        for(double x = startLngDist; x <= endLngDist; x += lngDistDelta) {
          if(duplicationSet.contains(Tuple2(x, y))) continue;
          samplePointsWithPotentialMarkers.add(const SphericalMercator().unproject(CustomPoint(x, y)));
          duplicationSet.add(Tuple2(x, y));
        }

      }
    }

    return samplePointsWithPotentialMarkers;

  }

  static clear(){
    cached.clear();
    seenMap = const Polygon(regions: []);
    seenPublicMap.clear();
  }

}