import 'dart:async';

import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/horizontal_icon_tab.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/harc_map.dart';
import 'package:harcapp/_new/cat_page_harc_map/model/marker_data.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_editor/danger_part.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_editor/providers.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:optional/optional_internal.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../../_common_classes/app_navigator.dart';
import '../model/marker_type.dart';
import 'communities_part.dart';
import 'info_part.dart';
import 'location_part.dart';

class MarkerEditorPage extends StatefulWidget{

  final MarkerData? initMarker;
  final double? initZoom;
  final LatLng? initCenter;
  final FutureOr<void> Function(MarkerData marker)? onSuccess;
  final FutureOr<void> Function()? onRemoved;

  const MarkerEditorPage({this.initMarker, this.initZoom, this.initCenter, this.onSuccess, this.onRemoved, super.key});

  @override
  State<StatefulWidget> createState() => MarkerEditorPageState();

}

class MarkerEditorPageState extends State<MarkerEditorPage> with TickerProviderStateMixin{

  MarkerData? get initMarker => widget.initMarker;
  double? get initZoom => widget.initZoom;
  LatLng? get initCenter => widget.initCenter;

  FutureOr<void> Function(MarkerData marker)? get onSuccess => widget.onSuccess;
  FutureOr<void> Function()? get onRemoved => widget.onRemoved;

  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: initMarker==null?3:4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Theme(
    data: ColorPackHarcMap().themeData,
    child: MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => PositionProvider(
        initLat: initMarker?.lat??initCenter?.latitude,
        initLng: initMarker?.lng??initCenter?.longitude,
      )),

