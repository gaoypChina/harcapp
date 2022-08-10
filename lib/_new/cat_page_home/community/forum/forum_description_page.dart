import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../common/community_cover_colors.dart';
import '../community_sliver_app_bar.dart';
import 'common/follow_button.dart';
import 'common/like_button.dart';
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

  late GlobalKey nameWidgetKey;

  @override
  void initState() {

    nameWidgetKey = GlobalKey();

    scrollController = ScrollController();

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
        return AppBarProvider();
      },
      builder: (context, child) => CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [

            CommunitySliverAppBar(
              forum.community,
              palette: palette,
              coverImage: forum.coverImage,
              mainScrollController: scrollController,
              communityNameWidgetKey: nameWidgetKey,
              heroTag: ForumPageState.forumCoverTag,
              bottomWidgets: [
                ForumFollowButton(forum, palette: palette),

                const SizedBox(width: Dimen.DEF_MARG),

                ForumLikeButton(forum, palette: palette),
              ],
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
                                key: nameWidgetKey,
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

