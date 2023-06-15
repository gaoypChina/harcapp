import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:harcapp/_new/cat_page_harc_map/_main.dart';
import 'package:harcapp/_new/cat_page_harc_map/model/marker_data.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

import '../app_marker.dart';
import 'providers.dart';

class LocationPart extends StatefulWidget{

  final double? initZoom;

  const LocationPart({this.initZoom, super.key});

  @override
  State<StatefulWidget> createState() => LocationPartState();

}

class LocationPartState extends State<LocationPart> with AfterLayoutMixin, AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  double? get initZoom => widget.initZoom;

  late MapController controller;

  // late Marker marker;

  // Marker getMarker(LatLng point) =>
  //     Marker(
  //         height: 24,
  //         width: 24,
  //         point: point,
  //         builder: (context) =>
  //         PositionProvider.of(context).editMode?
  //         Icon(MdiIcons.circleSmall):
  //         Icon(MdiIcons.mapMarkerCircle)
  //     );

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    PositionProvider.of(context).setTmpMarkerPosition(controller.center);
  }

  @override
  void initState() {
    controller = MapController();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    super.build(context);
    return Consumer3<PositionProvider, MarkerTypeProvider, MarkerVisibilityProvider>(
        builder: (context, posProv, typeProv, visibilityProv, child) => LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) => Stack(
            children: [

              IgnorePointer(
                ignoring: !posProv.editMode,
                child: FlutterMap(
                  mapController: controller,
                  options: MapOptions(
                      center: LatLng(posProv.lat, posProv.lng),
                      zoom: initZoom??10,
                      minZoom: 2,
                      maxZoom: CatPageHarcMap.maxZoom,
                      interactiveFlags: CatPageHarcMap.interactiveFlags,
                      onPositionChanged: (MapPosition position, bool _){
                        if(posProv.editMode) posProv.setTmpMarkerPosition(position.center!);
                      }
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: CatPageHarcMap.tileServer,
                      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                    ),
                    MarkerLayer(markers: [
                      AppMarker(marker: MarkerData.fromSimple(
                          lat: posProv.lat,
                          lng: posProv.lng,
                          type: typeProv.markerType,
                          visibility: visibilityProv.markerVisibility
                      )),
                      if(posProv.editMode)
                        posProv.tmpMarker,
                    ]),
                  ],
                ),
              ),

              if(posProv.editMode)
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

              if(posProv.editMode)
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

              if(posProv.editMode)
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

              if(posProv.editMode)
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

              if(posProv.editMode)
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
                              onTap: () => posProv.editMode = false,
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
                                PositionProvider.applyPosition_(context);
                                posProv.editMode = false;
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
                      onTap: () {
                        posProv.editMode = true;
                        posProv.setTmpMarkerPosition(controller.center);
                      },
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
    );
  }

}