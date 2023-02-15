import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/slowo_klucz/how_to_guide/page_template.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/slowo_klucz/how_to_guide/player_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../common.dart';

class Page1 extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => Page1State();


}

class Page1State extends State<Page1> with PageTemplateInterface{

  static const Duration _pauseDuration = Duration(milliseconds: 2000);

  static const Curve _curve = Curves.easeInOutQuart;

  GlobalKey<FlipCardState>? redKey, greenKey;
  int? animStage;
  late bool showSwipeHint;
  late AnimStageManager animStageManager;

  @override
  void initState() {

    animStageManager = AnimStageManager(
        initWaitDuration: initWaitDuration,
        stages: [
          AnimStage(
            function: () => setState(() => animStage = 1),
            after: animDuration + _pauseDuration),
          AnimStage(
              function: () => setState(() => animStage = 2),
              after: animDuration),
          AnimStage(
              function: (){
                redKey!.currentState!.toggleCard();
                greenKey!.currentState!.toggleCard();
              },
              after: animDuration),
        ],
        cleanUp: (){
          redKey!.currentState!.toggleCard();
          greenKey!.currentState!.toggleCard();
          showSwipeHint = true;
          animStage = 0;
          setState((){});
        },
        finishedDuration: finishDuration,
        reverseWaitDuration: reverseWaitDuration,
        isMounted: () => mounted
    );

    redKey = GlobalKey<FlipCardState>();
    greenKey = GlobalKey<FlipCardState>();

    animStage = 0;
    showSwipeHint = false;

    animStageManager.run();

    super.initState();
  }


  double? leaderRedX(width){
    if (animStage == 0) return 0;
    else if (animStage == 1) return initGridSize(width);
    else if (animStage == 2) return 0;
    return null;
  }

  double? leaderRedY(width){
    if (animStage == 0 || animStage == 1) return initPlayerOffset(width);
    else if (animStage == 2) return initGridSize(width)+initPlayerOffset(width);
    return null;
  }

  double? player1RedX(double width){
    if (animStage == 0) return 2*initGridSize(width) + initPlayerOffset(width);
    else if (animStage == 1 || animStage == 2) return initPlayerOffset(width);
    return null;
  }

  double? player1RedY(double width, double height){
    if (animStage == 0) return 0;
    else if (animStage == 1) return 3*initGridSize(width);
    else if(animStage == 2) return height - 2*initGridSize(width);
    return null;
  }

  double player2RedX(double width){
    return initPlayerOffset(width);
  }

  double? player2RedY(double width, double height){
    if (animStage == 0) return initGridSize(width);
    else if (animStage == 1) return 2*initGridSize(width);
    else if (animStage == 2) return height - 3*initGridSize(width);
    return null;
  }

  player3RedX(double width){
    if (animStage == 0) return initGridSize(width) + initPlayerOffset(width);
    else if(animStage == 1 || animStage == 2) return initPlayerOffset(width);
  }

  player3RedY(double width, double height){
    if(animStage == 0) return initGridSize(width);
    else if(animStage == 1) return 4*initGridSize(width);
    else if(animStage == 2) return height - 1*initGridSize(width);
    return null;
  }

  double? leaderGreenX(double width){
    if (animStage == 0) return initGridSize(width) + initPlayerOffset(width);
    else if(animStage == 1) return width-initGridSize(width)+initPlayerOffset(width);
    else if(animStage == 2) return width-2*initGridSize(width)+initPlayerOffset(width);
    return null;
  }

  double? leaderGreenY(double width){
    if (animStage == 0) return 0;
    else if (animStage == 1) return initGridSize(width);
    else if (animStage == 2) return 0;
    return null;
  }

  double player1GreenX(double width, double height){
    return width - initGridSize(width) + initPlayerOffset(width);
  }

  double? player1GreenY(double width, double height){
    if (animStage == 0) return 0;
    else if(animStage == 1) return width-initGridSize(width);
    else if(animStage == 2) return height - 2*initGridSize(width);
    return null;
  }

