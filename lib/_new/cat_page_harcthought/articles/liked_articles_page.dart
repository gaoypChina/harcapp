import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'article_core.dart';
import 'article_list_widget.dart';

class LikedArticlesPage extends StatelessWidget{
  const LikedArticlesPage({super.key});


  @override
  Widget build(BuildContext context) {
    return BottomNavScaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            title: const Text('Polubione artykuły'),
            centerTitle: true,
            floating: true,
            forceElevated: innerBoxIsScrolled,
          )
        ],
        body: ArticleListWidget(
          Article.liked,
          emptyText: 'Brak polubionych artykułów',
          emptyIcon: MdiIcons.bookRemoveOutline,
        ),
      ),
    );
  }


}