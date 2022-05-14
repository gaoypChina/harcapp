
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/article_core.dart';


class ArticleViewer extends StatefulWidget{

  final Article initArticle;
  final int initIndex;

  const ArticleViewer(this.initArticle, this.initIndex);

  @override
  State<StatefulWidget> createState() => ArticleViewerState();

}

class ArticleViewerState extends State<ArticleViewer>{

  ValueNotifier? notifier;
  PageController? controller;

  @override
  void initState() {

    notifier = ValueNotifier<double>(widget.initIndex.toDouble());
    controller = PageController(initialPage: widget.initIndex);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Text('TO ZOSTANIE WYWALONE');

    /*
    return AppScaffold(
      body: SlidingPageView(
        physics: BouncingScrollPhysics(),
        itemCount: ArticleCore.all?.length??0,
        itemBuilder: (context, index) => ArticleWidget(
          notifier,
          ArticleCore.all[index],
          index,
          article: index==widget.initIndex?widget.initArticle:null,
        ),
        extents: 2,
        controller: controller,
        notifier: notifier,
      ),
    );
*/
  }

}
