import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harcapp/_common_classes/auto_size_text.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/sliding_card.dart';
import 'package:harcapp/_common_widgets/swap_card_layout.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/no_glow_behavior.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../module_statistics_registrator.dart';

class GamePytakiPage extends StatefulWidget{

  const GamePytakiPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GamePytakiPageState();

}

class GamePytakiPageState extends State<GamePytakiPage> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.graPytajki;

  List<CardItem> cards;
  List<CardItem> hardCards;

  bool showHardCardsButton;
  bool showHardCards;

  CardController controller;

  SwapCardLayout swapCardLayout;

  GlobalKey<ScaffoldState> scaffoldKey;

  int _currIndex;
  int get currIndex => _currIndex;
  set currIndex(int value){
      setState(() => _currIndex = value);
  }

  ValueNotifier<double> notifier;

  bool showClock;
  void setStateShowClock(bool value){
    if(showClock != value)
      setState(() => showClock = value);
  }

  bool showOk;
  void setStateShowOk(bool value){
    if(showOk != value)
      setState(() => showOk = value);
  }

  @override
  void initState() {

    int index = 0;

    notifier = ValueNotifier(0.0);

    showHardCardsButton = false;
    showHardCards = false;

    hardCards = [];
    cards = [

      CardItem(this, 'Co według Ciebie robi dobrze osoba siedząca po Twojej lewej stronie?', key: ValueKey(index++)),
      CardItem(this, 'Jaka jest ulubiona potrawa osoby siedzącej po prawej stronie?', key: ValueKey(index++)),
      CardItem(this, 'Opowiedz o swoich wymarzonych wakacjach. Z kim chciałbyś/ałabyś je spędzić?', key: ValueKey(index++)),
      CardItem(this, 'Najszczęśliwsza chwila w Twoim życiu! Opowiedz o niej.', key: ValueKey(index++)),
      CardItem(this, 'Jak lubisz spędzać święta? Opowiedz o ulubionej czynności.', key: ValueKey(index++)),
      CardItem(this, 'Jaki jest Twoja ulubiona bajka/ Twój ulubiony film. ', key: ValueKey(index++)),
      CardItem(this, 'Co najbardziej lubisz robić w wolnym czasie?', key: ValueKey(index++)),
      CardItem(this, 'Co lubisz robić z osobą siedzącą po prawej stronie?', key: ValueKey(index++)),
      CardItem(this, 'Co najbardziej lubisz w sobie?', key: ValueKey(index++)),
      CardItem(this, 'Z kim z grających chciałbyś spędzić trochę czasu. Powiedz to, ustalcie czas.', key: ValueKey(index++)),
      CardItem(this, 'Co jako rodzina wyróżnia Was od innych?', key: ValueKey(index++)),
      CardItem(this, 'Komu z siedzących zawsze chciałeś pomóc, ale nie wiedziałeś jak. Niech ta osoba powie, w czym możesz jej pomóc. Umówcie się.', key: ValueKey(index++)),
      CardItem(this, 'Przytul wszystkich grających.', key: ValueKey(index++)),
      CardItem(this, 'Jaki jest Twój ulubiony miesiąc w roku, dlaczego?', key: ValueKey(index++)),
      CardItem(this, 'Czy lubisz weekendy w Waszej rodzinie? Czy pamiętasz jakiś, który Ci się szczególnie podobał?', key: ValueKey(index++)),
      CardItem(this, 'Jak chciałbyć/ chciałabyś, żeby wyglądały Twoje urodziny?', key: ValueKey(index++)),
      CardItem(this, 'Niech każdy z graczy powie teraz jedną twoją dobrą cechę.', key: ValueKey(index++)),
      CardItem(this, 'Zagrajcie w "głuchy" telefon. Wymyśl zdanie i powiedz je na ucho osobie po prawej stronie.', key: ValueKey(index++)),
      CardItem(this, 'Jakie są Twoim zdaniem najważniejsze zadania rodzica?', key: ValueKey(index++)),
      CardItem(this, 'Przez kogo z Waszej rodziny lubisz być przytulana/przytulany?', key: ValueKey(index++)),
      CardItem(this, 'Przypomnij sobie prezent, który najbardziej Ci się spodobał. Opowiedz o nim.', key: ValueKey(index++)),
      CardItem(this, 'Opowiedz co lubisz w każdym z członków Twojej rodziny.', key: ValueKey(index++)),
      CardItem(this, 'Czy udało Ci się kiedyś samodzielnie coś swtorzyć? Opowiedz o tym.', key: ValueKey(index++)),
      CardItem(this, 'Jakie obowiązki domowe są dla Ciebie najłatwiejsze/najmilsze?', key: ValueKey(index++)),
      CardItem(this, 'Wyobraź sobie, że masz 8 dni w tygodniu. Co robiłbyś ósmego dnia?', key: ValueKey(index++)),
      CardItem(this, 'Jakie jest Twoje marzenie?', key: ValueKey(index++)),
      CardItem(this, 'Czy chciałbyś, żeby coś zmieniło się w Waszych relacjach? Spóbujcie o tym porozmawiać.', key: ValueKey(index++)),
      CardItem(this, 'Co robisz, gdy się denerwujesz?', key: ValueKey(index++)),
      CardItem(this, 'Czy jest coś, za co chciałbyś/ałabyś, aby inni Cię przeprosili?', key: ValueKey(index++)),
      CardItem(this, 'Czy jest coś, za co możesz przeprosić innych?', key: ValueKey(index++)),
      CardItem(this, 'Czy miałeś/aś kiedyś przezwisko i jak ono brzmi?', key: ValueKey(index++)),
      CardItem(this, 'Jakie były Twoje ulubione zabawy w dzieciństwie?', key: ValueKey(index++)),
      CardItem(this, 'Jakie jest Twoje najpiękniejsze wspomnienie z dzieciństwa?', key: ValueKey(index++)),
      CardItem(this, 'Czy złamałeś/aś kiedyś sobie coś?', key: ValueKey(index++)),
      CardItem(this, 'Jakie były najtrudniejsze decyzje, które musiałeś/aś podjąć?', key: ValueKey(index++)),
      CardItem(this, 'Jaka jest najbardziej niezwykła rzecz, jaką zrobiłeś/aś w życiu?', key: ValueKey(index++)),
      CardItem(this, 'Czy jest coś, co zawsze chciałeś zrobić w życiu, ale nie udało się?', key: ValueKey(index++)),
      CardItem(this, 'W jakim miejscu chciałbyś być teraz?', key: ValueKey(index++)),
      CardItem(this, 'Co czułeś, jak się zakochałeś?', key: ValueKey(index++)),
      CardItem(this, 'Powiedz, co lubisz/lubiłeś/aś w swoich dziadkach?', key: ValueKey(index++)),
      CardItem(this, 'Jaką porę roku lubisz?', key: ValueKey(index++)),
      CardItem(this, 'Co cię najbardziej rozśmiesza?', key: ValueKey(index++)),
      CardItem(this, 'Jakie jest Twoje najwcześniejsze wspomnienie?', key: ValueKey(index++)),
      CardItem(this, 'Jaka muzyka Cię uspokaja?', key: ValueKey(index++)),
      CardItem(this, 'Jaka muzyka Cię wzrusza?', key: ValueKey(index++)),
      CardItem(this, 'Co najbardziej lubisz jeść?', key: ValueKey(index++)),
      CardItem(this, 'Co sprawia, że jesteś radosny/a?', key: ValueKey(index++)),
      CardItem(this, 'Co lubisz w osobie siedzącej po Twojej prawej stronie?', key: ValueKey(index++)),
      CardItem(this, 'Czego nie możesz się doczekać, kiedy obudzisz się rano?', key: ValueKey(index++)),
      CardItem(this, 'Gdybyś napisał/a książkę, o czym byłaby?', key: ValueKey(index++)),
      CardItem(this, 'Gdybyś mógł/mogła spotkać kogoś znanego, to kto by to był?', key: ValueKey(index++)),
      CardItem(this, 'Gdybyś był/a superbohaterem – jakie byłyby Twoje supermoce?', key: ValueKey(index++)),
      CardItem(this, 'Gdybyś był/a fotografem przez jeden dzień, to co byś fotografował/a?', key: ValueKey(index++)),
      CardItem(this, 'Jakie jest najmilsze wspomnienie z osobą siedzącą po Twojej lewej stronie?', key: ValueKey(index++)),
      CardItem(this, 'Podaj tytuł harcerskiej piosenki.', key: ValueKey(index++)),
      CardItem(this, 'Z czego jesteś najbardziej dumny w swoim życiu?', key: ValueKey(index++)),
      CardItem(this, 'Jaki jest Twój ulubiony kolor?', key: ValueKey(index++)),
      CardItem(this, 'Powiedz komplement osobie siedzącej naprzeciwko.', key: ValueKey(index++)),
      CardItem(this, 'Powiedz co Ci się ostatnio śniło.', key: ValueKey(index++)),
      CardItem(this, 'Jakim zwierzęciem chciałbyś być?', key: ValueKey(index++)),
      CardItem(this, 'Grupowy uścisk.', key: ValueKey(index++)),
      CardItem(this, 'Podskocz jak najwyżej.', key: ValueKey(index++)),
      CardItem(this, 'Czy jest coś, za co chciałby/ałabyś podziękować innym?', key: ValueKey(index++)),
      CardItem(this, 'Za co jesteś wdzięczny?', key: ValueKey(index++)),
      CardItem(this, 'Jaki jest Twój ulubiony przedmiot ze szkoły?', key: ValueKey(index++)),
      CardItem(this, 'Zarapuj/zaśpiewaj fragment najbliżej leżącej książki.', key: ValueKey(index++)),
      CardItem(this, 'Którym bohaterem książki zostałbyś/ałabyś?', key: ValueKey(index++)),
      CardItem(this, 'Gdybyś mógł/mogła wybrać się w podróż w czasie - dokąd byś się wybrał/a?', key: ValueKey(index++)),
      CardItem(this, 'Przesuń ścianę jak mim.', key: ValueKey(index++)),
      CardItem(this, 'Zaśpiewaj ulubioną piosenkę.', key: ValueKey(index++)),
      CardItem(this, 'Pokaż ulubioną pamiątkę, którą masz w domu.', key: ValueKey(index++)),
      CardItem(this, 'Jak wygląda Twoja wymarzona sobota?', key: ValueKey(index++)),
      CardItem(this, 'Czy macie jakiś rodzinny zwyczaj? Podoba Ci się on?', key: ValueKey(index++)),
      CardItem(this, 'Czy masz swoje ulubione miejsce w mieszkaniu/domu? Jakie?', key: ValueKey(index++)),
      CardItem(this, 'Jak można Cię pocieszyć?', key: ValueKey(index++)),
      CardItem(this, 'Co najbardziej lubisz robić?', key: ValueKey(index++)),
      CardItem(this, 'Jak można pocieszyć osobę siedzącą po prawej stronie?', key: ValueKey(index++)),
      CardItem(this, 'Wymień dwie wspólne cechy całej rodziny.', key: ValueKey(index++)),
      CardItem(this, 'Co lubisz w Twoich rodzicach?', key: ValueKey(index++)),
      CardItem(this, 'Jaki jest Twój największy sukces?', key: ValueKey(index++)),

    ];


    for(int i=0; i<CardItem.EMOTIONS.length; i++){
      cards.add(
          CardItem(
              this, 'Czy często towarzyszy Ci to uczucie? W jakich sytuacjach?',
              emoIndex: i,
              key: ValueKey(index++)));
      cards.add(CardItem(this,
          'Czy w Waszej rodzinie obecne jest to uczucie? Chciałbyś to zmienić?',
          emoIndex: i,
          key: ValueKey(index++)));
      cards.add(
          CardItem(this,
              'Jak się zachowujesz gdy widzisz takie uczucie u innej osoby?',
              emoIndex: i,
              key: ValueKey(index++)));
      cards.add(
          CardItem(this,
              'Czy potrafisz opowiedzieć komuś kiedy przeżywasz taką emocję?',
              emoIndex: i,
              key: ValueKey(index++)));
      cards.add(
          CardItem(
              this, 'Kto z rodziny rozumie Ciebie gdy przeżywasz taką emocję?',
              emoIndex: i,
              key: ValueKey(index++)));
      cards.add(
          CardItem(this, 'Z kim lubisz o nim rozmawiać?',
              emoIndex: i,
              key: ValueKey(index++)));
      cards.add(
          CardItem(
              this, 'Spróbuj zrobić taką samą minę.',
              emoIndex: i,
              key: ValueKey(index++)));
      cards.add(
          CardItem(this, 'Czy często robisz taką minę? Dlaczego?',
              emoIndex: i,
              key: ValueKey(index++)));
      cards.add(
          CardItem(this,
              'Poproś wybraną osobę, żeby opowiedziała kiedy doświadcza takiego uczucia?',
              emoIndex: i,
              key: ValueKey(index++)));
      cards.add(
          CardItem(this, 'Opowiedz sytuację, w której tak się czułeś/czułaś.',
              emoIndex: i,
              key: ValueKey(index++)));
      cards.add(
          CardItem(this,
              'Co chciałbyś, żeby zrobili gracze gdy przeżywasz taką emocję?',
              emoIndex: i,
              key: ValueKey(index++)));
    }

    cards.shuffle();
    index = 0;
    for(CardItem card in cards)
      card.setIndex(index++);
    
    scaffoldKey = GlobalKey();

    controller = CardController(swipable: false);

    currIndex = 0;

    //post(() => setState((){})); // TO JEST PO TO, ŻEBY CURRENT FRONT ZOSTAŁO ZASSANE DO WYSWIETLACZA NA EKRANIE POZOSTAŁYCH KART.

    showClock = false;
    showOk = false;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

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
    super.dispose();
  }

  static const STACK_NUM = 5;
  static const ITEM_WIDTH_FACTOR = 0.7;
  static const ITEM_HEIGHT_FACTOR = 0.6;
  static const GROW_FACTOR = 0.1;

  @override
  Widget build(BuildContext context) {

    double cardSecHeight = MediaQuery.of(context).size.height*
        (ITEM_HEIGHT_FACTOR + (ITEM_HEIGHT_FACTOR*GROW_FACTOR/STACK_NUM)*3);



    return AppScaffold(
        scaffoldKey: scaffoldKey,
        backgroundColor: background_(context),
        body: ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [

              const SliverAppBar(
                title: Text('Pytajki'),
                centerTitle: true,
                pinned: true,
              ),

              SliverFillRemaining(
                child: Stack(
                  children: <Widget>[

                    Positioned(
                      top: 6,
                      left: 6,
                      right: 6,
                      child: AnimatedOpacity(
                        child: const Icon(MdiIcons.clock, color: Colors.deepOrange, size: 32.0,),
                        opacity: (cardsLeft()&&!showHardCards&&showClock)?1.0:0.0,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeInOutQuad,
                      ),
                    ),

                    Positioned(
                      top: 6,
                      left: 6,
                      right: 6,
                      child: AnimatedOpacity(
                        child: const Icon(MdiIcons.checkCircle, color: Colors.lightBlueAccent, size: 32.0,),
                        opacity: (cardsLeft()&&!showHardCards&&showOk)?1.0:0.0,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeInOutQuad,
                      ),
                    ),

                    Positioned(
                      bottom: 18,
                      left: 6,
                      right: 6,
                      child: AnimatedOpacity(
                        child: Text(
                          'Pozostało kart: ${((showHardCards)?hardCards.length:cards.length) - currIndex}',
                          style: AppTextStyle(fontWeight: weight.halfBold, color: hintEnab_(context)),
                          textAlign: TextAlign.center,),
                        opacity: showHardCardsButton?0.0:1.0,
                        duration: const Duration(milliseconds: 350),
                      ),
                    ),


                    Positioned.fill(
                      child: Align(
                        alignment: const Alignment(0.0, (-0.5 / (STACK_NUM - 1)) * (STACK_NUM - 3)),
                        child: SizedBox(
                          child: CardItem(this, 'Koniec!\n\nJeżeli Ci się podobało, poleć grę znajomym!', emoIndex: 3, emoName: false),
                          height: cardSecHeight,
                          width: MediaQuery.of(context).size.width * (ITEM_WIDTH_FACTOR + (ITEM_WIDTH_FACTOR*GROW_FACTOR/STACK_NUM)*3),
                        ),
                      ),
                      top: 24,
                    ),

                    if(!showHardCards && !showHardCardsButton)
                      Positioned.fill(
                        child: _SwapCardLayout(this, cards, controller, const ValueKey('_SwapCardLayout normal cards')),
                        top: 24.0,
                      )
                    else if(!showHardCardsButton)
                      Positioned.fill(
                        child: _SwapCardLayout(this, hardCards, controller, const ValueKey('_SwapCardLayout hard cards')),
                        top: 24.0,
                      )

                  ],
                ),
              )

            ],
          ),
        ),
        floatingActionButton: AnimatedOpacity(
          child: FloatingActionButton.extended(
            onPressed: () {
              setState((){
                showHardCards = true;
                showHardCardsButton = false;
                currIndex = 0;
                controller = CardController(swipable: false);
              });
            },
            icon: Icon(MdiIcons.reload, color: textEnab_(context)),
            label: Text('Pokaż odłożone karty', style: AppTextStyle(fontWeight: weight.halfBold),),
          ),
          opacity: showHardCardsButton?1.0:0,
          duration: const Duration(milliseconds: 200),
        )
    );
  }

  bool cardsLeft() => (!showHardCards && cards.length != currIndex) || (showHardCards && hardCards.length != currIndex);

}

