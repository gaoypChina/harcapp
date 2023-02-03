import 'dart:math';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HarcMapUtils{

  static const double maxLatSpan = 85.0;
  static const double maxLngSpan = 180.0;

  static const int maxMarkersOnTileWidth = 20;
  static const int earthRadius = 6356752;

  static const SphericalMercator _sphericalMercator = SphericalMercator();
  static final CustomPoint _maxPoint = _sphericalMercator.project(LatLng(maxLatSpan, maxLngSpan));
  static final double maxLatDistSpan = 2*_maxPoint.x.toDouble();
  static final double maxLngDistSpan = 2*_maxPoint.y.toDouble();

  static double metersPerTileToZoom(double metersPerTile){
    // The relation between zoom (z) and metersPerTile (mpt) is:
    // worldWidth = 40075160
    // noTilesToCoverWorldWidth = 2**z
    // mpt = worldWidth / noTilesToCoverWorldWidth

    double noTilesToCoverWorldWidth = earthRadius / metersPerTile;
    double zoom = log(noTilesToCoverWorldWidth)/log(2);
    return zoom;
  }

  static double distanceToMinZoomAppearance(double distance, {int? maxMarkersOnTileWidth}){
    // By meters per tile the amount of meters of visible terrain per tile is understood.
    double maxMetersPerTile = distance * (maxMarkersOnTileWidth ?? HarcMapUtils.maxMarkersOnTileWidth);
    return metersPerTileToZoom(maxMetersPerTile.toDouble());
  }

  static double addMetersToLat(double lat, int meters, {double marginFactor = 1.0}){
    return lat + (180 / pi) * (marginFactor * meters.toDouble() / earthRadius);
  }

  static double addMetersToLng(double lng, double lat, int meters, {double marginFactor = 1.0}){
    return lng + (180 / pi) * (marginFactor * meters.toDouble() / earthRadius) / cos((pi/180.0)*lat);
  }

}