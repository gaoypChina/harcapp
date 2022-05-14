import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harcapp/_common_classes/auto_size_text.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_guide_book/games/slowo_klucz/word.dart';
import 'package:harcapp/_new/cat_page_guide_book/games/slowo_klucz/word_card.dart';
import 'package:harcapp/_new/cat_page_guide_book/games/slowo_klucz/word_data.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp_core/comm_classes/no_glow_behavior.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wakelock/wakelock.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'common.dart';

const String oldDatabaseMessage = 'Baza słów jest nieaktualna. Zaktualizuj aplikację.';

class OldDataBaseError extends Error{}

class BadWordCountError extends Error{}

class SlowoKluczMainGamePage extends StatefulWidget{

  final GameMode mode;
  final List<Word> words;

  const SlowoKluczMainGamePage(this.mode, this.words, {Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => SlowoKluczMainGamePageState();

  static String _encodeWords(List<Word> words){
    String code = '$WORD_LIST_VERISON!';
    for(int i=0; i<25; i++) {
      code += words[i].toCode() + Word.exteralCodeSeparator;
    }

    return code.substring(0, code.length-1);
  }

  static List<Word> decodeWordsFromQRCode(String code){
    List<Word> words = [];

    int othVerion = int.parse(code.split('!')[0]);
    if (WORD_LIST_VERISON != othVerion)
      throw OldDataBaseError();

    code = code.split('!')[1];

    List<String> wordCodes = code.split(Word.exteralCodeSeparator);
    for (String wordCode in wordCodes)
      words.add(Word.fromCode(wordCode));

    return words;
  }

  static SlowoKluczMainGamePage newPlayerInstance(BuildContext context){
    List<WordData> wordData = List.of(WordData.all);
    wordData.shuffle();
    wordData = wordData.sublist(0, 25);

    List<Word> words = [];

    bool blueStarts = Random().nextInt(2) == 0;

    for(int i=0; i<25; i++) {

      CardColor cardColor;
      if(i<9) cardColor = blueStarts?CardColor.teamGreen:CardColor.teamRed;
      else if(i<9+8) cardColor = blueStarts?CardColor.teamRed:CardColor.teamGreen;
      else if(i<9+8+1) cardColor = CardColor.kill;
      else cardColor = CardColor.neutral;

      words.add(Word(wordData[i], cardColor));
    }

    words.shuffle();

    post(() => openDialog(
        context: context,
        dismissible: false,
        builder: (BuildContext context) => Center(child: QRCodeWidget(_encodeWords(words)))
    ));

    return SlowoKluczMainGamePage(GameMode.PLAYER, words);

  }

  static SlowoKluczMainGamePage newLeaderInstance(BuildContext context, List<Word> words) {

    if (words.length != 25)
      throw BadWordCountError();

    return SlowoKluczMainGamePage(GameMode.LEADER, words);

  }

  static String get savedInstanceCode => shaPref!.getString(ShaPref.SHA_PREF_GRY_SLOWO_KLUCZ_SAVED_GAME, null)!;
  static set savedInstanceCode(String value) => shaPref!.setString(ShaPref.SHA_PREF_GRY_SLOWO_KLUCZ_SAVED_GAME, value);
  static void removeSavedInstanceCode() => shaPref!.remove(ShaPref.SHA_PREF_GRY_SLOWO_KLUCZ_SAVED_GAME);

  static SlowoKluczMainGamePage? loadInstance(BuildContext context, String code){
    try {

      Map map = jsonDecode(code);

      int? wordListVersion = map['word_list_version'];
      if (wordListVersion != WORD_LIST_VERISON) {
        showAppToast(context, text: oldDatabaseMessage);
        return null;
      }
      
      GameMode mode = map['mode'] == 1 ? GameMode.LEADER : GameMode.PLAYER;

      List<dynamic> wordMaps = map['words'];
      List<Word> words = wordMaps.map((wordMap) => Word.fromInstanceMap(wordMap)).toList();
      
      return SlowoKluczMainGamePage(mode, words);

    }catch(e){
      showAppToast(context, text: 'Coś poszło nie tak...');
      return null;
    }
  }

}

class SlowoKluczMainGamePageState extends State<SlowoKluczMainGamePage>{

  late int greenCardsLeft;
  late int redCardsLeft;

  GameMode get mode => widget.mode;
  List<Word> get words => widget.words;

  late int countdown;

  saveInstance(){

    List<Map<String, dynamic>> wordMaps = [];
    for(Word word in words)
      wordMaps.add(word.toInstanceMap());

    Map map = {
      'mode':mode==GameMode.LEADER?1:0,
      'word_list_version': WORD_LIST_VERISON,
      'words': wordMaps,
    };

    String code = jsonEncode(map);
    SlowoKluczMainGamePage.savedInstanceCode = code;

  }

  @override
  void initState() {

    greenCardsLeft = 0;
    redCardsLeft = 0;

    for(Word word in words)
      if(word.cardColor == CardColor.teamGreen) greenCardsLeft++;
      else if(word.cardColor == CardColor.teamRed) redCardsLeft++;

    if(mode == GameMode.PLAYER)
      countdown = 0;
    else
      countdown = 5;

    saveInstance();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    Wakelock.enable();
/*
    post(
            () => showDialog(
            context: context,
            builder: (BuildContext context) => Center(child: InitWidget(this)),
            barrierDismissible: false
        )
    );
*/
    super.initState();
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Wakelock.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if(countdown>0){

      post(()async{
        await Future.delayed(const Duration(seconds: 1));
        setState(() => --countdown);
        if(countdown==0) {
          await openDialog(
              context: context,
              builder: (_) =>
                  Center(
                    child: InfoWidget(
                      color: greenCardsLeft> redCardsLeft? GREEN_COLOR
                          : RED_COLOR,
                      textColor: textEnab_(context),
                      text: 'Zaczynają ${greenCardsLeft> redCardsLeft? 'niebiescy'
                          : 'czerwoni'}',
                    ),
                  )
          );
          saveInstance();
        }
      });

      return AppScaffold(
          backgroundColor: Colors.black,
          body: ScrollConfiguration(
              behavior: NoGlowBehavior(),
              child: CustomScrollView(
                physics: const ClampingScrollPhysics(),
                slivers: [

                  const SliverAppBar(
                    title: Text('Słowo klucz'),
                    centerTitle: true,
                  ),

                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text('$countdown', style: AppTextStyle(fontSize: 64.0, color: Colors.white, fontWeight: weight.halfBold), textAlign: TextAlign.center,),

                        const SizedBox(height: 16.0),

                        Text('Ukryj telefon przed graczami.', style: AppTextStyle(color: Colors.white, fontSize: Dimen.TEXT_SIZE_BIG), textAlign: TextAlign.center,),

                      ],
                    ),
                  )

                ],
              )
          )
      );

    }

    return AppScaffold(
        body: ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [

              SliverAppBar(
                title: const Text('Słowo klucz'),
                centerTitle: true,
                actions: [
                  if(mode == GameMode.PLAYER)
                    IconButton(
                      icon: const Icon(MdiIcons.qrcode),
                      onPressed: () => openDialog(
                          context: context,
                          dismissible: false,
                          builder: (BuildContext context) => Center(child: QRCodeWidget(SlowoKluczMainGamePage._encodeWords(words)))
                      ),
                    )
                ],
              ),

              SliverFillRemaining(
                child: Column(
                  children: [
                    Expanded(child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        WordCard(this, words[0], mode),
                        WordCard(this, words[1], mode),
                        WordCard(this, words[2], mode),
                        WordCard(this, words[3], mode),
                        WordCard(this, words[4], mode),
                      ],
                    )),
                    Expanded(child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        WordCard(this, words[5], mode),
                        WordCard(this, words[6], mode),
                        WordCard(this, words[7], mode),
                        WordCard(this, words[8], mode),
                        WordCard(this, words[9], mode),
                      ],
                    )),
                    Expanded(child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        WordCard(this, words[10], mode),
                        WordCard(this, words[11], mode),
                        WordCard(this, words[12], mode),
                        WordCard(this, words[13], mode),
                        WordCard(this, words[14], mode),
                      ],
                    )),
                    Expanded(child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        WordCard(this, words[15], mode),
                        WordCard(this, words[16], mode),
                        WordCard(this, words[17], mode),
                        WordCard(this, words[18], mode),
                        WordCard(this, words[19], mode),
                      ],
                    )),
                    Expanded(child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        WordCard(this, words[20], mode),
                        WordCard(this, words[21], mode),
                        WordCard(this, words[22], mode),
                        WordCard(this, words[23], mode),
                        WordCard(this, words[24], mode),
                      ],
                    )),
                  ],

                ),
              )

            ],
          ),
        )

    );
  }

}

