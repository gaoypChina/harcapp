import 'dart:math';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '_main.dart';

class LoadedPointsCache{

  static const int maxMarkersOnTileWidth = 5;
  static const int earthRadius = 6356752;

  static List<LatLng> createSamplePoints(
      double northLat,
      double southLat,
      double westLng,
      double eastLng,

      double zoom,
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

    double westDist = startPoint.x.toDouble();
    double southDist = startPoint.y.toDouble();

    double westDistOnGrid = westDist - (westDist % worldSamplingLngDistDelta) + worldSamplingLngDistDelta;
    double southDistOnGrid = southDist - (southDist % worldSamplingLatDistDelta) + worldSamplingLatDistDelta;

    List<LatLng> samples = [];

    int iLat = 0;
    LatLng samplePoint = mercator.unproject(CustomPoint(
        westDistOnGrid,
        southDistOnGrid
    ));

    while(samplePoint.latitude < northLat) {
      int iLng = 0;
      double lastLng = double.negativeInfinity;
      while (lastLng < eastLng) {
        samplePoint = mercator.unproject(CustomPoint(
          westDistOnGrid + iLng * worldSamplingLngDistDelta,
          southDistOnGrid + iLat * worldSamplingLatDistDelta
        ));
        samples.add(samplePoint);
        lastLng = samplePoint.longitude;
        iLng++;
      }
      iLat++;
    }

    return samples;

  }

}