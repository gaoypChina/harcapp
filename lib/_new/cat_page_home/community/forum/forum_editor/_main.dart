import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/forum.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/forum_editor/providers.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/values/consts.dart';
import 'package:optional/optional_internal.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../common/community_cover_image_data.dart';
import '../../model/community.dart';
import '../model/forum.dart';
import 'danger_part.dart';
import 'general_part.dart';

class ForumEditorPage extends StatefulWidget{

  final CommunityBasicData community;
  final Forum? initForum;
  final PaletteGenerator? palette;

  final void Function(Forum forum)? onSaved;
  final void Function()? onDeleted;
  final void Function()? onError;

  const ForumEditorPage({
    required this.community,
    this.initForum,
    this.palette,
    this.onSaved,
    this.onDeleted,
    this.onError,
    Key? key
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ForumEditorPageState();

}

class ForumEditorPageState extends State<ForumEditorPage>{

  CommunityBasicData get community => widget.community;
  Forum? get initForum => widget.initForum;
  PaletteGenerator? get palette => _palette??widget.palette;

  PaletteGenerator? _palette;

  void Function(Forum circle)? get onSaved => widget.onSaved;
  void Function()? get onDeleted => widget.onDeleted;
  void Function()? get onError => widget.onError;

  void calcLocalBackgronudColor() async {
    _palette = await getPaletteGenerator(coverImageProv.coverImage);
    colorsKeyProv.notify();
  }

  late CoverImageProvider coverImageProv;
  late ColorsKeyProvider colorsKeyProv;

  @override
  void initState() {
    coverImageProv = CoverImageProvider(forum: initForum);
    calcLocalBackgronudColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DescriptionProvider(forum: initForum)),
        ChangeNotifierProvider(create: (context) => coverImageProv),
        ChangeNotifierProvider(create: (context){
          colorsKeyProv = ColorsKeyProvider(forum: initForum);
          return colorsKeyProv;
        })
      ],
      builder: (context, child) => Consumer<ColorsKeyProvider>(
        builder: (context, colorsKeyProv, child) => BottomNavScaffold(
            backgroundColor: CommunityCoverColors.backgroundColor(context, colorsKeyProv.isColorsKeyAuto?palette:null),
            appBottomNavColor: CommunityCoverColors.backgroundColor(context, colorsKeyProv.isColorsKeyAuto?palette:null),
            body: DefaultTabController(
              length: initForum == null?1:2,
              child: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
                  SliverAppBar(
                    title: Text(initForum==null?'Nowe forum':'Edytuj forum'),
                    centerTitle: true,
                    floating: true,
                    pinned: true,
                    backgroundColor: CommunityCoverColors.backgroundColor(context, colorsKeyProv.isColorsKeyAuto?palette:null),
                    bottom: initForum==null?null:TabBar(
                      physics: const BouncingScrollPhysics(),
                      tabs: [
                        const Tab(text: 'Informacje'),
                        if(initForum != null)
                          const Tab(text: 'Strefa zagrożenia'),
                      ],
                      indicator: AppTabBarIncdicator(
                          color: CommunityCoverColors.strongColor(context, colorsKeyProv.isColorsKeyAuto?palette:null)
                      ),
                    ),
                    actions: [
                      IconButton(
                        icon: const Icon(MdiIcons.check),
                        onPressed: () async {

                          showLoadingWidget(
                              context,
                              CommunityCoverColors.strongColor(context, colorsKeyProv.isColorsKeyAuto?palette:null),
                              initForum == null? 'Zakładanie forum...': 'Uaktualnianie...'
                          );

                          if(initForum == null)
                            await ApiForum.create(
                                description: Provider.of<DescriptionProvider>(context, listen: false).descriptionController.text,
                                coverImage: Provider.of<CoverImageProvider>(context, listen: false).coverImage,
                                colorsKey: Provider.of<ColorsKeyProvider>(context, listen: false).colorsKey,
                                community: community,
                                onSuccess: (forum) async {
                                  if(mounted) await popPage(context); // Close loading widget.
                                  if(mounted) await popPage(context);
                                  onSaved?.call(forum);
                                },
                                onServerMaybeWakingUp: () {
                                  if(mounted) popPage(context); // Close loading widget.
                                  if(mounted) showServerWakingUpToast(context);
                                  return true;
                                },
                                onError: (){
                                  if(mounted) popPage(context); // Close loading widget.
                                  onError?.call();
                                }
                            );
                          else{

                            String? description = Provider.of<DescriptionProvider>(context, listen: false).descriptionController.text;
                            if(description.isEmpty) description = null;
                            CommunityCoverImageData coverImage = Provider.of<CoverImageProvider>(context, listen: false).coverImage;
                            String? colorsKey = Provider.of<ColorsKeyProvider>(context, listen: false).colorsKey;

                            await ApiForum.update(
                                forumKey: initForum!.key,
                                community: community,

                                description:
                                initForum!.description == description?
                                null:
                                Optional.ofNullable(description),

                                coverImage:
                                initForum!.coverImage.uniqueID == coverImage.uniqueID?
                                null:
                                coverImage,

                                colorsKey:
                                initForum!.colorsKey == colorsKey?
                                null:
                                colorsKey,

                                onSuccess: (circle) async {
                                  await popPage(context); // Close loading widget.
                                  await popPage(context);
                                  onSaved?.call(circle);
                                },
                                onServerMaybeWakingUp: () {
                                  if(mounted) showServerWakingUpToast(context);
                                  return true;
                                },
                                onError: (){
                                  if(mounted) popPage(context); // Close loading widget.
                                  onError?.call();
                                }
                            );
                          }

                        },
                      )
                    ],
                  ),
                ],
                body: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    GeneralPart(
                      palette: colorsKeyProv.isColorsKeyAuto?palette:null,
                      onCoverSelected: (coverImage){
                        calcLocalBackgronudColor();
                      },
                    ),

                    if(initForum != null)
                      DangerPart(
                        initForum,
                        palette: palette,
                        onDeleted: () async {
                          Navigator.pop(context);
                          onDeleted?.call();
                        },
                      ),
                  ],
                ),

              ),
            )
        ),
      )
  );

}