class _SwapCardLayout extends StatelessWidget{

  final GamePytakiPageState gameState;
  final List<CardItem> cards;
  final CardController controller;
  final Key _key;
  const _SwapCardLayout(this.gameState, this.cards, this.controller, this._key);

  @override
  Widget build(BuildContext context) {
    return SwapCardLayout(
        key: _key,
        orientation: AmassOrientation.TOP,
        totalNum: cards.length,
        stackNum: 5,
        swipeEdge: 4.0,
        maxWidth: MediaQuery.of(context).size.width * GamePytakiPageState.ITEM_WIDTH_FACTOR*(1+GamePytakiPageState.GROW_FACTOR),
        maxHeight: MediaQuery.of(context).size.height* GamePytakiPageState.ITEM_HEIGHT_FACTOR*(1+GamePytakiPageState.GROW_FACTOR),
        minWidth: MediaQuery.of(context).size.width * GamePytakiPageState.ITEM_WIDTH_FACTOR,
        minHeight: MediaQuery.of(context).size.height * GamePytakiPageState.ITEM_HEIGHT_FACTOR,
        animDuration: 350,
        cardBuilder: (context, index) => cards[index],
        cardController: controller,
        swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {

          gameState.notifier.value = 20*align.x/MediaQuery.of(context).size.width; // 20 jest użyte w swap_card_layoutcie

          if (align.x < 0 && controller.swipable) {
            //Card is LEFT swiping
            gameState.setStateShowClock(true);
            gameState.setStateShowOk(false);
          } else if (align.x > 0 && controller.swipable) {
            //Card is RIGHT swiping
            gameState.setStateShowClock(false);
            gameState.setStateShowOk(true);

          }
        },
        swipeCompleteCallback: (CardSwipeOrientation orientation, int index) async {

          if(!gameState.showHardCards && orientation == CardSwipeOrientation.LEFT){
            gameState.hardCards.add(
                CardItem(
                  gameState,
                  cards[index].content,
                  isHard: true,
                  emoIndex: cards[index].emoIndex,
                  index: gameState.hardCards.length,
                  key: ValueKey(gameState.cards.length + gameState.hardCards.length + 1),
                )
            );
          }

          if(orientation != CardSwipeOrientation.RECOVER) {
            controller.swipable = false;
            gameState.currIndex = index + 1;
          }

          if(orientation != CardSwipeOrientation.RECOVER)
            await Future.delayed(const Duration(milliseconds: 500));

          gameState.setStateShowClock(false);
          gameState.setStateShowOk(false);

        }
    );
  }

}