  player2GreenX(double width){
    if(animStage == 0) return 2*initGridSize(width) + initPlayerOffset(width);
    else if(animStage == 1 || animStage == 2) return width-initGridSize(width)+initPlayerOffset(width);
  }

  double? player2GreenY(double width, double height){
    if(animStage == 0) return initGridSize(width);
    else if (animStage == 1) return 2*initGridSize(width);
    else if (animStage == 2) return height - 3*initGridSize(width);
    return null;
  }

  double player3GreenX(double width){
    return width-initGridSize(width)+initPlayerOffset(width);
  }

  double? player3GreenY(double width, double height){
    if(animStage == 0) return initGridSize(width);
    else if(animStage == 1) return 4*initGridSize(width);
    else if(animStage == 2) return height - 1*initGridSize(width);
    return null;
  }

  @override
  Widget build(BuildContext context) {

    return PageTemplate(
      totalInitWaitDuration: animStageManager.initWaitDuration,
      totalAnimDuration: animStageManager.allStagesDuration(),
      totalFinishedDuration: animStageManager.finishedDuration,
      totalReverseWaitDuration: animStageManager.reverseWaitDuration,
      builder: (context, width, height){

        return Stack(
          children: [

            Positioned.fill(
              child: AnimatedOpacity(
                opacity: showSwipeHint?1:0,
                duration: animDuration,
                child: EmptyMessageWidget(
                  icon: MdiIcons.gestureSwipeLeft,
                  text: 'Przewiń,\nby kontynuować',
                  color: Colors.white54,
                ),
              ),
            ),

            // FIRST COLUMN

            AnimatedPositioned(
              top: leaderRedX(width),
              left: leaderRedY(width),
              child: FlipCard(
                key: redKey,
                front: PlayerWidget(color: RED_COLOR, showColor: animStage!=0),
                back: PlayerWidget(color: RED_COLOR, type: PlayerType.LEADER),
                flipOnTouch: false,
              ),
              duration: animDuration,
              curve: _curve,
            ),

            AnimatedPositioned(
              top: player2RedY(width, height),
              left: player2RedX(width),
              child: PlayerWidget(color: RED_COLOR, showColor: animStage!=0),
              duration: animDuration,
              curve: _curve,
            ),

            AnimatedPositioned(
              top: player1RedY(width, height),
              left: player1RedX(width),
              child: PlayerWidget(color: RED_COLOR, showColor: animStage!=0),
              duration: animDuration,
              curve: _curve,
            ),

            AnimatedPositioned(
              top: player3RedY(width, height),
              left: player3RedX(width),
              child: PlayerWidget(color: RED_COLOR, showColor: animStage!=0),
              duration: animDuration,
              curve: _curve,
            ),

            // SECOND COLUMN

            AnimatedPositioned(
              top: leaderGreenY(width),
              left: leaderGreenX(width),
              child: FlipCard(
                key: greenKey,
                front: PlayerWidget(color: GREEN_COLOR, showColor: animStage!=0),
                back: PlayerWidget(color: GREEN_COLOR,  type: PlayerType.LEADER),
                flipOnTouch: false,
              ),
              duration: animDuration,
              curve: _curve,
            ),

            AnimatedPositioned(
              top: player1GreenY(width, height),
              left: player1GreenX(width, height),
              child: PlayerWidget(color: GREEN_COLOR, showColor: animStage!=0),
              duration: animDuration,
              curve: _curve,
            ),

            AnimatedPositioned(
              top: player2GreenY(width, height),
              left: player2GreenX(width),
              child: PlayerWidget(color: GREEN_COLOR, showColor: animStage!=0),
              duration: animDuration,
              curve: _curve,
            ),

            AnimatedPositioned(
              top: player3GreenY(width, height),
              left: player3GreenX(width),
              child: PlayerWidget(color: GREEN_COLOR, showColor: animStage!=0),
              duration: animDuration,
              curve: _curve,
            ),

          ],
        );

      },
      text: 'Podzielcie się na dwie grupy: czerwoną i zieloną. Z każdej drużyny wybierzcie po jednym wodzu drużyny.',
      textColor: Colors.black,
    );
  }

}