class QRCodeWidget extends StatelessWidget{

  final String encodedGameInstance;

  const QRCodeWidget(this.encodedGameInstance, {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppCard(
          color: ColorPack.DEF_CARD,
          radius: AppCard.BIG_RADIUS,
          margin: AppCard.normMargin,
          child: QrImage(
            data: encodedGameInstance,
            version: QrVersions.auto,
            foregroundColor: ColorPack.DEF_ICON_ENAB,
          ),
        ),

        AppCard(
          color: ColorPack.DEF_CARD,
          radius: AppCard.BIG_RADIUS,
          margin: AppCard.normMargin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Padding(
                padding: const EdgeInsets.all(Dimen.ICON_MARG),
                child: Text(
                  'Zeskanuj kod telefonem, z którego korzystają wodzowie.',
                  style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL, fontWeight: weight.halfBold, color: ColorPack.DEF_ICON_ENAB),
                  textAlign: TextAlign.center,
                ),
              ),

              AppCard(
                color: ColorPack.DEF_CARD,
                radius: AppCard.BIG_RADIUS,
                elevation: AppCard.bigElevation,
                padding: const EdgeInsets.all(Dimen.ICON_MARG),
                onTap: () => Navigator.pop(context),
                child: Text(
                  'PRZEJDŹ DO GRY',
                  style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.halfBold, color: ColorPack.DEF_ICON_ENAB),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        )
      ],
    );

  }

}