      ChangeNotifierProvider(create: (context) => NameProvider(initMarker: initMarker)),
      ChangeNotifierProvider(create: (context) => MarkerTypeProvider(initMarker: initMarker)),
      ChangeNotifierProvider(create: (context) => MarkerVisibilityProvider(initMarker: initMarker)),
      ChangeNotifierProvider(create: (context) => ContactProvider(initMarker: initMarker)),
      ChangeNotifierProvider(create: (context) => BindedCommunitiesProvider(initMarker: initMarker)),
    ],
        builder: (context, child) => Consumer<MarkerTypeProvider>(
          builder: (context, markerTypeProv, child) => BottomNavScaffold(
            backgroundColor: getMarkerTypeColor(markerTypeProv.markerType),
            appBottomNavColor: getMarkerTypeColor(markerTypeProv.markerType),
            body: NestedScrollView(
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [

                // SliverOverlapAbsorber does not work with SliverAppBar(pinned = true);
                // SliverOverlapAbsorber(
                //   handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                //   sliver:
                SliverAppBar(
                  title: Text(initMarker == null?'Dodaj miejsce':'Edytuj miejsce'),
                  forceElevated: innerBoxIsScrolled,
                  backgroundColor: getMarkerTypeColorEnd(markerTypeProv.markerType),
                  centerTitle: true,
                  pinned: true,

                  actions: [
                    IconButton(
                      icon: Icon(MdiIcons.check),
                      onPressed: () async {

                        PositionProvider positionProv = PositionProvider.of(context);

                        if(positionProv.editMode)
                          positionProv.applyPosition();

                        if(positionProv.lat == wawelLat && positionProv.lng == wawelLng){

                          controller.animateTo(2);
                          showAppToast(
                              context,
                              text: 'No halo, może zmień lokalizację z trawnika przed Wawelem...',
                              duration: const Duration(seconds: 8)
                          );
                          return;
                        }

                        if(isMarkerTypeZbiorkable(MarkerTypeProvider.of(context).markerType) && BindedCommunitiesProvider.of(context).isEmpty) {
                          bool abort = true;
                          await showAlertDialog(
                              context,
                              title: 'Ostrożnie...',
                              content: 'Miejsce, które ${initMarker == null
                                  ? 'dodajesz'
                                  : 'edytujesz'} wygląda na takie, w którym odbywają się zbiórki, ale nie przpisał${AccountData
                                  .sex == Sex.male
                                  ? 'eś'
                                  : 'aś'} do niej żadnego środowiska.'
                                  '\n\nTo fatalna praktyka.'
                                  '\n\nCzy na pewno chcesz kontynuować?',
                              actionBuilder: (_) =>
                              [

                                AlertDialogButton(
                                    text: 'Tak',
                                    onTap: (){
                                      Navigator.pop(context);
                                      abort = false;
                                    }
                                ),

                                AlertDialogButton(
                                    text: 'Już to poprawiam!',
                                    onTap: () {
                                      Navigator.pop(context);
                                      controller.animateTo(1);
                                      abort = true;
                                    }
                                ),

                              ]
                          );

                          if(abort) return;
                        }
                        NameProvider nameProv = NameProvider.of(context);

                        // if(nameProv.name.isEmpty){
                        //
                        //   controller.animateTo(0);
                        //   nameProv.focusNode.requestFocus();
                        //   showAppToast(
                        //       context,
                        //       text: 'Wypadałoby podać jakąś nazwę, nie...?',
                        //       duration: const Duration(seconds: 8)
                        //   );
                        //   return;
                        // }

                        MarkerTypeProvider markerTypeProv = MarkerTypeProvider.of(context);
                        MarkerVisibilityProvider markerVisibilityProv = MarkerVisibilityProvider.of(context);
                        ContactProvider contactProv = ContactProvider.of(context);
                        BindedCommunitiesProvider bindedCommProv = BindedCommunitiesProvider.of(context);

                        showLoadingWidget(context, 'Chwileczkę...');

                        if(initMarker == null)
                          ApiHarcMap.create(
                            name: nameProv.name,
                            contact: contactProv.contact,
                            lat: positionProv.lat,
                            lng: positionProv.lng,
                            type: markerTypeProv.markerType,
                            visibility: markerVisibilityProv.markerVisibility,

                            communityKeys: bindedCommProv.addedCommunities,

                            onSuccess: (MarkerData marker) async {
                              await onSuccess?.call(marker);
                              if(mounted) await popPage(context); // Close loading widget.
                              if(mounted) Navigator.pop(context);
                            },
                            onForceLoggedOut: () async {
                              await popPage(context); // Close loading widget.
                              return true;
                            },
                            onServerMaybeWakingUp: () async {
                              if(mounted) await popPage(context); // Close loading widget.
                              if(mounted) showServerWakingUpToast(context);
                              return true;
                            },
                            onError: () async {
                              if(mounted) await popPage(context); // Close loading widget.
                              if(mounted) showAppToast(context, text: simpleErrorMessage);
                            },
                          );
                        else
                          ApiHarcMap.update(
                            markerKey: initMarker!.key,

                            name: initMarker!.name == nameProv.name?
                            null:
                            Optional.of(nameProv.name),

                            contact: initMarker!.contact == contactProv.contact?
                            null:
                            Optional.of(Tuple2(initMarker!.contact, contactProv.contact)),

                            lat: initMarker!.lat != positionProv.lat?
                            positionProv.lat:
                            null,

                            lng: initMarker!.lng != positionProv.lng?
                            positionProv.lng:
                            null,

                            type: initMarker!.type != markerTypeProv.markerType?
                            markerTypeProv.markerType:
                            null,

                            visibility: initMarker!.visibility != markerVisibilityProv.markerVisibility?
                            markerVisibilityProv.markerVisibility:
                            null,

                            addCommunity: bindedCommProv.addedCommunities,
                            editCommunity: bindedCommProv.editedCommunities,
                            removeCommunity: bindedCommProv.removedCommunities,

                            onSuccess: (MarkerData marker) async {
                              onSuccess?.call(marker);
                              if(mounted) await popPage(context); // Close loading widget.
                              if(mounted) Navigator.pop(context);
                            },
                            onForceLoggedOut: () async {
                              if(mounted) await popPage(context); // Close loading widget.
                              return true;
                            },
                            onServerMaybeWakingUp: () async {
                              if(mounted) await popPage(context); // Close loading widget.
                              if(mounted) showServerWakingUpToast(context);
                              return true;
                            },
                            onError: () async {
                              if(mounted) await popPage(context); // Close loading widget.
                              if(mounted) showAppToast(context, text: simpleErrorMessage);
                            },
                          );

                      },
                    )
                  ],
                  bottom: TabBar(
                    controller: controller,
                    physics: const BouncingScrollPhysics(),
                    isScrollable: initMarker != null,
                    indicator: AppTabBarIncdicator(color: getMarkerTypeColor(markerTypeProv.markerType)),
                    tabs: [
                      const Tab(text: 'Informacje'),

                      Consumer<BindedCommunitiesProvider>(
                        builder: (context, bindedCommProv, child) => HorizontalIconTab(
                          text: 'Środowiska',

                          icon: isMarkerTypeZbiorkable(markerTypeProv.markerType) && bindedCommProv.isEmpty?
                          Icon(
                              MdiIcons.alertCircleOutline,
                              size: 20.0,
                              color: Colors.red[700]
                          ):
                          null,

                          iconMargin: isMarkerTypeZbiorkable(markerTypeProv.markerType)?
                          const EdgeInsets.only(right: 6.0):
                          EdgeInsets.zero,
                        ),
                      ),

                      const Tab(text: 'Lokalizacja'),
                      if(initMarker != null)
                        const Tab(text: 'Strefa zagrożenia'),
                    ],
                  ),
                )
                // )

              ],
              body: TabBarView(
                physics: const BouncingScrollPhysics(),
                controller: controller,
                children: [
                  const InfoPart(),
                  const CommunitiesPart(),
                  LocationPart(initZoom: initZoom),
                  if(initMarker != null)
                    DangerPart(
                      initMarker!,
                      onDeleted: (){
                        Navigator.pop(context);
                        onRemoved?.call();
                      },
                    )
                ],
              ),

            ),
          ),
        )
    )
  );

}