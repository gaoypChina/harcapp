import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import '../trop_tile.dart';
import 'trop_idea.dart';

class TropIdeasSearchPage extends StatelessWidget{

  final List<TropIdea> ideas;
  final void Function(int)? onSelected;

  const TropIdeasSearchPage({
    required this.ideas,
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
                  name: ideas[index].name,
                  category: ideas[index].category,
                  iconSize: 52.0,
                  withHero: false,
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
              count: ideas.length
            ),
          ),
        )

      ],
    ),
  );


}