class InfoWidget extends StatefulWidget{

  final Color color;
  final Color? textColor;
  final String text;

  const InfoWidget({
    required this.color,
    required this.textColor,
    required this.text,
    Key? key
  }): super(key: key);

  @override
  State<StatefulWidget> createState() => InfoWidgetState();

}

class InfoWidgetState extends State<InfoWidget>{

  Color get color => widget.color;
  Color? get textColor => widget.textColor;
  String get text => widget.text;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: MediaQuery
        .of(context)
        .size
        .width / 1.7,
    height: MediaQuery
        .of(context)
        .size
        .height / 1.7,
    child: AppCard(
      radius: AppCard.BIG_RADIUS,
      color: color,
      margin: AppCard.normMargin,
      elevation: AppCard.bigElevation,
      padding: const EdgeInsets.all(24.0),
      child: Center(
          child: RotatedBox(
            quarterTurns: 1,
            child: AutoSizeText(
              text,
              style: AppTextStyle(
                height: 1.4,
                fontSize: 48.0,
                fontWeight: weight.halfBold,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          )
      ),
    ),
  );

}

class GameRules extends StatelessWidget{

  final ColorPack colorPack;

  const GameRules(this.colorPack, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[

      const AppText('<b>Liczba graczy:</b> od 2, najlepiej członkowie rodziny.'),
      const SizedBox(height: 18.0,),
      const AppText('<b>Wiek graczy:</b> od 5 lat.'),
      const SizedBox(height: 18.0,),
      const AppText('<b>Cel gry:</b>'),
      const SizedBox(height: 6.0,),
      const AppText(
        '    • budowanie wzajemnych relacji w rodzinie,'
            '\n    • integracja najbliższych,'
            '\n    • sposób na spędzenie wolnego czasu,'
            '\n    • rozmawianie o emocjach w przyjaznej atmosferze,'
            '\n    • rozwijanie rozumienia i przeżywania emocji w rodzinie.',
      ),

      const SizedBox(height: 18.0,),
      const AppText('<b>Przebieg gry:</b>'),
      const SizedBox(height: 6.0,),
      const AppText('Usiądźcie w kole, tak by każdy widział się nawzajem. Gracze po kolei obracają karty, by odczytać na głos pytanie (jeśli gracz nie umie jeszcze czytać, prosi kogoś o przeczytanie). Następnie gracz odpowiada na pytanie (lub wykonuje zaproponowaną w karcie czynność).'
          '\n\nW wyjątkowych sytuacjach – kiedy gracz stwierdzi, że pytanie jest zbyt trudne, można odłożyć ja na bok (przesuwając kartę na lewo). Zaleca się wtedy, by wrócić do tego pytania po zakończeniu gry w mniejszym gronie (np. w rozmowie z siostrą, mamą, mężem, synem itp.).'
        //'\n\nNiektóre karty zawierają polecenie <i>"Wylosuj minkę. Jakie to uczucie?"</i>. Wówczas należy wylosować minkę, nazwać uczucie, a następnie wykonać zadanie.'
      ),

      const SizedBox(height: 18.0,),
      const AppText('<b>Mechanika gry:</b>'),
      const SizedBox(height: 6.0,),
      const AppText(
          '    • dotknij kartę, by ją odwrócić,'
              '\n    • przeciągnij kartę w lewo, by odłożyć ją na później,'
              '\n    • przeciągnij kartę w prawo, by przejść do kolejnej.'
      ),
      const SizedBox(height: 24.0,),

      const AppText('<b>Miłej zabawy!</b>'),

      const SizedBox(height: 18.0,),
      Text('Grafika kart i emotikon: freepik.com', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_TINY, color: colorPack.hintEnabled),),

      const SizedBox(height: 6.0,),
      Text('Gra na podstawie gry "Pytaki" Aleksandry Sulej, wydawnictwa DOBRETO', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_TINY, color: colorPack.hintEnabled),),

    ],
  );

}