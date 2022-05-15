import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/search_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'article_core.dart';
import 'article_list_widget.dart';

class AllArticlesPage extends StatelessWidget{

  const AllArticlesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavScaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            title: const Text('Wszystkie artykuły'),
            centerTitle: true,
            floating: true,
            actions: [
              IconButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ArticleSearchPage(
                            Article.all??[],
                          )
                      )
                  ),
                  icon: const Icon(MdiIcons.magnify)
              )
            ],
          )
        ],
        body: ArticleListWidget(
            Article.all??[]
        ),
      ),
    );
  }


}