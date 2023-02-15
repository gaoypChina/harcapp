import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/data.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'game_widget.dart';


class GamesPage extends StatefulWidget {

  const GamesPage({super.key});

  @override
  State createState() => GamesPageState();

}

class GamesPageState extends State<GamesPage>{

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            title: const Text('Gierki'),
            centerTitle: true,
            floating: true,
            backgroundColor: background_(context),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            sliver: SliverList(
                delegate: SliverChildSeparatedBuilderDelegate(

                  (context, index) => GameWidget(gameList[index]),
                  separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),

                  count: gameList.length,

                )
            ),
          )

        ],
      ),
    );

  }

}

class InstructionRowWidget extends StatelessWidget{

  final GameData data;
  const InstructionRowWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Expanded(child: SimpleButton.from(
          icon: MdiIcons.textBoxOutline,
          text: 'Zasady',
          textColor: Colors.white,
          color: Colors.white54,
          margin: EdgeInsets.zero,
          elevation: AppCard.bigElevation,
          onTap: () => showScrollBottomSheet(
            context: context,
            builder: (context) => BottomSheetDef(
              title: 'Zasady gry',
              builder: (context) => data.builderHowToDescription(context),
            ),
          ),
        )),

        if(data.builderHowToGuide != null)
          const SizedBox(width: 24.0),

        if(data.builderHowToGuide != null)
          Expanded(child: SimpleButton.from(
            icon: MdiIcons.cardsPlayingOutline,
            text: 'Samoucz.',
            textColor: Colors.white,
            color: Colors.white54,
            margin: EdgeInsets.zero,
            elevation: AppCard.bigElevation,
            onTap: () => openDialog(
              context: context,
              builder: (context) => data.builderHowToGuide!(context),
            ),
          )),

      ],
    );
  }

}