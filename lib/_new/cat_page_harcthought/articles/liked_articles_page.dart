import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/search_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'article_core.dart';
import 'article_list_widget.dart';

class LikedArticlesPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BottomNavScaffold(
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text('Polubione artykuły'),
            centerTitle: true,
            floating: true,
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