import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/border_material.dart';
import 'package:harcapp/_common_widgets/common_contact_widget.dart';
import 'package:harcapp/_new/api/harc_map.dart';
import 'package:harcapp/_new/cat_page_harc_map/role_page/managers_page.dart';
import 'package:harcapp/_new/cat_page_home/community/common_widgets/community_header_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/community_thumbnail_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community_category.dart';
import 'package:harcapp/_new/details/app_settings.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../cat_page_home/community/community_preview_data_widget.dart';
import '../cat_page_home/community/model/community.dart';
import 'model/marker_data.dart';
import 'marker_editor/_main.dart';
import 'model/marker_role.dart';
import 'model/marker_type.dart';

class AppMarker extends Marker{

  final MarkerData marker;

  AppMarker({
    required this.marker,
  }): super(
      height: 24.0 + (marker.anyDoubleCommunityCategories?(2 + Dimen.TEXT_SIZE_BIG):0),
      width: 24.0 * max(marker.communitiesBasicData.length, 1),
      point: LatLng(marker.lat, marker.lng),
      builder: (context) => InkWell(
        onTap: () => showMarkerDialog(context, marker),
        child: Builder(
            builder: (context){

              List<Widget> children = [];
              for(CommunityCategory commCat in marker.communitiesBasicData.keys) {
                Widget? widget = commCatToWidget(commCat, size: Dimen.ICON_SIZE, elevated: true);
                Color color = getCommCatColor(commCat);
                children.add(
                  marker.communitiesBasicData[commCat] == 1?
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
                            marker.communitiesBasicData[commCat].toString(),
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
                    child: markerTypeToWidget(
                      marker.type,
                      size: Dimen.ICON_SIZE,
                      elevated: true,
                    )
                  // child: Material(
                  //   color: Colors.white,
                  //   elevation: 2.0,
                  //   borderRadius: BorderRadius.circular(Dimen.ICON_SIZE),
                  //   child: Icon(MdiIcons.mapMarker, color: Colors.black),
                  // ),
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
  final Color? background;
  final void Function()? onPreShowDialog;
  final void Function()? onPostShowDialog;

  const CommunityTile(
      this.comm,
      { this.background,
        this.onPreShowDialog,
        this.onPostShowDialog,
        super.key
      });

  @override
  Widget build(BuildContext context) => SimpleButton(
      color: background??background_(context),
      radius: CommunityThumbnailWidget.defRadius,
      child: Hero(
          tag: 'CommunityHeaderHero${comm.key}',
          child: CommunityHeaderWidget(
              comm.iconKey,
              comm.key,
              comm.name,
              comm.category,
              thumbnailBackgroundColor: Colors.transparent,
              thumbnailBorderColor: Colors.transparent,
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

Future<void> showMarkerDialog(BuildContext context, MarkerData marker) => openDialog(
    context: context,
    builder: (_) => MarkerDialog(context, marker)
);

class MarkerDialog extends StatelessWidget{

  final BuildContext parentContext;
  final MarkerData marker;

  const MarkerDialog(this.parentContext, this.marker, {super.key});

  @override
  Widget build(BuildContext context) {

    bool amIAdmin = marker.myRole == MarkerRole.ADMIN;
    bool hasName = marker.name != null && marker.name!.isNotEmpty;
    bool hasContact = marker.contact != null && marker.contact!.isNotEmpty;
    bool hasCommunities = marker.communitiesBasicData.isNotEmpty;

    return Theme(
      data: ColorPackHarcMap().themeData,
      child: Builder(
        builder: (context) {
          // This has to be here in order to override the old context for theme.
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              child: Material(
                borderRadius: BorderRadius.circular(AppCard.bigRadius),
                clipBehavior: Clip.hardEdge,
                color: getMarkerTypeColor(marker.type),
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [

                    AppBar(
                      title: Text(markerTypeToName(marker.type)),
                      centerTitle: true,
                      backgroundColor: getMarkerTypeColorEnd(marker.type),
                      actions: [

                        if(amIAdmin)
                          IconButton(
                            icon: Icon(MdiIcons.pencilOutline),
                            onPressed: () {
                              Navigator.pop(context);
                              pushPage(
                                  context,
                                  builder: (context) =>
                                      MarkerEditorPage(
                                        initMarker: marker,
                                        onSuccess: (updatedMarker) {
                                          marker.update(updatedMarker);
                                        },
                                      )
                              );
                            },
                          )
                        else
                          SizedBox(
                            width: kToolbarHeight,
                            child: Center(
                              child: markerTypeToWidget(marker.type, size: 32),
                            ),
                          ),

                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          if(hasName)
                            const TitleShortcutRowWidget(
                              title: 'Nazwa',
                              textAlign: TextAlign.left,
                            ),

                          if(hasName)
                            Text(marker.name!, style: AppTextStyle(
                                fontSize: Dimen.TEXT_SIZE_BIG,
                                color: iconEnab_(context)
                            )),

                          if(hasName)
                            const SizedBox(height: Dimen.SIDE_MARG),

                          if(AppSettings.devMode)
                            const TitleShortcutRowWidget(
                              title: 'Info dla wtajemniczonych',
                              textAlign: TextAlign.left,
                            ),

                          if(AppSettings.devMode)
                            AppText(
                              'Min appear. zoom: <b>${marker.minZoomAppearance.toStringAsFixed(3)}</b>'
                                  '\nLat: <b>${marker.lat}</b>'
                                  '\nLng: <b>${marker.lng}</b>',
                            ),

                          if(AppSettings.devMode)
                            const SizedBox(height: Dimen.SIDE_MARG),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [

                              if(amIAdmin)
                                SimpleButton.from(
                                    context: context,
                                    color: backgroundIcon_(context),
                                    icon: MdiIcons.accountSupervisorCircleOutline,
                                    text: 'Role',
                                    onTap: () async {
                                      pushReplacePage(context, builder: (context) => MarkerManagersPage(marker: marker));
                                    }
                                ),

                              if(hasContact)
                                SimpleButton.from(
                                    context: context,
                                    color: backgroundIcon_(context),
                                    icon: MdiIcons.emailOutline,
                                    text: 'Kontakt',
                                    onTap: () async {
                                      Navigator.pop(context);
                                      await openCommonContact(
                                          context,
                                          marker.contact!,
                                          otherMultiline: true
                                      );
                                      showMarkerDialog(parentContext, marker);
                                    }
                                ),

                            ],
                          ),

                          if(amIAdmin || hasContact)
                            const SizedBox(height: Dimen.SIDE_MARG),

                          if(hasCommunities)
                            const TitleShortcutRowWidget(
                              title: 'Środowiska',
                              textAlign: TextAlign.left,
                            ),

                          if(hasCommunities)
                            MarkerCommunitiesWidget(
                              marker,
                              tileBorder: getMarkerTypeColorEnd(marker.type),
                              tileBackground: getMarkerTypeColor(marker.type),
                              onPreShowDialog: () => Navigator.pop(context),
                              onPostShowDialog: () => showMarkerDialog(context, marker),
                            ),

                          if(hasCommunities)
                            const SizedBox(height: Dimen.SIDE_MARG),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        }
      )
    );

  }

}

class MarkerCommunitiesWidget extends StatefulWidget{

  final MarkerData marker;
  final Color? tileBorder;
  final Color? tileBackground;
  final void Function() onPreShowDialog;
  final void Function() onPostShowDialog;

  const MarkerCommunitiesWidget(
      this.marker,
      { this.tileBorder,
        this.tileBackground,
        required this.onPreShowDialog,
        required this.onPostShowDialog,
        super.key
      });

  @override
  State<StatefulWidget> createState() => MarkerCommunitiesWidgetState();

}

class MarkerCommunitiesWidgetState extends State<MarkerCommunitiesWidget> {

  MarkerData get marker => widget.marker;
  Color? get tileBorder => widget.tileBorder;
  Color? get tileBackground => widget.tileBackground;
  void Function() get onPreShowDialog => widget.onPreShowDialog;
  void Function() get onPostShowDialog => widget.onPostShowDialog;

  late bool loading;

  @override
  void initState() {
    loading = marker.communities == null;
    if(marker.communities == null)
      ApiHarcMap.getCommunitiesOfMarker(
          markerKey: marker.key,
          publicOnly: !AccountData.loggedIn,
          onSuccess: (communities){
            marker.communities = communities;
            if(mounted) setState(() => loading = false);
          },
          onServerMaybeWakingUp: () {
            if(mounted) showServerWakingUpToast(context);
            if(mounted) setState(() => loading = false);
            return true;
          },
          onError: (){
            if(mounted) showAppToast(context, text: simpleErrorMessage);
            if(mounted) setState(() => loading = false);
          }
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context){

    if(marker.communities == null)
      return const Padding(
        padding: EdgeInsets.all(Dimen.SIDE_MARG),
        child: SpinKitChasingDots(
          size: Dimen.ICON_SIZE,
          color: Colors.black,
        ),
      );

    List<Widget> children = [];
    for(int i=0; i<marker.communities!.length; i++){
      children.add(BorderMaterial(
        borderColor: tileBorder,
        elevation: 2.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CommunityTile(
              marker.communities![i].item1,
              background: tileBackground,
              onPreShowDialog: onPreShowDialog,
              onPostShowDialog: onPostShowDialog,
            ),

            if(marker.communities![i].item2 != null && marker.communities![i].item2!.isNotEmpty)
              Padding(
                  padding: const EdgeInsets.only(
                      top: Dimen.defMarg,
                      left: Dimen.ICON_MARG,
                      right: Dimen.ICON_MARG,
                      bottom: Dimen.ICON_MARG
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .stretch,
                    children: [

                      Text(
                        'Notatka:',
                        style: AppTextStyle(
                            fontSize: Dimen
                                .TEXT_SIZE_NORMAL,
                            fontWeight: weight.halfBold,
                            color: iconDisab_(context)
                        ),
                      ),

                      const SizedBox(height: Dimen.defMarg),

                      Text(
                        marker.communities![i].item2!,
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
      ));
      if(i<marker.communities!.length-1)
        children.add(const SizedBox(height: Dimen.SIDE_MARG));
    }

    return Column(
        mainAxisSize: MainAxisSize.min,
        children: children
    );

  }

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