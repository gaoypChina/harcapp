import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../common/community_cover_colors.dart';
import '../../cover_image.dart';
import 'forum_page.dart';
import 'model/forum.dart';

class ForumDescriptionPage extends StatefulWidget{

  final Forum forum;
  final PaletteGenerator? palette;
  final void Function()? onDeleted;

  const ForumDescriptionPage(this.forum, this.palette, {this.onDeleted, super.key});

  @override
  State<StatefulWidget> createState() => ForumDescriptionPageState();

}

class ForumDescriptionPageState extends State<ForumDescriptionPage>{

  Forum get forum => widget.forum;
  PaletteGenerator? get palette => widget.palette;

  void Function()? get onDeleted => widget.onDeleted;

  late ScrollController scrollController;

  late GlobalKey appBarKey;

  late AppBarProvider appBarProv;

  @override
  void initState() {

    appBarKey = GlobalKey();

    scrollController = ScrollController();
    scrollController.addListener(() {
      double topPadding = MediaQuery.of(context).padding.top;
      final appBarBox = appBarKey.currentContext?.findRenderObject() as RenderBox?;
      double appBarPos = appBarBox==null? -double.infinity: appBarBox.localToGlobal(Offset(0, -topPadding)).dy;
      if (appBarPos < kToolbarHeight && !appBarProv.showTitleOnAppBar) appBarProv.showTitleOnAppBar = true;
      else if(appBarPos >= kToolbarHeight && appBarProv.showTitleOnAppBar) appBarProv.showTitleOnAppBar = false;

      if (appBarPos < 2*kToolbarHeight && appBarProv.coverVisible) appBarProv.coverVisible = false;
      else if(appBarPos >= 2*kToolbarHeight && !appBarProv.coverVisible) appBarProv.coverVisible = true;

    });

    super.initState();
  }

  @override
  void dispose(){
    scrollController.dispose();
    super.dispose();
  }

  void notifyScrollController() => post(() => scrollController.jumpTo(scrollController.offset + 1e-10));

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
    appBottomNavColor: CommunityCoverColors.backgroundColor(context, palette),
    body: ChangeNotifierProvider(
      create: (context){
        appBarProv = AppBarProvider();
        return appBarProv;
      },
      builder: (context, child) => CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [

            Consumer<AppBarProvider>(
              builder: (context, prov, child) => SliverAppBar(
                iconTheme: IconThemeData(
                    color:
                    prov.coverVisible?
                    CommunityCoverColors.coverIconColor(context, palette):
                    iconEnab_(context)
                ),
                centerTitle: true,
                pinned: true,
                excludeHeaderSemantics: true,
                elevation: prov.elevated?AppCard.bigElevation:0,
                backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                    title: AnimatedOpacity(
                      opacity: prov.showTitleOnAppBar?1:0,
                      duration: Duration(milliseconds: prov.showTitleOnAppBar?200:0),
                      child: Text(
                        forum.name,
                        style: AppTextStyle(
                            color: iconEnab_(context)
                        ),
                        maxLines: 1,
                      ),
                    ),
                    centerTitle: true,
                    background: Hero(
                        tag: ForumPageState.forumCoverTag,
                        child: Stack(
                          fit: StackFit.expand,
                          clipBehavior: Clip.none,
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(bottom: 24.0),
                              child: CoverImage(forum.coverImage),
                            ),

                            Positioned(
                              left: Dimen.SIDE_MARG,
                              bottom: 0,
                              child: Material(
                                borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
                                clipBehavior: Clip.hardEdge,
                                color: CommunityCoverColors.cardColor(context, palette),
                                child: Padding(
                                  padding: const EdgeInsets.all(Dimen.ICON_MARG),
                                  child: Icon(
                                    CommonIconData.ALL[forum.community.iconKey],
                                    size: 48.0,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                    ),

                ),
              ),
            ),

            SliverList(delegate: SliverChildListDelegate([

              Padding(
                  padding: const EdgeInsets.only(
                    top: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                    left: Dimen.SIDE_MARG,
                    right: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                    bottom: Dimen.SIDE_MARG,
                  ),
                  child: Hero(
                      tag: ForumPageState.forumNameTag,
                      child: Material(
                        color: Colors.transparent,
                        child: Row(
                          children: [

                            Expanded(
                              child:  Text(
                                forum.name,
                                style: AppTextStyle(
                                    fontSize: 28.0,
                                    fontWeight: weight.bold
                                ),
                                key: appBarKey,
                              ),
                            ),

                            IconButton(
                              icon: const Icon(MdiIcons.chevronUp),
                              onPressed: () => popPage(context),
                            )

                          ],
                        ),
                      )
                  )
              ),

              if(forum.hasDescription)
                Padding(
                  padding: const EdgeInsets.only(
                    left: Dimen.SIDE_MARG - TitleShortcutRowWidget.textStartPadding,
                  ),
                  child: TitleShortcutRowWidget(
                    title: 'Opis',
                    titleColor: hintEnab_(context),
                    textAlign: TextAlign.start,
                  ),
                ),

              if(forum.hasDescription)
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                    child: ExpandableText(
                      forum.description!,
                      style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, height: 1.2),
                      maxLines: 8,
                      animation: true,
                      linkColor: CommunityCoverColors.strongColor(context, palette),
                      linkStyle: AppTextStyle(fontWeight: weight.halfBold),
                      expandText: 'więcej',
                      collapseText: 'mniej',
                    )
                ),

            ]))

          ]
      )
    ),
  );


}

