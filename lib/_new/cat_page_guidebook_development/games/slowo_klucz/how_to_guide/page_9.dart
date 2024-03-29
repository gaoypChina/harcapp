import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/slowo_klucz/common/preview_cards_grid_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/slowo_klucz/how_to_guide/page_template.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/slowo_klucz/how_to_guide/player_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

import '../common.dart';
import 'phone_widget.dart';

class Page9 extends StatefulWidget{
  const Page9({super.key});


  @override
  State<StatefulWidget> createState() => Page9State();


}

class Page9State extends State<Page9> with PageTemplateInterface{

  static const Duration _showMessDuration = Duration(milliseconds: 300);

  bool textOpaque(){
    return animStage == 1 || animStage == 2 || animStage == 3;
  }

  double bottomPhoneWidth(double width) => 3/PhoneWidget.aspectRatio*initGridSize(width);

  double upperPhoneWidth(double width) => 3/PhoneWidget.aspectRatio*initGridSize(width);

  double bottomPhoneX(double width) => initGridSize(width) + initGridSize(width)*(PhoneWidget.aspectRatio-1);

  double bottomPhoneY(double width, double height) => 3*initGridSize(width) - (PhoneWidget.aspectRatio - 1)*bottomPhoneWidth(width)/2;

  double upperPhoneX(double width) => initGridSize(width) + initGridSize(width)*(PhoneWidget.aspectRatio-1);

  double upperPhoneY(double width, double height) => 0 - (PhoneWidget.aspectRatio - 1)*bottomPhoneWidth(width)/2;

  // MULTI


  double multiPlayerRedX(double width, double height){
    return initPlayerOffset(width);
  }

  double multiPlayerRedY(double width, double height){
    if (animStage == 2 || animStage == 3) return 3*initGridSize(width) - initPlayerOffset(width);
    return 3*initGridSize(width) + initPlayerOffset(width);
  }

  double multiPlayerGreenX(double width){
    return initPlayerOffset(width);
  }

  double multiPlayerGreenY(double width, double height){
    return 4*initGridSize(width) + initPlayerOffset(width);
  }

  // LEADER


  double leaderRedX(double width, double height){
    return initPlayerOffset(width);
  }

  double leaderRedY(double width, double height){
    if(animStage == 1) return initGridSize(width) + 3*initPlayerOffset(width);
    return initGridSize(width) + initPlayerOffset(width);
  }

  double leaderGreenX(double width){
    return initPlayerOffset(width);
  }

  double leaderGreenY(double width, double height){
    return initPlayerOffset(width);
  }

  late AnimStageManager animStageManager;

  int? animStage;
  PreviewCardsGridController? controller;

  Color? convColor;
  String? convAuth;
  late String convText;

