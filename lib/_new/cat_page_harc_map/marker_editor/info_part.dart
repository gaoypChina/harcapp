
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_new/api/harc_map.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_editor/providers.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_type.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class InfoPart extends StatefulWidget{

  final MarkerRespBody? initMarker;

  const InfoPart({this.initMarker, super.key});

  @override
  State<StatefulWidget> createState() => InfoPartState();

}

class InfoPartState extends State<InfoPart> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  MarkerRespBody? get initMarker => widget.initMarker;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    super.build(context);
    return ListView(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      children: [

        AppTextFieldHint(hint: 'Nazwa miejsca'),

        const SizedBox(height: Dimen.SIDE_MARG),

        Text('Typ miejsca', style: AppTextStyle(
          fontSize: Dimen.TEXT_SIZE_SMALL,
          color: hintEnab_(context),
          fontWeight: weight.halfBold
        )),
        const SizedBox(height: 2),
        Consumer<MarkerRespBodyProvider>(
          builder: (context, prov, child) => DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                dropdownPadding: EdgeInsets.zero,
                itemPadding: EdgeInsets.zero,
                icon: const SizedBox(
                  width: Dimen.ICON_FOOTPRINT,
                  child: Icon(MdiIcons.chevronDown),
                ),
                items: [
                  DropdownMenuItem<MarkerType>(
                      value: MarkerType.GROMADA_ZUCHOWA_ZHP,
                      child: ListTile(
                          leading: getMarkerTypeWidget(markerType: MarkerType.GROMADA_ZUCHOWA_ZHP),
                          title: Text(
                            markerTypeToName[MarkerType.GROMADA_ZUCHOWA_ZHP]!,
                            style: AppTextStyle(),
                          ),
                      )
                  ),
                  DropdownMenuItem<MarkerType>(
                      value: MarkerType.DRUZYNA_HARCERSKA_ZHP,
                      child: ListTile(
                        leading: getMarkerTypeWidget(markerType: MarkerType.DRUZYNA_HARCERSKA_ZHP),
                        title: Text(
                          markerTypeToName[MarkerType.DRUZYNA_HARCERSKA_ZHP]!,
                          style: AppTextStyle(),
                        ),
                      )
                  ),
                  DropdownMenuItem<MarkerType>(
                      value: MarkerType.DRUZYNA_STARSZOHARCERSKA_ZHP,
                      child: ListTile(
                        leading: getMarkerTypeWidget(markerType: MarkerType.DRUZYNA_STARSZOHARCERSKA_ZHP),
                        title: Text(
                          markerTypeToName[MarkerType.DRUZYNA_STARSZOHARCERSKA_ZHP]!,
                          style: AppTextStyle(),
                        ),
                      )
                  ),
                  DropdownMenuItem<MarkerType>(
                      value: MarkerType.DRUZYNA_WEDROWNICZA_ZHP,
                      child: ListTile(
                        leading: getMarkerTypeWidget(markerType: MarkerType.DRUZYNA_WEDROWNICZA_ZHP),
                        title: Text(
                          markerTypeToName[MarkerType.DRUZYNA_WEDROWNICZA_ZHP]!,
                          style: AppTextStyle(),
                        ),
                      )
                  ),
                ],
                value: prov.markerBody.type,
                onChanged: (value) => setState(() => prov.markerBody.type = value as MarkerType),

                buttonHeight: Dimen.ICON_SIZE + 2*16.0,
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppCard.defRadius),
                ),

                itemHeight: Dimen.ICON_SIZE + 2*16.0,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppCard.bigRadius),
                ),
              )
          ),
        ),

      ],
    );
  }

}