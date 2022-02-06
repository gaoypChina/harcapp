import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_other/games/slowo_klucz/how_to_guide/page_template.dart';
import 'package:harcapp/_new/cat_page_other/games/slowo_klucz/how_to_guide/player_widget.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';

import '../common.dart';
import 'phone_widget.dart';

class Page3 extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => Page3State();


}

class Page3State extends State<Page3> with PageTemplateInterface{

  static const Duration _shortPauseDuration = Duration(milliseconds: 400);
  static const Duration _transitDuration = Duration(milliseconds: 300);


  double leftPhoneWidth(double width){
    if(animStage == 1 || animStage == 2) return width - 2*initPlayerOffset(width);

    return 2/PhoneWidget.aspectRatio*initGridSize(width);
  }

  double rightPhoneWidth(double width){
    if(animStage == 3 || animStage == 4) return width - 2*initPlayerOffset(width);

    return 2/PhoneWidget.aspectRatio*initGridSize(width);
  }

  double leftPhoneX(double width){
    if(animStage == 1 || animStage == 2) return initPlayerOffset(width);

    return width/2 - leftPhoneWidth(width)/2;
  }

  double leftPhoneY(double width, double hight){
    if(animStage == 1 || animStage == 2) return 0;
      return hight - leftPhoneWidth(width)*PhoneWidget.aspectRatio - initPlayerOffset(width);

  }

  double rightPhoneX(double width){
    if(animStage == 0) return 2*initGridSize(width);
    if(animStage == 1 || animStage == 2) return width + initPlayerOffset(width);
    if(animStage == 3 || animStage == 4) return initPlayerOffset(width);

    return null;
  }

  double rightPhoneY(double width, double height){
    if(animStage == 0) return 0;

    return 0;
  }

  double playerRedX(double width, double height, int playerIndex){
    return initPlayerOffset(width) + 2*initPlayerOffset(width);
  }

  double playerRedY(double width, double height, int playerIndex){
    return height - (4-playerIndex)*(initGridSize(width) - initPlayerOffset(width));
  }

  double playerGreenX(double width, int playerIndex){
    return width-initGridSize(width)+initPlayerOffset(width) - 2*initPlayerOffset(width);
  }

  double playerGreenY(double width, double height, int playerIndex){
    return height - (4-playerIndex)*(initGridSize(width) - initPlayerOffset(width));
  }

  // LEADER

  double leaderRedX(double width, double height){
    return initGridSize(width)+2*initPlayerOffset(width);
  }

  double leaderRedY(double width, double height){
    return initGridSize(width) + initPlayerOffset(width);
  }

  double leaderGreenX(double width){
    return initGridSize(width)+2*initPlayerOffset(width);
  }

  double leaderGreenY(double width, double height){
    return initPlayerOffset(width);
  }

  AnimStageManager animStageManager;

  int animStage;

  bool showQRCode;
  bool showCamera;

  @override
  void initState() {

    animStageManager = AnimStageManager(
        initWaitDuration: initWaitDuration,
        stages: [
          AnimStage(
              function: () => setState(() => animStage = 1),
              after: animDuration + _shortPauseDuration),
          AnimStage( // HIGHLIGHT 1
              function: () => setState(() => animStage = 2),
              after: ScreenMainScreen.highlightDuration),
          AnimStage( // ENLARGE PHONE 1
              function: () => setState(() => animStage = 1),
              after: ScreenMainScreen.highlightDuration),
          AnimStage(
              function: () => setState(() => showQRCode = true),
              after: _transitDuration + _shortPauseDuration),
          AnimStage( // RETURN TO START
              function: () => setState(() => animStage = 0),
              after: animDuration + _shortPauseDuration),
          AnimStage( // ENLARGE PHONE 2
              function: () => setState(() => animStage = 3),
              after: animDuration + _shortPauseDuration),
          AnimStage( // HIGHLIGHT 2
              function: () => setState(() => animStage = 4),
              after: ScreenMainScreen.highlightDuration),
          AnimStage( // HIGHLIGHT 2
              function: () => setState(() => animStage = 3),
              after: ScreenMainScreen.highlightDuration),
          AnimStage( // HIGHLIGHT 2
              function: () => setState(() => showCamera = true),
              after: _transitDuration + _shortPauseDuration),
          AnimStage( // HIGHLIGHT 2
              function: () => setState(() => animStage = 0),
              after: animDuration + _shortPauseDuration),

        ],
        cleanUp: (){
          setState(() => animStage = 0);
          setState(() => showQRCode = false);
          setState(() => showCamera = false);
        },
        finishedDuration: finishDuration,
        reverseWaitDuration: reverseWaitDuration,
        isMounted: () => mounted
    );


    animStage = 0;
    showQRCode = false;
    showCamera = false;

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
                  builder: (context, width) => AnimatedChildSlider(
                    direction: Axis.horizontal,
                    duration: _transitDuration,
                    switchInCurve: curve,
                    switchOutCurve: curve,
                    index: showQRCode?1:0,
                    children: [
                      ScreenMainScreen(size: width, highlightButtonPlayers: animStage == 2),
                      ScreenQRCode(),
                    ],
                  ),
                  size: leftPhoneWidth(width),
                  duration: animDuration,
                  bottomLineDark: showQRCode,
              ),
              duration: animDuration,
              curve: curve,
            ),

            AnimatedPositioned(
              top: rightPhoneY(width, height),
              left: rightPhoneX(width),
              child: PhoneWidget(
                  builder: (context, width) => AnimatedChildSlider(
                    direction: Axis.horizontal,
                    duration: _transitDuration,
                    switchInCurve: curve,
                    switchOutCurve: curve,
                    index: showCamera?1:0,
                    children: [
                      ScreenMainScreen(size: width, highlightButtonLeader: animStage == 4),
                      ScreenCamera(),
                    ],
                  ),
                  size: rightPhoneWidth(width),
                  duration: animDuration,
                  bottomLineDark: showCamera,
              ),
              duration: animDuration,
              curve: curve,
            ),

          ],
        );

      },
      text: 'Drużyny wybierają "planszę graczy" na swoim telefonie. Wodzowie wybierają "planszę wodzów" na swoim telefonie.',
      textColor: Colors.black,
    );
  }

}