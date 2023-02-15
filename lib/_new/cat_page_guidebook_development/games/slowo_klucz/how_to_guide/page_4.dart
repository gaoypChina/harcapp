import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/slowo_klucz/how_to_guide/page_template.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/slowo_klucz/how_to_guide/player_widget.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';

import '../common.dart';
import 'phone_widget.dart';

class Page4 extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => Page4State();


}

class Page4State extends State<Page4> with PageTemplateInterface{

  static const Duration _shortPauseDuration = Duration(milliseconds: 800);
  static const Duration _transitDuration = Duration(milliseconds: 300);


  bool rightPhoneRotate() {
    return animStage == 2 || animStage == 3 || animStage == 4;
  }

  double leftPhoneWidth(double width){
    return 2/PhoneWidget.aspectRatio*initGridSize(width);
  }

  double rightPhoneWidth(double width){
    return 2/PhoneWidget.aspectRatio*initGridSize(width);
  }

  double leftPhoneX(double width){
    return width/2 - leftPhoneWidth(width)/2;
  }

  double leftPhoneY(double width, double height){
    if(animStage == 1 || animStage == 2 || animStage == 3 || animStage == 4) return height - leftPhoneWidth(width)*PhoneWidget.aspectRatio - 2*initPlayerOffset(width);

    return height - leftPhoneWidth(width)*PhoneWidget.aspectRatio - initPlayerOffset(width);

  }

  double rightPhoneX(double width){
    if(animStage == 2 || animStage == 3 || animStage == 4) return (width - rightPhoneWidth(width))/2;

    return 2*initGridSize(width);
  }

  double rightPhoneY(double width, double height){
    if(animStage == 2 || animStage == 3 || animStage == 4) return height - leftPhoneWidth(width)*PhoneWidget.aspectRatio - 2*initPlayerOffset(width);

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

  late AnimStageManager animStageManager;
  int? animStage;

  @override
  void initState() {

    animStageManager = AnimStageManager(
        initWaitDuration: initWaitDuration,
        stages: [
          AnimStage( // MOVE PHONE 1
              function: () => setState(() => animStage = 1),
              after: animDuration + _shortPauseDuration),
          AnimStage( // MOVE PHONE 2
              function: () => setState(() => animStage = 2),
              after: animDuration + _shortPauseDuration),
          AnimStage( // SCANNING
              function: () => setState(() => animStage = 3),
              after: _shortPauseDuration),
          AnimStage( // OK
              function: () => setState(() => animStage = 4),
              after: _shortPauseDuration),
          AnimStage( // TRANSITION
              function: () => setState(() => animStage = 5),
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
                  builder: (context, width) => AnimatedChildSlider(
                    switchOutCurve: curve,
                    switchInCurve: curve,
                    duration: _transitDuration,
                    direction: Axis.horizontal,
                    index: animStage == 5?1:0,
                    children: [
                     ScreenQRCode(),

                      ScreenGamePlay(withWords: true),

                    ],
                  ),
                  size: leftPhoneWidth(width),
                  duration: animDuration,
              ),
              duration: animDuration,
              curve: curve,
            ),

            AnimatedPositioned(
              top: rightPhoneY(width, height),
              left: rightPhoneX(width),
              child: AnimatedRotation(
                turns: rightPhoneRotate()?-0.25:0,
                curve: curve,
                duration: animDuration,
                child: PhoneWidget(
                  builder: (context, width) => AnimatedChildSlider(
                    switchOutCurve: curve,
                    switchInCurve: curve,
                    duration: _transitDuration,
                    direction: Axis.horizontal,
                    index: animStage == 5?1:0,
                    children: [
                      Builder(builder: (context){
                        if(animStage == 3)
                          return ScreenScanning();
                        else if(animStage == 4 || animStage == 5)
                          return ScreenCheck();

                        return ScreenCamera();
                      }),

                      ScreenGamePlay(withColors: true, withWords: true),

                    ],
                  ),
                  size: rightPhoneWidth(width),
                  duration: animDuration,
                ),
              ),
              duration: animDuration,
              curve: curve,
            ),

          ],
        );

      },
      text: 'Wodzowie skanują kod QR z telefonu drużyn. Na obu telefonach pojawią się karty z tymi samymi słowami.',
      textColor: Colors.black,
    );
  }

}