import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/_main_page.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'data.dart';

class GameWidget extends StatelessWidget{

  static const double defHeight = 240;

  final GameData data;
  final double height;
  final bool showHelpButtons;

  const GameWidget(this.data, {this.height = defHeight, this.showHelpButtons = true, super.key});

  @override
  Widget build(BuildContext context) => Column(
      children: [

        SizedBox(
          height: height,
          child: Hero(
            tag: data,
            child: AppCard(
              radius: AppCard.bigRadius,
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
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                        Text(data.name, style: AppTextStyle(fontSize: 24.0, fontWeight: weight.bold, color: Colors.white, shadow: true), textAlign: TextAlign.center,),

                        Expanded(child: Container()),

                        Row(
                          children: [

                            Icon(MdiIcons.accountMultiple, size: 20, color: Colors.white),
                            const SizedBox(width: 6),
                            Text(
                                '${data.minPlayerCount} - ${data.maxPlayerCount==-1?'...':data.maxPlayerCount}',
                                style: AppTextStyle(fontWeight: weight.bold, color: Colors.white, fontSize: Dimen.TEXT_SIZE_BIG)
                            ),

                            Expanded(child: Container()),

                          ],
                        ),

                        if(showHelpButtons)
                          const SizedBox(height: 24.0,),

                        if(showHelpButtons)
                          InstructionRowWidget(data)
                      ],
                    ),
                  )
              ),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => data.builder(context))),
            ),
          ),
        ),

        if(showHelpButtons)
          Padding(
            padding: const EdgeInsets.all(3*Dimen.defMarg),
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