import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/auto_size_text.dart';
import 'package:harcapp/_common_classes/blur.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/app_bottom_navigator.dart';
import 'package:harcapp/_new/cat_page_other/games/slowo_klucz/word.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

import '../_main_page.dart';
import '../data.dart';
import 'common.dart';
import 'common/preview_cards_grid_widget.dart';
import 'how_to_guide/_how_to_guide.dart';
import 'main_game_page.dart';

class SlowoKluczStartPage extends StatefulWidget{

  static const playerBoardColorStart = Colors.amberAccent;
  static const playerBoardColorEnd = Colors.lightBlueAccent;

  static const leaderBoardColorStart = Colors.red;
  static const leaderBoardColorEnd = Colors.orange;

  @override
  State<StatefulWidget> createState() => SlowoKluczStartPageState();

}

class SlowoKluczStartPageState extends State<SlowoKluczStartPage>{

  @override
  void initState() {
    AppBottomNavigatorProvider.addOnSelectedListener(onNavSelected);
    super.initState();
  }

  @override
  void dispose() {
    AppBottomNavigatorProvider.removeOnSelectedListener(onNavSelected);
    super.dispose();
  }

  void onNavSelected(int page) => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [

        Positioned.fill(
          child: Image.asset('assets/images/games/bg_slowo_klucz.webp', fit: BoxFit.cover,),
        ),

        AppScaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Słowo klucz', style: TextStyle(color: Colors.white)),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.white),
            actionsIconTheme: IconThemeData(color: Colors.white),
          ),
          body: Column(
            children: [

              Padding(
                padding: EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
                child: InstructionRowWidget(gameDataSlowoKlucz),
              ),

              Expanded(child: AnimatedChildSlider(
                direction: Axis.horizontal,
                duration: Duration(milliseconds: 500),
                switchInCurve: Curves.easeOutQuad,
                switchOutCurve: Curves.easeOutQuad,
                index: SlowoKluczMainGamePage.savedInstanceCode == null?1:0,
                children: [

                  Padding(
                    padding: EdgeInsets.all(Dimen.SIDE_MARG),
                    child: LoadGameWidget(
                      onSavedGameRemoved: () => setState(() {}),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(Dimen.SIDE_MARG),
                    child: Column(
                      children: [

                        Expanded(
                            child: ButtonWidget(
                              icon: MdiIcons.accountMultiple,
                              text: 'Plansza drużyn',
                              description: 'Rozgryźcie, które karty miał Wasz wódz na myśli podając określające je "słowo klucz".',
                              colorStart: SlowoKluczStartPage.playerBoardColorStart,
                              colorEnd: SlowoKluczStartPage.playerBoardColorEnd,
                              withColors: false,
                              onTap: (){

                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SlowoKluczMainGamePage.newPlayerInstance(context)
                                    )
                                );

                              },
                            )
                        ),

                        SizedBox(height: Dimen.SIDE_MARG),

                        Expanded(
                            child: ButtonWidget(
                              icon: MdiIcons.accountCowboyHat,
                              text: 'Plansza wodzów',
                              description: 'Na zmianę podawajcie swoim drużynom "słowo klucz", by odnaleźli komplet kart Waszej drużyny.',
                              colorStart: SlowoKluczStartPage.leaderBoardColorStart,
                              colorEnd: SlowoKluczStartPage.leaderBoardColorEnd,
                              onTap: () async {

                                String code;
                                if(await Permission.camera.request().isGranted)
                                  code = await QRCodeReader().scan();

                                if(code == null) return;

                                try {
                                  List<Word> words = SlowoKluczMainGamePage
                                      .decodeWordsFromQRCode(code);

                                  Navigator.pop(context);
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SlowoKluczMainGamePage.newLeaderInstance(context, words)
                                      )
                                  );

                                }catch(e){
                                  showAppToast(context, text: 'Coś nie tak z tym QR-kodem...');
                                }

                              },
                            )
                        ),

                      ],
                    ),
                  )

                ],

              )),

            ],
          ),
          bottomNavigationBar: AppBottomNavigator(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            background: Colors.transparent,
            elevation: 0,
          ),
        )
      ],
    );

  }

}

class LoadGameWidget extends StatelessWidget{

  final void Function() onSavedGameRemoved;

  const LoadGameWidget({this.onSavedGameRemoved});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: ButtonWidget(
            text: 'Przywróć grę',
            description: 'Wygląda na to, że ostatnia rozgrywka "Słowa klucz" nie została zakończona.'
                '\n'
                '\nNa szczęście, jest bezpiecznie zapisana w tej karcie! Szkoda byłoby ją utracić.',
            colorStart: Colors.deepPurple,
            colorEnd: Colors.blue,
            icon: MdiIcons.contentSave,
            onTap: (){

              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SlowoKluczMainGamePage.loadInstance(context, SlowoKluczMainGamePage.savedInstanceCode)
                  )
              );
            },
          ),
        ),

        SizedBox(height: Dimen.SIDE_MARG),

        TitleShortcutRowWidget(
          title: 'Nie, wolę zacząć nową grę',
          titleColor: Colors.red,
          onOpenIconColor: Colors.red,
          onOpen: (context){
            SlowoKluczMainGamePage.removeSavedInstanceCode();
            onSavedGameRemoved?.call();
          },
        )
      ],
    );

  }

}

class ButtonWidget extends StatelessWidget{

  final IconData icon;
  final String text;
  final String description;
  final Color colorStart;
  final Color colorEnd;
  final void Function() onTap;
  final bool withColors;

  const ButtonWidget({
    @required this.icon,
    @required this.text,
    @required this.description,
    @required this.colorStart,
    @required this.colorEnd,
    @required this.onTap,
    this.withColors=true
  });

  @override
  Widget build(BuildContext context) {

    return AppCard(
      onTap: onTap,
      radius: AppCard.BIG_RADIUS,
      elevation: AppCard.bigElevation,
      padding: EdgeInsets.zero,
      color: Colors.transparent,
      child: Stack(
        children: [

          Positioned.fill(
            child: Blur(
              child: Opacity(
                opacity: .7,
                child: GradientWidget(
                  colorStart: colorStart,
                  colorEnd: colorEnd,
                ),
              ),
            )
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              SizedBox(height: Dimen.ICON_MARG),

              Padding(
                padding: EdgeInsets.all(Dimen.ICON_MARG),
                child: AutoSizeText(
                    text,
                    style: TextStyle(
                        fontFamily: fontFamily,
                        color: Colors.white,
                        fontSize: 38.0
                    ),
                    textAlign: TextAlign.center
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  left: 2*Dimen.ICON_MARG,
                  right: 2*Dimen.ICON_MARG
                ),
                child: Text(
                    description,
                    style: TextStyle(
                      fontFamily: 'Hand15',
                      fontSize: 16.0,
                      color: Colors.white,
                    )
                ),
              ),

            ],
          ),

          Positioned(
            bottom: 18,
            left: 18,
            child: Icon(icon, color: Colors.white60, size: 48.0),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: RotationTransition(
              turns: AlwaysStoppedAnimation((withColors?-25:-25) / 360),
              child: SizedBox(
                width: MediaQuery.of(context).size.width/2,
                child: AppCard(
                  color: Colors.white,
                  child: AspectRatio(
                      aspectRatio: 2,
                      child: PreviewCardsGridWidget(withColors: withColors)
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }

}
