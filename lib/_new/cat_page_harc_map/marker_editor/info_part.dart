import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/common_contact_editor_widget.dart';
import 'package:harcapp/_new/api/harc_map.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_editor/providers.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_type.dart';
import 'package:harcapp/_new/cat_page_home/community/common_widgets/community_header_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/_new/cat_page_home/community/select_community.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
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
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      children: [

        TitleShortcutRowWidget(
          title: 'Nazwa',
          titleColor: hintEnab_(context),
          textAlign: TextAlign.left,
        ),

        Consumer<NameProvider>(
          builder: (context, prov, child) => AppTextFieldHint(
            hint: 'Nazwa miejsca:',
            hintTop: '',
            onChanged: (_, text) => prov.name = text,
          ),
        ),

        const SizedBox(height: Dimen.SIDE_MARG),
        TitleShortcutRowWidget(
          title: 'Typ miejsca',
          titleColor: hintEnab_(context),
          textAlign: TextAlign.left,
        ),
        Consumer<MarkerTypeProvider>(
          builder: (context, prov, child) => DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                dropdownPadding: EdgeInsets.zero,
                itemPadding: EdgeInsets.zero,
                icon: const SizedBox(
                  width: Dimen.ICON_FOOTPRINT,
                  child: Icon(MdiIcons.chevronDown),
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

                buttonHeight: Dimen.ICON_SIZE + 2*16.0,
                buttonDecoration: BoxDecoration(
                  color: backgroundIcon_(context),
                  borderRadius: BorderRadius.circular(AppCard.defRadius),
                ),

                itemHeight: Dimen.ICON_SIZE + 2*16.0,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppCard.bigRadius),
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
            initContactData: prov.contactData,
            onEmailsChanged: (emails) => prov.contactData.email = emails,
            onPhonesChanged: (phones) => prov.contactData.phone = phones,
            onWebsitesChanged: (websites) => prov.contactData.website = websites,
            onOtherChanged: (other) => prov.contactData.other = other,
          ),
        ),

        const SizedBox(height: Dimen.SIDE_MARG),
        TitleShortcutRowWidget(
          title: 'Środowiska',
          titleColor: hintEnab_(context),
          textAlign: TextAlign.left,
        ),

        Consumer<BindedCommunitiesProvider>(
          builder: (context, prov, child) => ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){

              String commKey = prov.communityKeys.keys.toList()[index];

              Community community = Community.allMap![commKey]!;
              return Material(
                clipBehavior: Clip.hardEdge,
                color: backgroundIcon_(context),
                borderRadius: BorderRadius.circular(AppCard.bigRadius),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    CommunityHeaderWidget(
                        community.iconKey,
                        community.key,
                        community.name,
                        community.category,

                        thumbnailHeroTag: false
                    ),

                    Padding(
                      padding: const EdgeInsets.all(Dimen.defMarg),
                      child: AppTextFieldHint(
                        hint: 'Notatka:',
                        hintTop: 'Notatka',
                        maxLines: null,
                        onChanged: (_, text) => prov.communityKeys[commKey] = text,
                      ),
                    ),
                    
                    SimpleButton.from(
                      context: context,
                      margin: EdgeInsets.zero,
                      radius: 0,
                      icon: MdiIcons.trashCanOutline,
                      text: 'Jednak nie',
                      onTap: () => prov.remove(commKey)
                    )

                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: Dimen.defMarg),
            shrinkWrap: true,
            itemCount: prov.communityKeys.length,
          ),
        ),

        SimpleButton.from(
          context: context,
          icon: MdiIcons.plus,
          text: 'Dodaj środowisko',
          onTap: () async {

            BindedCommunitiesProvider bindedCommunitiesProv = BindedCommunitiesProvider.of(context);

            String? communityKey = await selectCommunity(
              context,
              forbiddenCommunityKeys: bindedCommunitiesProv.communityKeys.keys.toList(),
              filterMode: FilterMode.manager
            );
            if(communityKey == null) return;
            if(!bindedCommunitiesProv.communityKeys.containsKey(communityKey))
              bindedCommunitiesProv.add(communityKey);

          }
        )
        
      ],
    );
  }

}