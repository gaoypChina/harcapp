import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_guide_book/symbolika/symb_image_widget.dart';
import 'package:harcapp_core/dimen.dart';

import 'data.dart';


class AllSymbolsPage extends StatefulWidget {

  final void Function(int) onItemTap;
  const AllSymbolsPage({required this.onItemTap});

  @override
  State<AllSymbolsPage> createState() => AllSymbolsPageState();

}

class AllSymbolsPageState extends State<AllSymbolsPage> {

  @override
  Widget build(BuildContext context) {

    final orientation = MediaQuery.of(context).orientation;

    List<Widget> children = [];

    for(ItemData data in items)
      children.add(
          Hero(
            tag: data,
            child: SymbImageWidget(data, dense: true, onItemTap: () => widget.onItemTap(items.indexOf(data))),
          )
      );

    return BottomNavScaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            title: Text('Symbolika'),
            centerTitle: true,
            floating: true,
          ),

          SliverPadding(
            padding: EdgeInsets.all(Dimen.SIDE_MARG),
            sliver: SliverGrid.count(
              crossAxisCount: (orientation == Orientation.portrait) ? 3 : 5,
              mainAxisSpacing: Dimen.DEF_MARG,
              crossAxisSpacing: Dimen.DEF_MARG,
              children: children,
            ),
          )

        ],
      ),
    );
  }
}
