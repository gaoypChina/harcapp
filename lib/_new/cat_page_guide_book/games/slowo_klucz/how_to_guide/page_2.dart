import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guide_book/games/slowo_klucz/how_to_guide/page_template.dart';
import 'package:harcapp/_new/cat_page_guide_book/games/slowo_klucz/how_to_guide/player_widget.dart';

import '../common.dart';
import 'phone_widget.dart';

class Page2 extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => Page2State();


}

class Page2State extends State<Page2> with PageTemplateInterface{

  static const Duration _pauseDuration = Duration(milliseconds: 2000);

  int animStage;

  double phoneWidth(double width){
    if(animStage == 0 || animStage == 1)
      return initGridSize(width)/PhoneWidget.aspectRatio;

    if(animStage == 2 || animStage == 3)
      return 2/PhoneWidget.aspectRatio*initGridSize(width);

    return null;
  }

  double leftPhoneX(double width){
    if(animStage == 0) return -2*initGridSize(width);
    if(animStage == 1) return (initGridSize(width) - phoneWidth(width))/2;
    if(animStage == 2 || animStage == 3) return width/2 - phoneWidth(width)/2;

    return null;
  }

  double leftPhoneY(double width, double hight){
    if(animStage == 0) return initGridSize(width);
    if(animStage == 1) return initGridSize(width);
    if(animStage == 2 || animStage == 3) return hight - phoneWidth(width)*PhoneWidget.aspectRatio - initPlayerOffset(width);

    return null;
  }

  double rightPhoneX(double width){
    if(animStage == 0) return width + 2*initGridSize(width);
    if(animStage == 1) return 3*initGridSize(width) + (initGridSize(width) - phoneWidth(width))/2;
    if(animStage == 2 || animStage == 3) return 2*initGridSize(width);

    return null;
  }

  double rightPhoneY(double width, double height){
    if(animStage == 0) return initGridSize(width);
    if(animStage == 1) return initGridSize(width);
    if(animStage == 2 || animStage == 3) return 0;

    return null;
  }

  double playerRedX(double width, double height, int playerIndex){
    if(animStage == 0) return initPlayerOffset(width);
    if(animStage == 1) return initPlayerOffset(width);
    if(animStage == 2) return initPlayerOffset(width);
    if(animStage == 3) return initPlayerOffset(width) + 2*initPlayerOffset(width);

    return null;
  }

  double playerRedY(double width, double height, int playerIndex){
    if(animStage == 0) return height - (4-playerIndex)*initGridSize(width);
    if(animStage == 1) return height - (4-playerIndex)*initGridSize(width);
    if(animStage == 2 || animStage == 3) return height - (4-playerIndex)*(initGridSize(width) - initPlayerOffset(width));

    return null;
  }

  double playerGreenX(double width, int playerIndex){
    if(animStage == 0) return 3*initGridSize(width)+initPlayerOffset(width);
    if(animStage == 1) return 3*initGridSize(width)+initPlayerOffset(width);
    if(animStage == 2) return width-initGridSize(width)+initPlayerOffset(width);
    if(animStage == 3) return width-initGridSize(width)+initPlayerOffset(width) - 2*initPlayerOffset(width);

    return null;
  }

  double playerGreenY(double width, double height, int playerIndex){
    if(animStage == 0 || animStage == 1) return height - (4-playerIndex)*initGridSize(width);
    if(animStage == 2 || animStage == 3) return height - (4-playerIndex)*(initGridSize(width) - initPlayerOffset(width));

    return null;
  }

  // LEADER

  double leaderRedX(double width, double height){
    if(animStage == 0) return initGridSize(width)+initPlayerOffset(width);
    if(animStage == 1) return initGridSize(width)+initPlayerOffset(width);
    if(animStage == 2) return initGridSize(width)+initPlayerOffset(width);
    if(animStage == 3) return initGridSize(width)+2*initPlayerOffset(width);

    return null;
  }

