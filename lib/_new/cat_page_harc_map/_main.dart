import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class CatPageHarcMap extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => CatPageHarcMapState();

}

class CatPageHarcMapState extends State<CatPageHarcMap> with AfterLayoutMixin{

  @override
  void afterFirstLayout(BuildContext context) {
    post(() => Provider.of<ColorPackProvider>(context, listen: false).colorPack = ColorPackHarcMap());
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Stack(
        children: [

          FlutterMap(
            options: MapOptions(
              minZoom: 2,
              center: LatLng(52.0, 19.1),
              zoom: 5.85,
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                  //urlTemplate: 'http://mt{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                  //subdomains: ['0', '1', '2', '3'],
                  //retinaMode: true,
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 24.0,
                    height: 24.0,
                    point: LatLng(50.04438820440828, 19.945508021792207),
                    builder: (context) => Icon(MdiIcons.circle)
                  ),
                ],
              ),
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
                  leading: IconButton(
                    icon: Icon(MdiIcons.menu),
                    onPressed: (){},
                  ),
                  hint: 'Szukaj...',
                ),

                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TagWidget(MdiIcons.handshake, 'Służba'),
                      TagWidget(MdiIcons.accountChild, 'Zuchy'),
                      TagWidget(MdiIcons.account, 'Harcerze'),
                      TagWidget(MdiIcons.accountStar, 'Harcerze Starsi'),
                      TagWidget(MdiIcons.accountCowboyHat, 'Wędrownicy'),
                      TagWidget(MdiIcons.school, 'Krąg akademicki'),
                      TagWidget(MdiIcons.candle, 'Duszpasterstwa'),
                      TagWidget(MdiIcons.tent, 'Miejsca biwakowe'),
                      TagWidget(MdiIcons.flagTriangle, 'Miejsca obozowe'),

                    ],
                  ),
                )
              ],
            )
          ),

        ],
      ),
    );

  }

  @override
  Widget? drawerBuilder(/*BuildContext context*/) => null;

  @override
  bool showDrawer() => false;

  @override
  Widget buildFloatingButton(/*BuildContext context*/) => FloatingActionButton(
    child: Icon(MdiIcons.plus),
    onPressed: () {  },
  );

  @override
  bool showFloatingButton() => true;

}

class TagWidget extends StatelessWidget{

  final IconData icon;
  final String text;

  const TagWidget(this.icon, this.text);

  @override
  Widget build(BuildContext context) {

    return SimpleButton(
        radius: 100,
        padding: EdgeInsets.all(Dimen.ICON_MARG),
        margin: EdgeInsets.all(SearchField.DEF_MARG_VAL),
        color: cardEnab_(context),
        elevation: AppCard.bigElevation,
        child: Row(
          children: [
            Icon(icon, size: 20.0),
            SizedBox(width: Dimen.ICON_MARG),
            Text(text, style: AppTextStyle(color: iconEnab_(context), fontWeight: weight.halfBold)),
            SizedBox(width: Dimen.ICON_MARG),
          ],
        ),
        onTap: (){}
    );
  }

}