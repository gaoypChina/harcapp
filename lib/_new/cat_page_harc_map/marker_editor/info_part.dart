import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/common_contact_editor_widget.dart';
import 'package:harcapp/_new/cat_page_harc_map/model/marker_data.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_editor/providers.dart';
import 'package:harcapp/_new/cat_page_harc_map/model/marker_type.dart';
import 'package:harcapp/_new/cat_page_harc_map/model/marker_visibility.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class InfoPart extends StatefulWidget{

  final MarkerData? initMarker;

  const InfoPart({this.initMarker, super.key});

  @override
  State<StatefulWidget> createState() => InfoPartState();

}

class InfoPartState extends State<InfoPart> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  MarkerData? get initMarker => widget.initMarker;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    super.build(context);
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      children: [

        TitleShortcutRowWidget(
          title: 'Typ miejsca',
          titleColor: hintEnab_(context),
          textAlign: TextAlign.left,
        ),
        Consumer<MarkerTypeProvider>(
          builder: (context, prov, child) => DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                dropdownStyleData: DropdownStyleData(
                  padding: EdgeInsets.zero,
                  maxHeight: MediaQuery.of(context).size.height/2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(communityRadius),
                    color: getMarkerTypeColor(prov.markerType),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.zero,
                  height: Dimen.ICON_SIZE + 2*16.0,
                ),
                iconStyleData: IconStyleData(
                  icon: SizedBox(
                    width: Dimen.ICON_FOOTPRINT,
                    child: Icon(MdiIcons.chevronDown),
                  ),
                ),
                items: allUsableMarkerType.map((markerType) => DropdownMenuItem<MarkerType>(
                    value: markerType,
                    child: ListTile(
                      title: Text(
                        markerTypeToName(markerType),
                        style: AppTextStyle(),
                      ),
                    )
                )).toList(),
                value: prov.markerType,
                onChanged: (value) => setState(() => prov.markerType = value as MarkerType),

                buttonStyleData: ButtonStyleData(
                  height: Dimen.ICON_SIZE + 2*16.0,
                  decoration: BoxDecoration(
                    color: backgroundIcon_(context),
                    borderRadius: BorderRadius.circular(communityRadius),
                  ),
                ),
              )
          ),
        ),

        const SizedBox(height: Dimen.SIDE_MARG),
        TitleShortcutRowWidget(
          title: 'Nazwa',
          titleColor: hintEnab_(context),
          textAlign: TextAlign.left,
        ),
        Consumer<NameProvider>(
          builder: (context, prov, child) => AppTextFieldHint(
            controller: prov.controller,
            focusNode: prov.focusNode,
            hint: 'Nazwa miejsca (jeśli jakoweś ma):',
            hintTop: '',
          ),
        ),

        const SizedBox(height: Dimen.SIDE_MARG),
        TitleShortcutRowWidget(
          title: 'Widoczność miejsca',
          titleColor: hintEnab_(context),
          textAlign: TextAlign.left,
        ),
        Consumer2<MarkerVisibilityProvider, MarkerTypeProvider>(
          builder: (context, prov, markerTypeProv, child) => DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                dropdownStyleData: DropdownStyleData(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(communityRadius),
                    color: getMarkerTypeColor(markerTypeProv.markerType),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.zero,
                  height: Dimen.ICON_SIZE + 2*16.0,
                ),
                iconStyleData: IconStyleData(
                  icon: SizedBox(
                    width: Dimen.ICON_FOOTPRINT,
                    child: Icon(MdiIcons.chevronDown),
                  ),
                ),
                items: allUsableMarkerVisbility.map((markerVisibility) => DropdownMenuItem<MarkerVisibility>(
                    value: markerVisibility,
                    child: ListTile(
                      title: Text(
                        markerVisibilityToName(markerVisibility),
                        style: AppTextStyle(),
                      ),
                    )
                )).toList(),
                value: prov.markerVisibility,
                onChanged: (value) => setState(() => prov.markerVisibility = value as MarkerVisibility),

                buttonStyleData: ButtonStyleData(
                  height: Dimen.ICON_SIZE + 2*16.0,
                  decoration: BoxDecoration(
                    color: backgroundIcon_(context),
                    borderRadius: BorderRadius.circular(communityRadius),
                  ),
                ),
              )
          ),
        ),

        const SizedBox(height: Dimen.SIDE_MARG),
        TitleShortcutRowWidget(
          title: 'Kontakt',
          titleColor: hintEnab_(context),
          textAlign: TextAlign.left,
        ),

        Consumer<ContactProvider>(
          builder: (context, prov, child) => CommonContactEditorWidget(
            initContactData: prov.contact,
            onEmailsChanged: (emails) => prov.contact.email = emails,
            onPhonesChanged: (phones) => prov.contact.phone = phones,
            onWebsitesChanged: (websites) => prov.contact.website = websites,
            onOtherChanged: (other) => prov.contact.other = other,
          ),
        ),

      ],
    );
  }

}