import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_harcthought/konspekty/konspekt.dart';
import 'package:harcapp_core/dimen.dart';

import '../_main.dart';
import 'konspekt_thumbnail_widget.dart';

class KonspektsPage extends StatefulWidget{

  final List<Konspekt> allKonspekts;

  const KonspektsPage(this.allKonspekts, {super.key});
  
  @override
  State<StatefulWidget> createState() => KonspektsPageState();

}

class KonspektsPageState extends State<KonspektsPage>{

  List<Konspekt> get allKonspekts => widget.allKonspekts;
  
  late List<Konspekt> searchedKonspekts;

  @override
  void initState() {
    searchedKonspekts = [];
    searchedKonspekts.addAll(allKonspekts);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [

        const SliverAppBar(
          title: Text('Inspiracje na konspekty'),
          centerTitle: true,
          floating: true,
          elevation: 0,
        ),

        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
              (context, index) => SizedBox(
                height: FormsScrollView.height,
                child: KonspektThumbnailWidget(searchedKonspekts[index]),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
              count: searchedKonspekts.length,
          ))
        ),

      ],
    ),
  );

}