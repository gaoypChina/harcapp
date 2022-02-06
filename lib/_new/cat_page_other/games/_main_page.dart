import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_other/games/data.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class GamesPage extends StatefulWidget {

  @override
  State createState() => GamesPageState();

}

class GamesPageState extends State<GamesPage>{

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            title: Text('Gierki'),
            centerTitle: true,
            floating: true,
            backgroundColor: background_(context),
          ),

          SliverPadding(
            padding: EdgeInsets.all(Dimen.SIDE_MARG),
            sliver: SliverList(
                delegate: SliverChildSeparatedBuilderDelegate(

                  (context, index) => GameItem(data: gameList[index]),
                  separatorBuilder: (context, index) => SizedBox(height: Dimen.SIDE_MARG),

                  count: gameList.length,

                )
            ),
          )

        ],
      ),
    );

  }

}

class GameItem extends StatelessWidget{

  final GameData data;

  const GameItem({
    @required this.data
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        SizedBox(
          height: 240,
          child: Hero(
            tag: data,
            child: AppCard(
              radius: AppCard.BIG_RADIUS,
              elevation: 0,//AppCard.bigElevation,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/games/${data.coverImg}.webp'),
                        fit: BoxFit.cover,
                        alignment: data.bgAlignment
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                        Text(data.name, style: AppTextStyle(fontSize: 24.0, fontWeight: weight.bold, color: Colors.white, shadow: true), textAlign: TextAlign.center,),

                        Expanded(child: Container()),

                        Row(
                          children: [

                            Icon(MdiIcons.accountMultiple, size: 20, color: Colors.white),
                            SizedBox(width: 6),
                            Text(
                              '${data.minPlayerCount} - ${data.maxPlayerCount==-1?'...':data.maxPlayerCount}',
                              style: AppTextStyle(fontWeight: weight.bold, color: Colors.white, fontSize: Dimen.TEXT_SIZE_BIG)
                            ),

                            Expanded(child: Container()),

                          ],
                        ),

                        SizedBox(height: 24.0,),

                        InstructionRowWidget(data)
                      ],
                    ),
                  )
              ),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => data.builder(context))),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(3*Dimen.DEF_MARG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(data.description, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold))
            ],
          ),
        )

      ],
    );
  }

}

class InstructionRowWidget extends StatelessWidget{

  final GameData data;
  const InstructionRowWidget(this.data);

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
          SizedBox(width: 24.0),

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
              builder: (context) => data.builderHowToGuide(context),
            ),
          )),

      ],
    );
  }

}