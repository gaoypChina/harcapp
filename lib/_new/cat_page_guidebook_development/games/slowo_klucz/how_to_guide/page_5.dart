import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/slowo_klucz/how_to_guide/page_template.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/slowo_klucz/how_to_guide/player_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

import '../common.dart';
import 'phone_widget.dart';

class Page5 extends StatefulWidget{
  const Page5({super.key});


  @override
  State<StatefulWidget> createState() => Page5State();


}

class Page5State extends State<Page5> with PageTemplateInterface{

  static const Duration _shortPauseDuration = Duration(milliseconds: 800);
  static const Duration _showMessDuration = Duration(milliseconds: 300);

  bool textOpaque() => animStage! >= 6 && animStage! <= 10;

  bool upperPhoneRotate() => animStage! >= 3;

  double bottomPhoneWidth(double width){
    if(animStage! < 3) return 2/PhoneWidget.aspectRatio*initGridSize(width);
    return 3/PhoneWidget.aspectRatio*initGridSize(width);
  }

  double upperPhoneWidth(double width){
    if(animStage! < 3) return 2/PhoneWidget.aspectRatio*initGridSize(width);
    return 3/PhoneWidget.aspectRatio*initGridSize(width);
  }

  double bottomPhoneX(double width){
    if(animStage! < 3) return width/2 - bottomPhoneWidth(width)/2;
    return initGridSize(width) + initGridSize(width)*(PhoneWidget.aspectRatio-1);
  }

  double bottomPhoneY(double width, double height){
    if(animStage! < 3) return height - bottomPhoneWidth(width)*PhoneWidget.aspectRatio - initPlayerOffset(width);
    return 3*initGridSize(width) - (PhoneWidget.aspectRatio - 1)*bottomPhoneWidth(width)/2;
  }

  double upperPhoneX(double width){
    if(animStage! < 3) return 2*initGridSize(width);
    return initGridSize(width) + initGridSize(width)*(PhoneWidget.aspectRatio-1);
  }

  double upperPhoneY(double width, double height){
    if(animStage! >= 3) return -upperPhoneWidth(width)*(PhoneWidget.aspectRatio-1)/2;
    return 0;
  }

  double playerRedX(double width, double height, int playerIndex) => initPlayerOffset(width) + 2*initPlayerOffset(width);

  double playerRedY(double width, double height, int playerIndex){
    if(animStage == 0) return height - (4-playerIndex)*(initGridSize(width) - initPlayerOffset(width));
    else return height - 3*(initGridSize(width) - initPlayerOffset(width));
  }

  double playerGreenX(double width, int playerIndex){
    return width-initGridSize(width)+initPlayerOffset(width) - 2*initPlayerOffset(width);
  }

  double playerGreenY(double width, double height, int playerIndex){
    if(animStage == 0) return height - (4-playerIndex)*(initGridSize(width) - initPlayerOffset(width));
    else return height - 3*(initGridSize(width) - initPlayerOffset(width));
  }

  // MULTI


  double multiPlayerRedX(double width, double height){
    if(animStage! < 3) return initPlayerOffset(width) + 2*initPlayerOffset(width);
    return initPlayerOffset(width);
  }

  double multiPlayerRedY(double width, double height){
    if(animStage! < 3) return height - 3*(initGridSize(width) - initPlayerOffset(width));
    else if (animStage! >= 7 && animStage! <= 10) return 3*initGridSize(width) - initPlayerOffset(width);
    return 3*initGridSize(width) + initPlayerOffset(width);
  }

  double multiPlayerGreenX(double width){
    if(animStage! < 3) return width-initGridSize(width)+initPlayerOffset(width) - 2*initPlayerOffset(width);
    return initPlayerOffset(width);
  }

  double multiPlayerGreenY(double width, double height){
    if(animStage! < 3) return height - 3*(initGridSize(width) - initPlayerOffset(width));
    else return 4*initGridSize(width) + initPlayerOffset(width);
  }

  // LEADER


  double leaderRedX(double width, double height){
    if(animStage! < 3) return initGridSize(width)+2*initPlayerOffset(width);
    return initPlayerOffset(width);
  }

  double leaderRedY(double width, double height){
    if(animStage! < 6) return initGridSize(width) + initPlayerOffset(width);
    else if(animStage == 6) return initGridSize(width) + 3*initPlayerOffset(width);
    return initGridSize(width) + initPlayerOffset(width);
  }

  double leaderGreenX(double width){
    if(animStage! < 3) return initGridSize(width)+2*initPlayerOffset(width);
    return initPlayerOffset(width);
  }

  double leaderGreenY(double width, double height) => initPlayerOffset(width);

  late AnimStageManager animStageManager;

  int? animStage;

  Color? convColor;
  String? convAuth;
  late String convText;

