import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_page.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'trop.dart';
import 'trop_editor_page/_main.dart';
import 'trop_tile.dart';

class TropyPage extends StatelessWidget{

  const TropyPage({super.key});

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [

        const SliverAppBar(
          floating: true,
          pinned: true,
          centerTitle: true,
          title: Text('Tropy'),
        ),

        SliverPadding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
                  (BuildContext context, int index) => SimpleButton(
                    radius: AppCard.bigRadius,
                    child: TropTile(Trop.all[index]),
                    onTap: () => pushPage(
                      context,
                      builder: (BuildContext context) => TropPage(Trop.all[index])
                    ),
                  ),
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: Dimen.SIDE_MARG),
              count: Trop.all.length
          )),
        )

      ],
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.purple[900],
      child: const Icon(MdiIcons.plus),
      onPressed: () => pushPage(context, builder: (context) => const TropEditorPage())
    ),
  );

}