import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'article_core.dart';
import 'article_list_widget.dart';

class BookmarkedArticlesPage extends StatelessWidget{

  const BookmarkedArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavScaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            title: const Text('Zapisane artykuły'),
            centerTitle: true,
            floating: true,
            forceElevated: innerBoxIsScrolled,
          )
        ],
        body: ArticleListWidget(
          Article.bookmarked,
          emptyText: 'Brak zapisanych artykułów',
          emptyIcon: MdiIcons.bookRemoveOutline,
        ),
      ),
    );
  }


}