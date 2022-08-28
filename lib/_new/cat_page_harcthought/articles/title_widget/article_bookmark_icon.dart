import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/providers.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../article_core.dart';

class ArticleBookmarkWidget extends StatelessWidget{

  final Article? article;
  final heroTag;
  final Color? color;

  const ArticleBookmarkWidget(this.article, {required this.heroTag, this.color});

  @override
  Widget build(BuildContext context) {

    return Hero(
      tag: heroTag,
      child: Consumer<BookmarkedArticlesProvider>(
          builder: (context, prov, child){
            bool bookmarked = prov.contains(article);
            return IconButton(
                icon: Icon(
                  bookmarked?
                  MdiIcons.bookmark:
                  MdiIcons.bookmarkOutline,
                  color: color,
                ),
                onPressed: (){
                  if(bookmarked){
                    prov.remove(article!);
                    showAppToast(context, text: 'Usunięto z zapisanych');
                  }
                  else
                  {
                    prov.add(article!);
                    showAppToast(context, text: 'Dodano do zapisanych');
                  }
                }
            );
          }
      ),
    );
  }

}