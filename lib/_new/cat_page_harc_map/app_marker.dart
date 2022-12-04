import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/border_material.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/common_contact_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/common_widgets/community_header_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/community_thumbnail_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community_category.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../api/harc_map.dart';
import '../cat_page_home/community/community_preview_data_widget.dart';
import '../cat_page_home/community/model/community.dart';
import 'marker_editor/_main.dart';
import 'marker_type.dart';

class AppMarker extends Marker{

  final MarkerRespBody marker;

  AppMarker({
    required this.marker,
  }): super(
      height: 24.0 + (marker.anyDoubleCommunityCategories?(2 + Dimen.TEXT_SIZE_BIG):0),
      width: 24.0*max(marker.communityCategories.length, 1),
      point: LatLng(marker.lat, marker.lng),
      builder: (context) => InkWell(
        onTap: () => showMarkerBottomSheet(context, marker),
        child: Builder(
            builder: (context){

              List<Widget> children = [];
              for(CommunityCategory commCat in marker.communityCategories.keys) {
                Widget? widget = commCatToWidget(commCat, size: Dimen.ICON_SIZE, elevated: true);
                Color color = getCommCatColor(commCat);
                if(widget != null) children.add(
                  marker.communityCategories[commCat] == 1?
                  widget:
                  Material(
                    color: color.withOpacity(.5),
                    borderRadius: BorderRadius.circular(Dimen.ICON_SIZE),
                    elevation: 2.0,
                    child: Column(
                        children: [

                          widget,

                          const SizedBox(height: 1),

                          Text(
                            marker.communityCategories[commCat].toString(),
                            style: AppTextStyle(
                              fontWeight: weight.halfBold,
                              color: color.red + color.green + color.blue < 255*1.5?Colors.white:Colors.black
                            ),
                          ),

                          const SizedBox(height: 1),

                        ],
                    )
                  ),
                );
              }

              if(children.isEmpty)
                return Center(
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(Dimen.ICON_SIZE),
                    child: const Icon(MdiIcons.mapMarker),
                  ),
                );

              return Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: children,
                ),
              );

            }
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

class CommunityTile extends StatelessWidget{

  final CommunityPreviewData comm;
  final void Function()? onPreShowDialog;
  final void Function()? onPostShowDialog;

  const CommunityTile(
      this.comm,
      { this.onPreShowDialog,
        this.onPostShowDialog,
        super.key
      });

  @override
  Widget build(BuildContext context) => SimpleButton(
    color: background_(context),
    radius: CommunityThumbnailWidget.defRadius,
    child: Hero(
        tag: 'CommunityHeaderHero${comm.key}',
        child: CommunityHeaderWidget(
            comm.iconKey,
            comm.key,
            comm.name,
            comm.category,
            thumbnailHeroTag: false
        )
    ),
    onTap: () async {
      onPreShowDialog?.call();
      await openDialog(
          context: context,
          builder: (context) => _CommunityForumDialog(comm)
      );
      onPostShowDialog?.call();
    }
  );

}

Future<void> showMarkerBottomSheet(BuildContext context, MarkerRespBody marker) async {

  return showScrollBottomSheet(
      context: context,
      builder: (_) => BottomSheetDef(
          childMargin: EdgeInsets.zero,
          builder: (_){

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(MdiIcons.arrowLeft),
                      onPressed: () => Navigator.pop(context),
                    ),

                    const SizedBox(width: Dimen.APPBAR_LEADING_WIDTH - Dimen.ICON_FOOTPRINT),

                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        const SizedBox(
                          height: Dimen.ICON_MARG + (Dimen.ICON_SIZE - Dimen.TEXT_SIZE_APPBAR)/2,
                        ),

                        Text(marker.name, style: AppTextStyle(
                          fontSize: Dimen.TEXT_SIZE_APPBAR,
                          fontWeight: weight.bold,
                          color: iconEnab_(context)
                        )),

                        const SizedBox(height: Dimen.defMarg),

                        Text(
                          markerTypeToName(marker.type),
                          style: AppTextStyle(
                            color: textEnab_(context),
                            fontWeight: weight.halfBold
                          )
                        )

                      ],
                    )),