  double leaderRedY(double width, double height){
    if(animStage == 0) return 0;
    if(animStage == 1) return 0;
    if(animStage == 2) return initGridSize(width) + initPlayerOffset(width);
    if(animStage == 3) return initGridSize(width) + initPlayerOffset(width);

    return null;
  }

  double leaderGreenX(double width){
    if(animStage == 0) return 2*initGridSize(width)+initPlayerOffset(width);
    if(animStage == 1) return 2*initGridSize(width)+initPlayerOffset(width);
    if(animStage == 2) return initGridSize(width)+initPlayerOffset(width);
    if(animStage == 3) return initGridSize(width)+2*initPlayerOffset(width);

    return null;
  }

  double leaderGreenY(double width, double height){
    if(animStage == 0) return 0;
    if(animStage == 1) return 0;
    if(animStage == 2) return initPlayerOffset(width);
    if(animStage == 3) return initPlayerOffset(width);

    return null;
  }

  AnimStageManager animStageManager;

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
              function: () => setState(() => animStage = 3),
              after: animDuration),
        ],
        cleanUp: () => setState(() => animStage = 0),
        finishedDuration: finishDuration,
        reverseWaitDuration: reverseWaitDuration,
        isMounted: () => mounted
    );

    animStage = 0;
    animStageManager.run();

    super.initState();
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

            // FIRST COLUMN

            AnimatedPositioned(
              top: leaderRedY(width, height),
              left: leaderRedX(width, height),
              child: PlayerWidget(color: RED_COLOR,  type: PlayerType.LEADER),
              duration: animDuration,
              curve: curve,
            ),

            AnimatedPositioned(
              top: playerRedY(width, height, 1),
              left: playerRedX(width, height, 1),
              child: PlayerWidget(color: RED_COLOR),
              duration: animDuration,
              curve: curve,
            ),

            AnimatedPositioned(
              top: playerRedY(width, height, 2),
              left: playerRedX(width, height, 2),
              child: PlayerWidget(color: RED_COLOR),
              duration: animDuration,
              curve: curve,
            ),

            AnimatedPositioned(
              top: playerRedY(width, height, 3),
              left: playerRedX(width, height, 3),
              child: PlayerWidget(color: RED_COLOR),
              duration: animDuration,
              curve: curve,
            ),

            // SECOND COLUMN

            AnimatedPositioned(
              top: leaderGreenY(width, height),
              left: leaderGreenX(width),
              child: PlayerWidget(color: GREEN_COLOR,  type: PlayerType.LEADER),
              duration: animDuration,
              curve: curve,
            ),

            AnimatedPositioned(
              top: playerGreenY(width, height, 1),
              left: playerGreenX(width, 1),
              child: PlayerWidget(color: GREEN_COLOR),
              duration: animDuration,
              curve: curve,
            ),

            AnimatedPositioned(
              top: playerGreenY(width, height, 2),
              left: playerGreenX(width, 2),
              child: PlayerWidget(color: GREEN_COLOR),
              duration: animDuration,
              curve: curve,
            ),

            AnimatedPositioned(
              top: playerGreenY(width, height, 3),
              left: playerGreenX(width, 3),
              child: PlayerWidget(color: GREEN_COLOR),
              duration: animDuration,
              curve: curve,
            ),

            // PHONES

            AnimatedPositioned(
              top: leftPhoneY(width, height),
              left: leftPhoneX(width),
              child: PhoneWidget(
                  builder: (context, width) => ScreenMainScreen(size: width),
                  size: phoneWidth(width),
                  duration: animDuration,
              ),
              duration: animDuration,
              curve: curve,
            ),

            AnimatedPositioned(
              top: rightPhoneY(width, height),
              left: rightPhoneX(width),
              child: PhoneWidget(
                  builder: (context, width) => ScreenMainScreen(size: width),
                  size: phoneWidth(width),
                  duration: animDuration,
              ),
              duration: animDuration,
              curve: curve,
            ),

          ],
        );

      },
      text: 'Przygotujcie dwa telefony. Z pierwszego będą korzystali wodzowie, z drugiego pozostali gracze.',
      textColor: Colors.black,
    );
  }

}