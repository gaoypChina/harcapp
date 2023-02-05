import 'dart:math';

import 'package:flutter_map/flutter_map.dart';
import 'package:harcapp/_new/cat_page_harc_map/model/marker_data.dart';
import 'package:latlong2/latlong.dart';
import 'package:tuple/tuple.dart';

class HarcMapUtils{

  static const double maxLatSpan = 85.0;
  static const double maxLngSpan = 180.0;

  static const int maxMarkersOnTileWidth = 20;
  static const int earthRadius = 6356752;

  static const SphericalMercator _sphericalMercator = SphericalMercator();
  static final CustomPoint _maxPoint = _sphericalMercator.project(LatLng(maxLatSpan, maxLngSpan));
  static final double maxLatDistSpan = 2*_maxPoint.x.toDouble();
  static final double maxLngDistSpan = 2*_maxPoint.y.toDouble();

  static const double minZoomMargFactor = 1.001;

  static double distance(double lat1, double lng1, double lat2, double lng2) {
    CustomPoint point1 = _sphericalMercator.project(LatLng(lat1, lng1));
    double x1 = point1.x.toDouble();
    double y1 = point1.y.toDouble();

    CustomPoint point2 = _sphericalMercator.project(LatLng(lat2, lng2));
    double x2 = point2.x.toDouble();
    double y2 = point2.y.toDouble();

    double deltaX = (x1 - x2).abs();
    double deltaY = (y1 - y2).abs();

    return sqrt(deltaX*deltaX + deltaY*deltaY);
  }

  static double distance_(MarkerData marker, double lat, double lng) =>
    distance(marker.lat, marker.lng, lat, lng);

  static double metersPerTileToZoom(double distancePerTile){
    // The relation between zoom (z) and distancePerTile (dpt) is:
    // worldWidth = 40075160
    // noTilesToCoverWorldWidth = 2**z
    // dpt = worldWidth / noTilesToCoverWorldWidth

    double noTilesToCoverWorldWidth = maxLngDistSpan / distancePerTile;
    double zoom = log(noTilesToCoverWorldWidth)/log(2);
    return zoom;
  }

  static double distanceToMinZoomAppearance(double distance, {int? maxMarkersOnTileWidth}){
    // Distance (calculated as SphericalMercator) of visible terrain per tile is understood.
    double maxMetersPerTile = distance * (maxMarkersOnTileWidth ?? HarcMapUtils.maxMarkersOnTileWidth);
    return metersPerTileToZoom(maxMetersPerTile.toDouble());
  }

  static double addMetersToLat(double lat, int meters, {double marginFactor = 1.0}){
    return lat + (180 / pi) * (marginFactor * meters.toDouble() / earthRadius);
  }

  static double addMetersToLng(double lng, double lat, int meters, {double marginFactor = 1.0}){
    return lng + (180 / pi) * (marginFactor * meters.toDouble() / earthRadius) / cos((pi/180.0)*lat);
  }

  static Tuple2<double, Tuple4<double, double, double, double>> getMinZoomData(
    double lat,
    double lng,
    MarkerData zoomSource,
    { double margFactor = minZoomMargFactor }
  ){

    CustomPoint markerCustomPoint = _sphericalMercator.project(LatLng(lat, lng));
    double markerX = markerCustomPoint.x.toDouble();
    double markerY = markerCustomPoint.y.toDouble();

    CustomPoint zoomSourceCustomPoint = _sphericalMercator.project(LatLng(zoomSource.lat, zoomSource.lng));
    double zoomSourceX = zoomSourceCustomPoint.x.toDouble();
    double zoomSourceY = zoomSourceCustomPoint.y.toDouble();

    double deltaX = (markerX - zoomSourceX).abs();
    double deltaY = (markerY - zoomSourceY).abs();

    double delta = max(deltaX, deltaY);

    LatLng northEast = _sphericalMercator.unproject(CustomPoint(markerX + delta*margFactor, markerY + delta*margFactor));
    double minZoomNorthLat = northEast.latitude;
    double minZoomEastLng = northEast.longitude;
    LatLng southWest = _sphericalMercator.unproject(CustomPoint(markerX - delta*margFactor, markerY - delta*margFactor));
    double minZoomSouthLat = southWest.latitude;
    double minZoomWestLng = southWest.longitude;

    // Same as: distanceToMinZoomAppearance(distance_(zoomSource, lat, lng));
    double minZoomAppearance = sqrt(deltaX*deltaX + deltaY*deltaY);

    // TODO: Return multiple values from function in Dart 3
    return Tuple2(
        minZoomAppearance,
        Tuple4(minZoomNorthLat, minZoomSouthLat, minZoomWestLng, minZoomEastLng)
    );
  }

}