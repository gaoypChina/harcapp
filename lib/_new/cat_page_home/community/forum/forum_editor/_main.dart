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
    _palette = await getPaletteGenerator(
        initForum!.coverImage.local,
        initForum!.coverImage.firstFileName
    );
    setState(() {});
  }

  @override
  void initState() {
    if(initForum != null && initForum!.colorsKey == 'auto' && palette == null)
      calcLocalBackgronudColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
      backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
      appBottomNavColor: CommunityCoverColors.backgroundColor(context, palette),
      body: DefaultTabController(
        length: initForum == null?1:2,
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => DescriptionProvider(forum: initForum)),
            ChangeNotifierProvider(create: (context) => CoverImageProvider(forum: initForum)),
            ChangeNotifierProvider(create: (context) => ColorsKeyProvider(forum: initForum))
          ],
          builder: (context, child) => NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
              SliverAppBar(
                title: Text(initForum==null?'Nowe forum':'Edytuj forum'),
                centerTitle: true,
                floating: true,
                pinned: true,
                backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
                bottom: initForum==null?null:TabBar(
                  physics: const BouncingScrollPhysics(),
                  tabs: [
                    const Tab(text: 'Informacje'),
                    if(initForum != null)
                      const Tab(text: 'Strefa zagrożenia'),
                  ],
                  indicator: AppTabBarIncdicator(
                      color: CommunityCoverColors.strongColor(context, palette)
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(MdiIcons.check),
                    onPressed: () async {

                      showLoadingWidget(
                          context,
                          CommunityCoverColors.strongColor(context, palette),
                          initForum == null? 'Zakładanie forum...': 'Uaktualnianie...'
                      );

                      if(initForum == null)
                        await ApiForum.create(
                            description: Provider.of<DescriptionProvider>(context, listen: false).descriptionController.text,
                            coverImageUrl: Provider.of<CoverImageProvider>(context, listen: false).coverImage!.code,
                            colorsKey: Provider.of<ColorsKeyProvider>(context, listen: false).colorsKey,
                            community: community,
                            onSuccess: (forum) async {
                              await popPage(context); // Close loading widget.
                              await popPage(context);
                              onSaved?.call(forum);
                            },
                            onServerMaybeWakingUp: () {
                              if(mounted) showServerWakingUpToast(context);
                              return true;
                            },
                            onError: onError
                        );
                      else{

                        String? description = Provider.of<DescriptionProvider>(context, listen: false).descriptionController.text;
                        if(description.isEmpty) description = null;
                        String? coverImageCode = Provider.of<CoverImageProvider>(context, listen: false).coverImage!.code;
                        String? colorsKey = Provider.of<ColorsKeyProvider>(context, listen: false).colorsKey;

                        await ApiForum.update(
                            forumKey: initForum!.key,
                            community: community,

                            description:
                            initForum!.description == description?
                            const Optional.empty():
                            Optional.ofNullable(description),

                            coverImageUrl:
                            initForum!.coverImage.code == coverImageCode?
                            const Optional.empty():
                            Optional.ofNullable(coverImageCode),

                            colorsKey:
                            initForum!.colorsKey == colorsKey?
                            const Optional.empty():
                            Optional.ofNullable(colorsKey),

                            onSuccess: (circle) async {
                              await popPage(context); // Close loading widget.
                              await popPage(context);
                              onSaved?.call(circle);
                            },
                            onServerMaybeWakingUp: () {
                              if(mounted) showServerWakingUpToast(context);
                              return true;
                            },
                            onError: onError
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
                GeneralPart(palette: palette),

                if(initForum != null)
                  DangerPart(
                    initForum,
                    onDeleted: (){
                      Navigator.pop(context);
                      onDeleted?.call();
                    },
                  ),
              ],
            ),

          ),
        ),
      )
  );


}