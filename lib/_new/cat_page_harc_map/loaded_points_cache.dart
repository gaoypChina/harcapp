import 'dart:collection';
import 'dart:math';

import 'package:flutter_map/flutter_map.dart';
import 'package:harcapp/logger.dart';
import 'package:latlong2/latlong.dart';
import 'package:tuple/tuple.dart';

import 'model/marker_data.dart';
import 'utils.dart';

class LoadedPointsCache{

  static double? cachedZoom;

  static HashMap<double, HashMap<double, HashMap<double, bool>>> cached = HashMap();

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

  // TODO: return multiple values
  static Tuple3<List<LatLng>, List<List<bool>>, bool> createSamplePoints(
      double northLat,
      double southLat,
      double westLng,
      double eastLng,

      double zoom,

      { bool skipCached = false }
  ){

    if(northLat == double.nan) return const Tuple3([], [], true);
    if(southLat == double.nan) return const Tuple3([], [], true);
    if(westLng == double.nan) return const Tuple3([], [], true);
    if(eastLng == double.nan) return const Tuple3([], [], true);
    if(zoom == double.nan) return const Tuple3([], [], true);

    SphericalMercator mercator = const SphericalMercator();

    Tuple2<int, int> distDeltas = HarcMapUtils.getDistanceDeltas(zoom);
    int latDistDelta = distDeltas.item1;
    int lngDistDelta = distDeltas.item2;

    CustomPoint startPoint = mercator.project(LatLng(southLat, westLng));
    CustomPoint endPoint = mercator.project(LatLng(northLat, eastLng));

    double westDist = startPoint.x.toDouble();
    double southDist = startPoint.y.toDouble();
    double eastDist = endPoint.x.toDouble();
    double northDist = endPoint.y.toDouble();

    int samplingLatPointCount = (northDist - southDist) ~/ latDistDelta;
    int samplingLngPointCount = (eastDist - westDist) ~/ lngDistDelta;

    double westDistOnGrid = westDist - (westDist % lngDistDelta) + lngDistDelta;
    double southDistOnGrid = southDist - (southDist % latDistDelta) + latDistDelta;

    List<LatLng> samples = [];
    List<List<bool>> rectDecompMatrix = List.generate(
        samplingLngPointCount,
        (i) => List.filled(samplingLatPointCount, false),
        growable: false
    );

    bool nothingSkipped = true;
    for(int iLat=0; iLat<samplingLatPointCount; iLat++){
      double lat = southDistOnGrid + iLat*latDistDelta;
      for(int iLng=0; iLng<samplingLngPointCount; iLng++) {
        LatLng sample = mercator.unproject(CustomPoint(
          westDistOnGrid + iLng * lngDistDelta,
          lat,
        ));
        if(skipCached && LoadedPointsCache.isSamplePointCached(sample, zoom)) {
          nothingSkipped = false;
          continue;
        }

        rectDecompMatrix[iLng][iLat] = true;

        samples.add(sample);
      }
    }

    return Tuple3(samples, rectDecompMatrix, nothingSkipped);

  }

  static List<LatLng> emptySpaceSamplePoints(
      double northLat,
      double southLat,
      double westLng,
      double eastLng,

      double zoom,

      List<LatLng> samplingPoints,
  ){

    Set<MarkerData> markersInBounds = MarkerData.findMarkersInBounds(
        northLat: northLat,
        southLat: southLat,
        westLng: westLng,
        eastLng: eastLng,

        zoom: zoom
    );

    logger.d('LoadedPointsCache :: Marker count found in bounds: ${markersInBounds.length}');

    // cachedZoom == null means that caching is disabled.
    if(markersInBounds.isEmpty || cachedZoom == null)
      return [];

    Tuple2<int, int> distDeltas = HarcMapUtils.getDistanceDeltas(zoom);
    int latDistDelta = distDeltas.item1;
    int lngDistDelta = distDeltas.item2;

    Tuple2<int, int> cachedDistDeltas = HarcMapUtils.getDistanceDeltas(cachedZoom!);
    int cachedLatDistDelta = cachedDistDeltas.item1;
    int cachedLngDistDelta = cachedDistDeltas.item2;

    List<LatLng> samplePointsWithPotentialMarkers = [];
    for(MarkerData marker in markersInBounds){

      int startLat = marker.latDist - cachedLatDistDelta - (marker.latDist % latDistDelta);
      int endLat = marker.latDist + 2*cachedLatDistDelta - (marker.latDist % latDistDelta);
      for(int y = startLat; y <= endLat; y += latDistDelta){
        int startLng = marker.lngDist - cachedLngDistDelta - (marker.lngDist % lngDistDelta);
        int endLng = marker.lngDist + 2*cachedLngDistDelta - (marker.lngDist % lngDistDelta);
        for(int x = startLng; x <= endLng; x += lngDistDelta)
          samplePointsWithPotentialMarkers.add(const SphericalMercator().unproject(CustomPoint(x, y)));
      }
    }

    List<LatLng> emptySpaceSamplingPoints = [];
    for(LatLng latLng in samplingPoints)
      if(!samplePointsWithPotentialMarkers.contains(latLng))
        emptySpaceSamplingPoints.add(latLng);

    return emptySpaceSamplingPoints;

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

    logger.d('LoadedPointsCache :: Marker count found in bounds: ${markersInBounds.length}');

    // cachedZoom == null means that caching is disabled.
    if(markersInBounds.isEmpty || cachedZoom == null)
      return [];

    Tuple2<int, int> distDeltas = HarcMapUtils.getDistanceDeltas(zoom);
    int latDistDelta = distDeltas.item1;
    int lngDistDelta = distDeltas.item2;

    List<LatLng> samplePointsWithPotentialMarkers = [];
    for(MarkerData marker in markersInBounds){

      int startLatDist = marker.latDist - marker.otherMarkersUncertaintyDist + (latDistDelta - marker.latDist % latDistDelta);
      int endLatDist = marker.latDist + marker.otherMarkersUncertaintyDist;

      startLatDist = max(startLatDist, southLatDist);
      endLatDist = min(endLatDist, northLatDist);

      for(int y = startLatDist; y <= endLatDist; y += latDistDelta){
        int startLngDist = marker.lngDist - marker.otherMarkersUncertaintyDist + (lngDistDelta - marker.lngDist % lngDistDelta);
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