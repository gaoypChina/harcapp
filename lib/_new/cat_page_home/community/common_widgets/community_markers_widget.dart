import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:harcapp/_new/cat_page_harc_map/_main.dart';
import 'package:harcapp/_new/cat_page_harc_map/app_marker.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_data.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_type.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:latlong2/latlong.dart';


class CommunityMarkersWidget extends StatelessWidget{

  final List<MarkerData> markers;
  final EdgeInsets padding;
  final Widget? customPointer;

  const CommunityMarkersWidget(this.markers, {this.padding = EdgeInsets.zero, this.customPointer, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
    height: MarkerWidget.height + padding.vertical,
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

  static const double height = width + textAreaHeight;
  static const double width = 100.0;

  static const double textAreaHeight = 2*Dimen.TEXT_SIZE_NORMAL + 2*Dimen.defMarg;
  
  final MarkerData marker;
  final Widget? customPointer;

  const MarkerWidget(this.marker, {this.customPointer, super.key});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(communityRadius),
      color: backgroundIcon_(context),
    ),
    clipBehavior: Clip.hardEdge,
    height: height,
    width: width,
    child: Column(
      children: [

        Expanded(
          child: IgnorePointer(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(marker.lat, marker.lng),
                zoom: 16,
              ),
              children: [
                TileLayer(
                  urlTemplate: CatPageHarcMap.tileServer,
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
        ),

        SizedBox(
          height: textAreaHeight,
          child: Padding(
            padding: const EdgeInsets.all(Dimen.defMarg),
            child: Text(
              marker.name??markerTypeToName(marker.type),
              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL),
              maxLines: 2,
            ),
          )
        )

      ],
    ),
  );

}