import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/symbolika/symb_image_widget.dart';
import 'package:harcapp_core/dimen.dart';

import 'data.dart';


class AllSymbolsPage extends StatefulWidget {

  final void Function(int) onItemTap;
  const AllSymbolsPage({required this.onItemTap, super.key});

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
        physics: const BouncingScrollPhysics(),
        slivers: [

          const SliverAppBar(
            title: Text('Symbolika'),
            centerTitle: true,
            floating: true,
          ),

          SliverPadding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            sliver: SliverGrid.count(
              crossAxisCount: (orientation == Orientation.portrait) ? 3 : 5,
              mainAxisSpacing: Dimen.defMarg,
              crossAxisSpacing: Dimen.defMarg,
              children: children,
            ),
          )

        ],
      ),
    );
  }
}
