import 'dart:collection';
import 'dart:math';

import 'package:flutter_map/flutter_map.dart';
import 'package:harcapp/logger.dart';
import 'package:latlong2/latlong.dart';
import 'package:tuple/tuple.dart';

import '_main.dart';

class LoadedPointsCache{

  static const int maxMarkersOnTileWidth = 10;
  static const int earthRadius = 6356752;

  static HashMap<double, HashMap<double, HashMap<double, bool>>> cached = HashMap();

  static void cacheSamplePoints(
      List<LatLng> samples,
      double zoom,
  ){
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

  static Tuple2<List<LatLng>, bool> createSamplePoints(
      double northLat,
      double southLat,
      double westLng,
      double eastLng,

      double zoom,

      { bool skipCached = false }
  ){

    if(northLat == double.nan) return const Tuple2([], true);
    if(southLat == double.nan) return const Tuple2([], true);
    if(westLng == double.nan) return const Tuple2([], true);
    if(eastLng == double.nan) return const Tuple2([], true);
    if(zoom == double.nan) return const Tuple2([], true);

    SphericalMercator mercator = const SphericalMercator();
    CustomPoint maxPoint = mercator.project(LatLng(CatPageHarcMapState.maxLatSpan, CatPageHarcMapState.maxLngSpan));

    int worldSamplingPointCount = pow(2, zoom.floor()).toInt() * maxMarkersOnTileWidth;

    int worldSamplingLngDistDelta = maxPoint.x ~/ worldSamplingPointCount;
    int worldSamplingLatDistDelta = maxPoint.y ~/ worldSamplingPointCount;

    CustomPoint startPoint = mercator.project(LatLng(southLat, westLng));
    CustomPoint endPoint = mercator.project(LatLng(northLat, eastLng));

    double westDist = startPoint.x.toDouble();
    double southDist = startPoint.y.toDouble();
    double eastDist = endPoint.x.toDouble();
    double northDist = endPoint.y.toDouble();

    int samplingLatPointCount = (northDist - southDist) ~/ worldSamplingLatDistDelta;
    int samplingLngPointCount = (eastDist - westDist) ~/ worldSamplingLngDistDelta;

    double westDistOnGrid = westDist - (westDist % worldSamplingLngDistDelta) + worldSamplingLngDistDelta;
    double southDistOnGrid = southDist - (southDist % worldSamplingLatDistDelta) + worldSamplingLatDistDelta;

    List<LatLng> samples = [];

    bool nothingSkipped = true;
    for(int iLat=0; iLat<samplingLatPointCount; iLat++){
      double lat = southDistOnGrid + iLat*worldSamplingLatDistDelta;
      for(int iLng=0; iLng<samplingLngPointCount; iLng++) {
        LatLng sample = mercator.unproject(CustomPoint(
          westDistOnGrid + iLng * worldSamplingLngDistDelta,
          lat,
        ));
        if(skipCached && LoadedPointsCache.isSamplePointCached(sample, zoom)) {
          nothingSkipped = false;
          continue;
        }
        samples.add(sample);
      }
    }

    return Tuple2(samples, nothingSkipped);

  }

}