class CardItem extends StatefulWidget{

  static const Map<String, String> EMOTIONS = {
    'emo_amezement.svg':'Zachwyt',
    'emo_anger.svg':'Złość',
    'emo_fear.svg':'Strach',
    'emo_happieness.svg':'Radość',
    'emo_sadness.svg':'Smutek',
    'emo_satisfaction.svg':'Zadowolenie'
  };
  
  final GamePytakiPageState gameState;
  final String content;
  final int emoIndex;
  final bool emoName;
  final bool isHard;
  int index;


  CardItem(this.gameState, this.content, {this.emoIndex, this.emoName = true, this.isHard = false, this.index, Key key}):super(key: key);

  @override
  State<StatefulWidget> createState() => CardItemState();
  
  void setIndex(int index){
    this.index = index;
  }
}

class CardItemState extends State<CardItem>{


  bool flipped;

  GamePytakiPageState get gameState => widget.gameState;

  @override
  void initState() {
    flipped = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Widget front = SlidingCard(
      //color: colorPack.mainColor,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/games/bg_pytajki.webp')
          ),
        ),
        child: Center(
          child: Text('?', style: AppTextStyle(color: Colors.black, fontSize: 220.0, fontWeight: weight.bold, shadow: true)),
        ),

      ),
    );

    bool flipOnTouch = (widget.index == null || gameState.currIndex == widget.index);

    if(!flipOnTouch)
      return front;

    Widget back = SlidingCard(
      color: Colors.white,
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[

          if(widget.isHard)
            Row(
              children: <Widget>[
                Expanded(child: Container()),
                const Icon(MdiIcons.clock, color: Colors.deepOrange,)
              ],
            ),

          Expanded(
            child: Column(
              children: <Widget>[
                if(widget.emoIndex!=null)
                  SvgPicture.asset('assets/images/emo/${CardItem.EMOTIONS.keys.toList()[widget.emoIndex]}', width: 48, height: 48),
                if(widget.emoIndex!=null)
                  const SizedBox(height: 6.0),

                if(widget.emoName && widget.emoIndex!=null)
                  Text(CardItem.EMOTIONS.values.toList()[widget.emoIndex], style: AppTextStyle(fontWeight: weight.halfBold, color: AppColors.text_def_enab),),

                const SizedBox(height: 24.0),

                AutoSizeText(
                  widget.content,
                  style: AppTextStyle(fontSize: 20.0, height: 1.3, fontWeight: weight.halfBold, color: AppColors.text_def_enab),
                  textAlign: TextAlign.center,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),

        ],
      ),
    );

    return FlipCard(
      front: front,
      back: back,
      onFlipDone: (_) {

        if(!gameState.cardsLeft() && !gameState.showHardCards && gameState.hardCards.isNotEmpty)
          gameState.setState(() => gameState.showHardCardsButton = true);

        gameState.controller.swipable = true;
      },
      onFlip: () => setState(() => flipped = true),
      flipOnTouch: !flipped && flipOnTouch,
      speed: 300,
    );
  }

}