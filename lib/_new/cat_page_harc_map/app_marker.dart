import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../api/harc_map.dart';
import 'marker_type.dart';

class AppMarker extends Marker{

  final MarkerRespBody marker;

  AppMarker({
    required this.marker,
  }): super(
      height: 24,
      width: 24,
      point: LatLng(marker.lat, marker.lng),
      builder: (context) => InkWell(
        onTap: () => showScrollBottomSheet(
            context: context,
            builder: (context) => BottomSheetDef(
                childMargin: EdgeInsets.zero,
                builder: (context) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    ListTile(
                      leading: getMarkerTypeWidget(markerType: marker.type, size: 48),
                      title: Text(marker.name, style: AppTextStyle(fontWeight: weight.halfBold)),
                      subtitle: Text(markerTypeToName[marker.type]!, style: AppTextStyle()),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          Text('Kontakt', style: AppTextStyle(
                              fontWeight: weight.halfBold,
                              fontSize: Dimen.TEXT_SIZE_BIG
                          )),

                          if( marker.contact.email.isNotEmpty ||
                              marker.contact.phone.isNotEmpty ||
                              marker.contact.website.isNotEmpty)
                            const SizedBox(height: Dimen.defMarg),

                          if(marker.contact.email.isNotEmpty)
                            Column(
                              children: marker.contact.email.map(
                                      (e) => Padding(
                                      padding: const EdgeInsets.only(top: Dimen.defMarg),
                                      child: ContactItemWidget(MdiIcons.emailOutline, e)
                                  )
                              ).toList(),
                            ),

                          if(marker.contact.phone.isNotEmpty)
                            Column(
                              children: marker.contact.phone.map(
                                  (p) => Padding(
                                  padding: const EdgeInsets.only(top: Dimen.defMarg),
                                  child: ContactItemWidget(MdiIcons.phoneOutline, p)
                              )).toList(),
                            ),

                          if(marker.contact.website.isNotEmpty)
                            Column(
                              children: marker.contact.website.map(
                                      (w) => Padding(
                                      padding: const EdgeInsets.only(top: Dimen.defMarg),
                                      child: ContactItemWidget(MdiIcons.web, w)
                                  )).toList(),
                            ),

                        ],
                      ),
                    )

                  ],
                )
            )
        ),
        child: Builder(
            builder: (context) => getMarkerTypeWidget(markerType: marker.type)
        ),
      )
  );

}

class ContactItemWidget extends StatelessWidget{

  final IconData icon;
  final String text;

  const ContactItemWidget(this.icon, this.text, {super.key});

  @override
  Widget build(BuildContext context) => Row(
    children: [

      Icon(icon, size: 20),
      const SizedBox(width: Dimen.ICON_MARG),
      SelectableText(text, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)),

    ],
  );

}