  @override
  void initState() {

    animStageManager = AnimStageManager(
        initWaitDuration: initWaitDuration,
        stages: [
          AnimStage(
              function: (){
                convColor = RED_COLOR;
                convAuth = 'Wódz czerwonych';
                convText = 'Słowo klucz: "Kręgosłup 3"!';
                setState(() => animStage = 1);
              },
              after: animDuration + convDuration),
          AnimStage(
              function: () => setState(() => animStage = 0),
              after: animDuration),

          AnimStage(
              function: (){
                convAuth = 'Gracze czerwoni';
                convText = 'Kręgosłup? Koty i psy mają kręgosłup.';
                setState(() => animStage = 2);
              },
              after: animDuration + convDuration),
          AnimStage(
              function: () => setState(() => animStage = 0),
              after: animDuration),

          AnimStage(
              function: (){
                convText = 'A żuki? Nie jestem pewien.';
                setState(() => animStage = 2);
              },
              after: animDuration + convDuration),
          AnimStage(
              function: () => setState(() => animStage = 0),
              after: animDuration),

          AnimStage(
              function: (){
                convText = 'Spróbujmy kartę "pies".';
                setState(() => animStage = 2);
              },
              after: animDuration + convDuration),
          AnimStage(
              function: () => setState(() => animStage = 0),
              after: animDuration),

          AnimStage(
              function: () => controller![3].toggleCard(),
              after: animDuration),

          AnimStage(
              function: (){
                convText = 'No i git! Jedziemy kolejną. "Kot"?';
                setState(() => animStage = 2);
              },
              after: animDuration + convDuration),
          AnimStage(
              function: () => setState(() => animStage = 0),
              after: animDuration),

          AnimStage(
              function: (){
                convText = 'A co z żukiem? A może chodzi też o "krąg"?';
                setState(() => animStage = 2);
              },
              after: animDuration + convDuration),
          AnimStage(
              function: () => setState(() => animStage = 0),
              after: animDuration),

          AnimStage(
              function: (){
                convText = 'Może na razie wybierzmy kota.';
                setState(() => animStage = 2);
              },
              after: animDuration + convDuration),
          AnimStage(
              function: () => setState(() => animStage = 0),
              after: animDuration),

          AnimStage(
              function: () => controller![0].toggleCard(),
              after: animDuration),

          AnimStage(
              function: (){
                convText = 'Elegancko! Teraz "żuk", czy "krąg?"';
                setState(() => animStage = 2);
              },
              after: animDuration + convDuration),
          AnimStage(
              function: () => setState(() => animStage = 0),
              after: animDuration),

          AnimStage(
              function: (){
                convText = 'Nie wiem. Ja bym nie ryzykował.';
                setState(() => animStage = 2);
              },
              after: animDuration + convDuration),
          AnimStage(
              function: () => setState(() => animStage = 0),
              after: animDuration),

          AnimStage(
              function: (){
                convText = 'To mogą być karty zielonych. Poczekajmy na nowe słowo.';
                setState(() => animStage = 2);
              },
              after: animDuration + convDuration),
          AnimStage(
              function: () => setState(() => animStage = 0),
              after: animDuration),

          AnimStage(
              function: (){
                convText = 'Pass! Tura zielonych.';
                setState(() => animStage = 2);
              },
              after: animDuration + convDuration),
          AnimStage(
              function: () => setState(() => animStage = 0),
              after: animDuration),
    ],
        cleanUp: (){
          controller![3].toggleCard();
          controller![0].toggleCard();

          setState(() => animStage = 0);
        },
        finishedDuration: finishDuration,
        reverseWaitDuration: reverseWaitDuration,
        isMounted: () => mounted
    );

    animStage = 0;
    controller = PreviewCardsGridController();

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
              top: multiPlayerRedY(width, height),
              left: multiPlayerRedX(width, height),
              duration: animDuration,
              curve: curve,
              child: const PlayerWidget(color: RED_COLOR, type: PlayerType.MULTI),
            ),

            // SECOND COLUMN

            AnimatedPositioned(
              top: leaderGreenY(width, height),
              left: leaderGreenX(width),
              duration: animDuration,
              curve: curve,
              child: const Opacity(
                opacity: PREV_INACTIVE_SIDE_OPACITY,
                child: PlayerWidget(color: GREEN_COLOR,  type: PlayerType.LEADER),
              ),
            ),

            AnimatedPositioned(
              top: multiPlayerGreenY(width, height),
              left: multiPlayerGreenX(width),
              duration: animDuration,
              curve: curve,
              child: const Opacity(
                opacity: PREV_INACTIVE_SIDE_OPACITY,
                child: PlayerWidget(color: GREEN_COLOR, type: PlayerType.MULTI),
              ),
            ),

            // PHONES

            AnimatedPositioned(
              top: bottomPhoneY(width, height),
              left: bottomPhoneX(width),
              duration: animDuration,
              curve: curve,
              child: AnimatedRotation(
                turns: -.25,
                curve: curve,
                duration: animDuration,
                child: PhoneWidget(
                  builder: (context, width) => ScreenGamePlay(withWords: true, controller: controller),
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
                turns: -.25,
                curve: curve,
                duration: animDuration,
                child: PhoneWidget(
                  builder: (context, width) => const ScreenGamePlay(withColors: true, withWords: true),
                  size: upperPhoneWidth(width),
                  duration: animDuration,
                ),
              ),
            ),

            /*
            Positioned(
                top: 2*initGridSize(width),
                left: 0,
                right: 0,
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
            ),

             */

          ],
        );

      },
      text: 'Drużyna może w każdej chwili zakończyć turę, nawet jeżeli nie zgadła liczby kart podanej przez wodza.',
      textColor: Colors.black,
    );
  }

}