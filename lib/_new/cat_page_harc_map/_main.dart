import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/app_bottom_navigator.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../values/consts.dart';
import '../api/harc_map.dart';
import 'app_marker.dart';
import 'marker_editor/_main.dart';

class CatPageHarcMap extends StatefulWidget{

  const CatPageHarcMap({super.key});

  @override
  State<StatefulWidget> createState() => CatPageHarcMapState();

}

class CatPageHarcMapState extends State<CatPageHarcMap> with AfterLayoutMixin{

  @override
  void afterFirstLayout(BuildContext context) {
    post(() => Provider.of<ColorPackProvider>(context, listen: false).colorPack = ColorPackHarcMap());
  }

  static List<MarkerRespBody>? markers;

  @override
  void initState() {
    if(markers == null){
      ApiHarcMap.getAllMarkers(
        onSuccess: (markers) => setState(() => CatPageHarcMapState.markers = markers),
        onError: (_){
          if(!mounted) return;
          showAppToast(context, text: simpleErrorMessage);
        }
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AppScaffold(
    bottomNavigationBar: const AppBottomNavigator(),
    body: Stack(
      children: [

        FlutterMap(
          options: MapOptions(
            center: LatLng(54.5, 19.5),
            zoom: 5,
            minZoom: 2,
            maxZoom: 18.0
          ),
          nonRotatedChildren: [
            // AttributionWidget.defaultWidget(
            //   source: 'OpenStreetMap contributors',
            //   onSourceTapped: () {},
            // ),
          ],
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              // urlTemplate: 'http://mt{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
            if(markers != null)
              MarkerLayer(markers: markers!.map((m) => AppMarker(marker: m)).toList()),
          ],
        ),

        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SearchField(
                  elevation: AppCard.defElevation,
                  leading: IconButton(
                    icon: const Icon(MdiIcons.menu),
                    onPressed: (){},
                  ),
                  hint: 'Szukaj...',
                ),

                // SingleChildScrollView(
                //   physics: const BouncingScrollPhysics(),
                //   scrollDirection: Axis.horizontal,
                //   clipBehavior: Clip.none,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: const [
                //       TagWidget(MdiIcons.handshake, 'Służba'),
                //       TagWidget(MdiIcons.accountChild, 'Zuchy'),
                //       TagWidget(MdiIcons.account, 'Harcerze'),
                //       TagWidget(MdiIcons.accountStar, 'Harcerze Starsi'),
                //       TagWidget(MdiIcons.accountCowboyHat, 'Wędrownicy'),
                //       TagWidget(MdiIcons.school, 'Krąg akademicki'),
                //       TagWidget(MdiIcons.candle, 'Duszpasterstwa'),
                //       TagWidget(MdiIcons.tent, 'Miejsca biwakowe'),
                //       TagWidget(MdiIcons.flagTriangle, 'Miejsca obozowe'),
                //     ],
                //   ),
                // )
              ],
            )
        ),

      ],
    ),

    floatingActionButton: FloatingActionButton(
      backgroundColor: background_(context),
      child: Icon(MdiIcons.plus, color: iconEnab_(context)),
      onPressed: () => pushPage(
          context,
          builder: (context) => const MarkerEditorPage()
      )
    ),

  );

}

class TagWidget extends StatelessWidget{

  final IconData icon;
  final String text;

  const TagWidget(this.icon, this.text, {super.key});

  @override
  Widget build(BuildContext context) => SimpleButton(
      radius: AppCard.defRadius,
      padding: const EdgeInsets.all(SearchField.defMargVal),
      margin: const EdgeInsets.all(SearchField.defMargVal),
      color: cardEnab_(context),
      elevation: AppCard.defElevation,
      child: Row(
        children: [
          Icon(icon, size: 20.0),
          const SizedBox(width: Dimen.ICON_MARG),
          Text(text, style: AppTextStyle(color: iconEnab_(context), fontWeight: weight.halfBold)),
          const SizedBox(width: Dimen.ICON_MARG),
        ],
      ),
      onTap: () => pushPage(
          context,
          builder: (context) => MarkerEditorPage()
      )
  );

}