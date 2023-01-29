import 'dart:collection';
import 'dart:math';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

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

  static List<LatLng>? createSamplePoints(
      double northLat,
      double southLat,
      double westLng,
      double eastLng,

      double zoom,

      { bool skipCached = false,
        bool returnNullIfNothingSkipped = false
      }
  ){

    if(northLat == double.nan) return [];
    if(southLat == double.nan) return [];
    if(westLng == double.nan) return [];
    if(eastLng == double.nan) return [];
    if(zoom == double.nan) return [];

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

    bool anySkipped = false;
    for(int iLat=0; iLat<samplingLatPointCount; iLat++){
      double lat = southDistOnGrid + iLat*worldSamplingLatDistDelta;
      for(int iLng=0; iLng<samplingLngPointCount; iLng++) {
        LatLng sample = mercator.unproject(CustomPoint(
          westDistOnGrid + iLng * worldSamplingLngDistDelta,
          lat,
        ));
        if(skipCached && LoadedPointsCache.isSamplePointCached(sample, zoom)) {
          anySkipped = true;
          continue;
        }
        samples.add(sample);
      }
    }

    // int iLat = 0;
    // LatLng samplePoint = mercator.unproject(CustomPoint(
    //     westDistOnGrid,
    //     southDistOnGrid
    // ));
    //
    // while(samplePoint.latitude < northLat) {
    //   int iLng = 0;
    //   double lastLng = double.negativeInfinity;
    //   while (lastLng < eastLng) {
    //     samplePoint = mercator.unproject(CustomPoint(
    //       westDistOnGrid + iLng * worldSamplingLngDistDelta,
    //       southDistOnGrid + iLat * worldSamplingLatDistDelta
    //     ));
    //     samples.add(samplePoint);
    //     lastLng = samplePoint.longitude;
    //     iLng++;
    //   }
    //   iLat++;
    // }

    if(returnNullIfNothingSkipped && !anySkipped)
      return null;

    return samples;

  }

}