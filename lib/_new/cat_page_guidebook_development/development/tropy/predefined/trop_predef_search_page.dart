import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import '../model/trop.dart';
import '../trop_tile.dart';

class TropPredefSearchPage extends StatelessWidget{

  final List<TropBaseData> predefTrops;
  final void Function(int)? onSelected;

  const TropPredefSearchPage({
    required this.predefTrops,
    this.onSelected,
    super.key
  });

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [

        const SliverAppBar(
          title: Text('Szukaj pomysłów'),
          centerTitle: true,
          floating: true,
        ),

        SliverPadding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          sliver: SliverList(
            delegate: SliverChildSeparatedBuilderDelegate(
              (context, index) => SimpleButton(
                clipBehavior: Clip.none,
                radius: AppCard.bigRadius,
                onTap: (){
                  onSelected?.call(index);
                  Navigator.pop(context);
                },
                child: TropTile(
                  name: predefTrops[index].name,
                  category: predefTrops[index].category,
                  zuchTropName: predefTrops[index].customIconTropName,
                  iconSize: 52.0,
                  withHero: false,
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
              count: predefTrops.length
            ),
          ),
        )

      ],
    ),
  );


}