import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:harcapp/_new/api/harc_map.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../app_marker.dart';
import 'providers.dart';

class LocationPart extends StatefulWidget{

  const LocationPart({super.key});

  @override
  State<StatefulWidget> createState() => LocationPartState();

}

class LocationPartState extends State<LocationPart> with AfterLayoutMixin, AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  late bool editMode;
  late MapController controller;

  late Marker marker;

  Marker getMarker(LatLng point) =>
      Marker(
          height: 24,
          width: 24,
          point: point,
          builder: (context) =>
          editMode?
          const Icon(MdiIcons.circleSmall):
          const Icon(MdiIcons.mapMarkerCircle)
      );

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    marker = getMarker(controller.center);
  }

  @override
  void initState() {
    editMode = false;
    controller = MapController();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    super.build(context);
    return Column(
      children: [

        Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) => Stack(
                children: [

                  IgnorePointer(
                    ignoring: !editMode,
                    child: Consumer2<PositionProvider, MarkerTypeProvider>(
                      builder: (context, posProv, typeProv, child) => FlutterMap(
                        mapController: controller,
                        options: MapOptions(
                            center: LatLng(posProv.lat, posProv.lng),
                            zoom: 10,
                            minZoom: 2,
                            maxZoom: 18.0,
                            onPositionChanged: (MapPosition position, bool _) => setState(() {
                              if(editMode) marker = getMarker(position.center!);
                            })
                        ),
                        children: [
                          TileLayer(
                            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                          ),
                          MarkerLayer(markers: [
                            AppMarker(marker: MarkerRespBody.fromSimple(
                                lat: posProv.lat,
                                lng: posProv.lng,
                                type: typeProv.markerType
                            )),
                            if(editMode)
                              marker,
                          ]),
                        ],
                      ),
                    ),
                  ),

                  if(editMode)
                    Positioned(
                        left: 0,
                        right: constraints.maxWidth/2 + 20,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.black54,
                          ),
                        )
                    ),

                  if(editMode)
                    Positioned(
                        left: constraints.maxWidth/2 + 20,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.black54,
                          ),
                        )
                    ),

                  if(editMode)
                    Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: constraints.maxHeight/2 + 20,
                        child: Center(
                          child: Container(
                            width: 2,
                            height: double.infinity,
                            color: Colors.black54,
                          ),
                        )
                    ),

                  if(editMode)
                    Positioned(
                        left: 0,
                        right: 0,
                        top: constraints.maxHeight/2 + 20,
                        bottom: 0,
                        child: Center(
                          child: Container(
                            width: 2,
                            height: double.infinity,
                            color: Colors.black54,
                          ),
                        )
                    ),

                  if(editMode)
                    Positioned(
                        bottom: Dimen.ICON_MARG,
                        left: Dimen.ICON_MARG,
                        right: Dimen.ICON_MARG,
                        child: Row(
                          children: [

                            Expanded(
                              child: SimpleButton(
                                  color: cardEnab_(context),
                                  elevation: AppCard.bigElevation,
                                  radius: AppCard.bigRadius,
                                  padding: const EdgeInsets.all(Dimen.ICON_MARG),
                                  onTap: () => setState(() => editMode = false),
                                  child: Text(
                                    'Wróć',
                                    style: AppTextStyle(
                                        fontSize: Dimen.TEXT_SIZE_APPBAR,
                                        fontWeight: weight.halfBold
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                              ),
                            ),

                            const SizedBox(width: Dimen.ICON_MARG),

                            Expanded(
                              child: SimpleButton(
                                  color: cardEnab_(context),
                                  elevation: AppCard.bigElevation,
                                  radius: AppCard.bigRadius,
                                  padding: const EdgeInsets.all(Dimen.ICON_MARG),
                                  onTap: (){
                                    PositionProvider.of(context).setPosition(marker.point);
                                    setState(() => editMode = false);
                                  },
                                  child: Text(
                                    'Zapisz',
                                    style: AppTextStyle(
                                        fontSize: Dimen.TEXT_SIZE_APPBAR,
                                        fontWeight: weight.halfBold
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                              ),
                            ),

                          ],
                        )
                    )
                  else
                    Positioned(
                      bottom: Dimen.ICON_MARG,
                      left: Dimen.ICON_MARG,
                      right: Dimen.ICON_MARG,
                      child: SimpleButton(
                          color: cardEnab_(context),
                          elevation: AppCard.bigElevation,
                          radius: AppCard.bigRadius,
                          padding: const EdgeInsets.all(Dimen.ICON_MARG),
                          onTap: () => setState((){
                            editMode = true;
                            marker = getMarker(controller.center);
                          }),
                          child: Text(
                            'Edytuj',
                            style: AppTextStyle(
                                fontSize: Dimen.TEXT_SIZE_APPBAR,
                                fontWeight: weight.halfBold
                            ),
                            textAlign: TextAlign.center,
                          )
                      ),
                    )

                ],
              ),
            )
        ),

      ],
    );
  }

}