                    IconButton(
                      icon: const Icon(MdiIcons.pencilOutline),
                      onPressed: (){
                        Navigator.pop(context);
                        pushPage(
                          context,
                          builder: (context) => MarkerEditorPage(
                            initMarker: marker,
                            onSuccess: (updatedMarker){
                              marker.update(updatedMarker);
                            },
                          )
                        );
                      },
                    ),

                  ],
                ),

                Padding(
                    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        if(marker.contact != null)
                          TitleShortcutRowWidget(
                            title: 'Kontakt do miejsca',
                            titleColor: textEnab_(context),
                            textAlign: TextAlign.left,
                            onOpenIcon: MdiIcons.chevronRight,
                            onOpen: () async {
                              Navigator.pop(context);
                              await openCommonContact(
                                context,
                                marker.contact!,
                                otherMultiline: true
                              );
                              showMarkerBottomSheet(context, marker);
                            },
                          ),

                        if(marker.communities.isNotEmpty)
                          const SizedBox(height: Dimen.SIDE_MARG),

                        if(marker.communities.isNotEmpty)
                          TitleShortcutRowWidget(
                            title: 'Środowiska',
                            titleColor: textEnab_(context),
                            textAlign: TextAlign.left,
                          ),

                        if(marker.communities.isNotEmpty)
                          ListView.separated(
                            itemBuilder: (_, index) => BorderMaterial(
                              elevation: 2.0,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    CommunityTile(
                                      marker.communities[index].item1,
                                      onPreShowDialog: () => Navigator.pop(context),
                                      onPostShowDialog: () => showMarkerBottomSheet(context, marker),
                                    ),

                                    if(marker.communities[index].item2 != null)
                                      Padding(
                                          padding: const EdgeInsets.only(
                                            top: Dimen.defMarg,
                                            left: Dimen.ICON_MARG,
                                            right: Dimen.ICON_MARG,
                                            bottom: Dimen.ICON_MARG
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [

                                              Text(
                                                'Notatka:',
                                                style: AppTextStyle(
                                                    fontSize: Dimen.TEXT_SIZE_NORMAL,
                                                    fontWeight: weight.halfBold,
                                                    color: iconDisab_(context)
                                                ),
                                              ),

                                              const SizedBox(height: Dimen.defMarg),

                                              Text(
                                                marker.communities[index].item2!,
                                                style: AppTextStyle(
                                                  fontSize: Dimen.TEXT_SIZE_BIG,
                                                  color: iconEnab_(context),
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),

                                            ],
                                          )
                                      )
                                  ],
                                ),
                            ),
                            separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
                            itemCount: marker.communities.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                          ),

                      ],
                    )
                ),

              ],
            );
          }
      )
  );

}

class _CommunityForumDialog extends StatefulWidget{

  final CommunityPreviewData community;

  const _CommunityForumDialog(this.community);

  @override
  State<StatefulWidget> createState() => _CommunityForumDialogState();

}

class _CommunityForumDialogState extends State<_CommunityForumDialog>{

  CommunityPreviewData get community => widget.community;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: background_(context),
        borderRadius: BorderRadius.circular(AppCard.bigRadius),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            CommunityPreviewDataWidget(
              community,
              onForumTap: (forum) => tryOpenPreviewForum(
                context,
                forum,
                onDeleted: () => setState(() => community.forum = null)
              ),
            ),

            SimpleButton.from(
              context: context,
              margin: EdgeInsets.zero,
              radius: 0,
              text: 'Powrót',
              onTap: () => Navigator.pop(context),
            )

          ],
        ),
      ),
    ),
  );

}