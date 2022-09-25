import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/post_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import '../common/community_cover_colors.dart';
import 'model/post.dart';

class PostExpandedPage extends StatelessWidget{

  final Post post;
  final PaletteGenerator? palette;
  final bool showCommunityInfo;
  final bool displayAttendancePage;
  final void Function()? onPostUpdated;

  const PostExpandedPage(
      this.post,
      { this.palette,
        this.showCommunityInfo = false,
        this.displayAttendancePage = false,
        this.onPostUpdated,
        Key? key
      }) : super(key: key);

  static bool enablesResp = false;

  @override
  Widget build(BuildContext context) => Consumer<PostProvider>(
    builder: (context, prov, child) => BottomNavScaffold(
      backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
      appBottomNavColor: CommunityCoverColors.backgroundColor(context, palette),
      body: DefaultTabController(
        length: enablesResp?2:1,
        initialIndex: enablesResp && displayAttendancePage?1:0,
        child: ExtendedNestedScrollView(
          floatHeaderSlivers: true,
          physics: const BouncingScrollPhysics(),
          pinnedHeaderSliverHeightBuilder: () => const TabBar(tabs: []).preferredSize.height,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [

            SliverAppBar(
              title: Text(
                post.hasTitle?post.title!:post.text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              centerTitle: true,
              floating: true,
              pinned: true,
              forceElevated: innerBoxIsScrolled,
              backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
              bottom: enablesResp?TabBar(
                tabs: const [
                  Tab(text: 'Post'),
                ],
                indicator: AppTabBarIncdicator(
                    color: CommunityCoverColors.strongColor(context, palette)
                ),
              ):null,
            ),

          ],
          body: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [

                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(Dimen.defMarg),
                  child: PostWidget(
                      post,
                      palette,
                      shrinkText: false,
                      disableTap: true,
                      onPostUpdated: onPostUpdated,
                      showCommunityInfo: showCommunityInfo,
                      constrainImage: false
                  ),
                ),

              ]
          ),
        ),
      ),
    )
  );

}