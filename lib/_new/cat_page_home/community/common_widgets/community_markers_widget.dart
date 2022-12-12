import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:harcapp/_new/cat_page_harc_map/app_marker.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_data.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:latlong2/latlong.dart';


class CommunityMarkersWidget extends StatelessWidget{

  final List<MarkerData> markers;
  final EdgeInsets padding;
  final Widget? customPointer;

  const CommunityMarkersWidget(this.markers, {this.padding = EdgeInsets.zero, this.customPointer, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
    height: MarkerWidget.size + padding.vertical,
    child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: padding,
        itemBuilder: (context, index) => MarkerWidget(markers[index], customPointer: customPointer),
        separatorBuilder: (context, index) => const SizedBox(width: Dimen.defMarg),
        scrollDirection: Axis.horizontal,
        itemCount: markers.length
    ),
  );

}

class MarkerWidget extends StatelessWidget{

  static const double size = 100;

  final MarkerData marker;
  final Widget? customPointer;

  const MarkerWidget(this.marker, {this.customPointer, super.key});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(communityRadius),
    ),
    clipBehavior: Clip.hardEdge,
    height: size,
    width: size,
    child: IgnorePointer(
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(marker.lat, marker.lng),
          zoom: 16,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          ),

          MarkerLayer(
              rotate: true,
              markers:
              customPointer==null?
              [AppMarker(marker: marker)]:
              [Marker(point: LatLng(marker.lat, marker.lng), builder: (context) => customPointer!)]
          )

        ],
      ),
    ),
  );

}