  @override
  void initState() {

    animStageManager = AnimStageManager(
        initWaitDuration: initWaitDuration,
        stages: [
          AnimStage( // PLAYERS IN;
              function: () => setState(() => animStage = 1),
              after: animDuration),
          AnimStage( // PLAYERS UNIFIED OUT;
              function: () => setState(() => animStage = 2),
              after: animDuration),
          AnimStage( // ROTATE, ZOOM PHONE 1
              function: () => setState(() => animStage = 3),
              after: animDuration + _shortPauseDuration),
          AnimStage( // FADE GREEN OUT
              function: () => setState(() => animStage = 4),
              after: _shortPauseDuration),
          AnimStage( // SHOW "TURA CZERWONYCH" MESSAGE
              function: () => setState(() => animStage = 5),
              after: _showMessDuration + convDuration),
          AnimStage( // ROTATE, ZOOM PHONE 1
              function: () => setState(() => animStage = 4),
              after: _showMessDuration + _shortPauseDuration),
          AnimStage(
              function: (){
                convColor = RED_COLOR;
                convAuth = 'Wódz czerwonych';
                convText = 'Słowo klucz: "Ssak 2"!';
                setState(() => animStage = 6);
              },
              after: animDuration + convDuration),
          AnimStage(
              function: () => setState(() => animStage = 4),
              after: animDuration),

          AnimStage(
              function: (){
                convAuth = 'Gracze czerwoni';
                convText = 'Dobra. Sprawdźmy co pasuje...';
                setState(() => animStage = 7);
              },
              after: animDuration + convDuration),
          AnimStage(
              function: () => setState(() => animStage = 4),
              after: animDuration),

          AnimStage(
              function: (){
                convText = '"Kot"? "Żuk"? Może "pies"?';
                setState(() => animStage = 7);
              },
              after: animDuration + convDuration),
          AnimStage(
              function: () => setState(() => animStage = 4),
              after: animDuration),

          AnimStage(
              function: (){
                convText = 'Ale to są trzy karty, a wódz podał liczbę "2".';
                setState(() => animStage = 7);
              },
              after: animDuration + convDuration),
          AnimStage(
              function: () => setState(() => animStage = 4),
              after: animDuration),

          AnimStage(
              function: (){
                convText = 'Zaraz... Czy "żuk" to ssak?';
                setState(() => animStage = 7);
              },
              after: animDuration + convDuration),
          AnimStage(
              function: () => setState(() => animStage = 4),
              after: animDuration),

          AnimStage(
              function: (){
                convText = 'Nie wiem. No nic, wybierajmy. Która karta najpierw?';
                setState(() => animStage = 7);
              },
              after: animDuration + convDuration),
          AnimStage(
              function: () => setState(() => animStage = 4),
              after: animDuration),

          AnimStage(
              function: () => setState(() => animStage = 12),
              after: animDuration),

        ],
        cleanUp: () => setState(() => animStage = 0),
        finishedDuration: finishDuration,
        reverseWaitDuration: reverseWaitDuration,
        isMounted: () => mounted
    );

    animStage = 0;
    convColor = Colors.black;
    convAuth = '';
    convText = '';
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

            AnimatedPositioned(
              top: 2*initGridSize(width),
              left: 0,
              right: 0,
              duration: animDuration,
              curve: curve,
              child: SizedBox(
                height: initGridSize(width),
                child: AnimatedOpacity(
                  opacity: textOpaque()?1:0,
                  duration: _showMessDuration,
                  curve: curve,
                  child: AppCard(
                    radius: AppCard.bigRadius,
                    elevation: AppCard.bigElevation,
                    margin: EdgeInsets.only(left: initGridSize(width)/2, top: 8.0, bottom: 8.0, right: 8.0),
                    padding: EdgeInsets.only(left:initGridSize(width)/2, top: 8.0, bottom: 8.0, right: 8.0),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                            '$convAuth:',
                            style: AppTextStyle(
                                fontSize: Dimen.TEXT_SIZE_BIG,
                                color: convColor,
                                fontWeight: weight.bold
                            )
                        ),
                        const SizedBox(height: 3.0),
                        Text(
                            convText,
                            style: AppTextStyle(
                                fontSize: Dimen.TEXT_SIZE_BIG,
                                color: Colors.black,
                                fontWeight: weight.halfBold
                            )
                        ),
                      ],
                    )
                  ),
                )
              ),
            ),

            // FIRST COLUMN

            AnimatedPositioned(
              top: leaderRedY(width, height),
              left: leaderRedX(width, height),
              duration: animDuration,
              curve: curve,
              child: const PlayerWidget(color: RED_COLOR,  type: PlayerType.LEADER),
            ),

            AnimatedPositioned(
              top: playerRedY(width, height, 1),
              left: playerRedX(width, height, 1),
              duration: animDuration,
              curve: curve,
              child: AnimatedOpacity(
                duration: animDuration,
                curve: curve,
                opacity: animStage == 0?1:0,
                child: const PlayerWidget(color: RED_COLOR),
              ),
            ),

            AnimatedPositioned(
              top: playerRedY(width, height, 2),
              left: playerRedX(width, height, 2),
              duration: animDuration,
              curve: curve,
              child: AnimatedOpacity(
                duration: animDuration,
                curve: curve,
                opacity: animStage == 0?1:0,
                child: const PlayerWidget(color: RED_COLOR),
              ),
            ),

            AnimatedPositioned(
              top: playerRedY(width, height, 3),
              left: playerRedX(width, height, 3),
              duration: animDuration,
              curve: curve,
              child: AnimatedOpacity(
                duration: animDuration,
                curve: curve,
                opacity: animStage == 0?1:0,
                child: const PlayerWidget(color: RED_COLOR),
              ),
            ),

            AnimatedPositioned(
              top: multiPlayerRedY(width, height),
              left: multiPlayerRedX(width, height),
              duration: animDuration,
              curve: curve,
              child: AnimatedOpacity(
                duration: animDuration,
                curve: curve,
                opacity: animStage == 0?0:1,
                child: const PlayerWidget(color: RED_COLOR, type: PlayerType.MULTI),
              ),
            ),

            // SECOND COLUMN

            AnimatedPositioned(
              top: leaderGreenY(width, height),
              left: leaderGreenX(width),
              duration: animDuration,
              curve: curve,
              child: AnimatedOpacity(
                duration: animDuration,
                curve: curve,
                opacity: animStage! > 3?PREV_INACTIVE_SIDE_OPACITY:1,
                child: const PlayerWidget(color: GREEN_COLOR,  type: PlayerType.LEADER),
              ),
            ),

            AnimatedPositioned(
              top: playerGreenY(width, height, 1),
              left: playerGreenX(width, 1),
              duration: animDuration,
              curve: curve,
              child: AnimatedOpacity(
                duration: animDuration,
                curve: curve,
                opacity: animStage == 0?1:0,
                child: const PlayerWidget(color: GREEN_COLOR),
              ),
            ),

            AnimatedPositioned(
              top: playerGreenY(width, height, 2),
              left: playerGreenX(width, 2),
              duration: animDuration,
              curve: curve,
              child: AnimatedOpacity(
                duration: animDuration,
                curve: curve,
                opacity: animStage == 0?1:0,
                child: const PlayerWidget(color: GREEN_COLOR),
              ),
            ),

            AnimatedPositioned(
              top: playerGreenY(width, height, 3),
              left: playerGreenX(width, 3),
              duration: animDuration,
              curve: curve,
              child: AnimatedOpacity(
                duration: animDuration,
                curve: curve,
                opacity: animStage == 0?1:0,
                child: const PlayerWidget(color: GREEN_COLOR),
              ),
            ),

            AnimatedPositioned(
              top: multiPlayerGreenY(width, height),
              left: multiPlayerGreenX(width),
              duration: animDuration,
              curve: curve,
              child: AnimatedOpacity(
                duration: animDuration,
                curve: curve,
                opacity: animStage == 0?0:(animStage! > 3?PREV_INACTIVE_SIDE_OPACITY:1),
                child: const PlayerWidget(color: GREEN_COLOR, type: PlayerType.MULTI),
              ),
            ),

            // PHONES

            AnimatedPositioned(
              top: bottomPhoneY(width, height),
              left: bottomPhoneX(width),
              duration: animDuration,
              curve: curve,
              child: AnimatedRotation(
                turns: upperPhoneRotate()?-.25:0,
                curve: curve,
                duration: animDuration,
                child: PhoneWidget(
                  builder: (context, width) => const ScreenGamePlay(withWords: true),
                  size: bottomPhoneWidth(width),
                  duration: animDuration,
                ),
              ),
            ),

            AnimatedPositioned(
              top: upperPhoneY(width, height),
              left: upperPhoneX(width),
              duration: animDuration,
              curve: curve,
              child: AnimatedRotation(
                turns: upperPhoneRotate()?-.25:0,
                curve: curve,
                duration: animDuration,
                child: PhoneWidget(
                  builder: (context, width) => const ScreenGamePlay(withColors: true, withWords: true),
                  size: upperPhoneWidth(width),
                  duration: animDuration,
                ),
              ),
            ),

            AnimatedPositioned(
              top: 2*initGridSize(width),
              left: animStage == 5?0:-width,
              right: 0,
              duration: animDuration,
              curve: curve,
              child: AnimatedOpacity(
                opacity: animStage == 5?1:0,
                duration: animDuration,
                curve: curve,
                child: SizedBox(
                  height: initGridSize(width),
                  child: Center(
                    child: Text(
                      'Tura czerwonych',
                      style: AppTextStyle(color: RED_COLOR, fontSize: 24.0, fontWeight: weight.bold, shadow: true),
                      textAlign: TextAlign.center,
                    ),
                  )
                ),
              )
            ),

          ],
        );

      },
      text: 'Wodzowie na zmianę podają swoim drużynom "słowo klucz" i liczbę kart. Zadanie graczy: pierwsi odkryć wszystkie karty swojego koloru.',
      textColor: Colors.black,
    );
  }

}