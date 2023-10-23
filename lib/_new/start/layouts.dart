import 'dart:async';
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harcapp/_app_common/glow_widget.dart';
import 'package:harcapp/values/fact.dart';
import 'package:harcapp/values/holy_bible.dart';
import 'package:harcapp/_common_widgets/gyroscope_widget.dart';
import 'package:harcapp/_common_widgets/snow.dart';
import 'package:harcapp/main.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp/values/quote.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/blur.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:metaballs/metaballs.dart';

import 'quote_widget.dart';
import 'definition_widget.dart';
import 'fact_widget.dart';

class _HarcApp extends StatefulWidget{

  static const double defFontSize = 56;

  final double size;
  final Color color;
  const _HarcApp({this.size = defFontSize, this.color = AppColors.textDefEnab});

  @override
  State<StatefulWidget> createState() => _HarcAppState();

}

class _HarcAppState extends State<_HarcApp> with TickerProviderStateMixin{

  double get size => widget.size;
  Color get color => widget.color;

  late bool showH;
  late bool showA;

  late AnimationController contrH;
  late Animation<Offset> offsetH;

  late AnimationController contrA;
  late Animation<Offset> offsetA;

  startAnimation() async{
    await Future.delayed(const Duration(milliseconds: 100));
    await contrH.forward();
    setState(() => showH = true);
    await Future.delayed(const Duration(milliseconds: 400));
    contrA.forward();
    setState(() => showA = true);
  }

  @override
  void initState() {
    showH = false;
    showA = false;

    contrH = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    contrA = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));

    offsetH = Tween<Offset>(
        begin: Offset.zero, //Offset(0.0, 0.75),
        end: Offset.zero)
        .animate(CurvedAnimation(
            parent: contrH,
            curve: Curves.easeOutQuad
        )
    );

    offsetA = Tween<Offset>(
        begin: Offset.zero, //Offset(0.0, 0.75),
        end: Offset.zero
    ).animate(CurvedAnimation(
        parent: contrA,
        curve: Curves.easeOutQuad
    ));

    startAnimation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        SlideTransition(
          position: offsetH,
          child: AnimatedOpacity(
            opacity: showH?1:0,
            duration: const Duration(milliseconds: 1000),
            child: Text('Harc', style: AppTextStyle(fontSize: size, fontWeight: weight.halfBold, color: color, height: 1.0)),
          ),
        ),
        SlideTransition(
          position: offsetA,
          child: AnimatedOpacity(
            opacity: showA?1:0,
            duration: const Duration(milliseconds: 1000),
            child: Text('App', style: AppTextStyle(fontSize: size, fontWeight: weight.normal, color: color, height: 1.0)),
          ),
        ),

      ],
    );
  }

}

class HarcAppRotatedBackground extends StatefulWidget{

  final Color color;
  final double sizeFactor;
  const HarcAppRotatedBackground(this.color, {this.sizeFactor = 0.8, super.key});

  @override
  State<StatefulWidget> createState() => HarcAppRotatedBackgroundState();

}

class HarcAppRotatedBackgroundState extends State<HarcAppRotatedBackground>{

  static const String _iconPath = 'assets/images/harcapp_logo.svg';

  late bool loaded;

  load()async{
    await const SvgAssetLoader(_iconPath).loadBytes(null);
    setState(() => loaded = true);
  }

  @override
  void initState() {
    loaded = false;
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double bgIconSize = MediaQuery.of(context).size.shortestSide*widget.sizeFactor;

    return Positioned(
      bottom: -1*bgIconSize*0.167,
      left: -1*bgIconSize*0.167,
      child: RotationTransition(
        turns: const AlwaysStoppedAnimation(45 / 360),
        child: AnimatedOpacity(
          opacity: loaded?1:0,
          duration: const Duration(milliseconds: 2000),
          child: SvgPicture.asset(
              _iconPath,
              height: bgIconSize,
              width: bgIconSize,
              color: widget.color
          ),
        ),
      ),
    );
  }

}

class HarcAppLogo extends StatelessWidget{

  const HarcAppLogo({super.key});

  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.all(Dimen.defMarg),
      child: SvgPicture.asset('assets/images/harcapp_logo.svg', width: 40, height: 40)
  );
}

class HolyBibleFragWidget extends StatefulWidget{

  final List<BibleFrag> allFrags;

  const HolyBibleFragWidget(this.allFrags, {super.key});

  @override
  State<StatefulWidget> createState() => HolyBibleFragWidgetState();

}

class HolyBibleFragWidgetState extends State<HolyBibleFragWidget>{

  List<BibleFrag> get allFrags => widget.allFrags;

  late BibleFrag bibleFrag;

  @override
  void initState() {
    bibleFrag = allFrags[Random().nextInt(adwentFrags.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>  Column(
    children: <Widget>[

      Align(
        alignment: Alignment.centerLeft,
        child: Icon(
          MdiIcons.bookCross,
          size: 64.0,
          color: Colors.white,
        ),
      ),

      const SizedBox(height: 18.0),

      Text(
          bibleFrag.text,
          style: const TextStyle(
              fontFamily: 'Merriweather',
              fontSize: QuoteWidgetState.textSize,
              color: Colors.white,
              height: 1.3)
      ),

      const SizedBox(height: 32),
      Align(
        alignment: Alignment.bottomRight,
        child: Text(
          bibleFrag.source,
          style: const TextStyle(
              fontFamily: 'Merriweather',
              color: Colors.white54,
              fontSize: QuoteWidgetState.textSize+2,
              fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.end,
        ),
      ),
    ],
  );

}



class PatroniteSupport extends StatelessWidget{

  final Color textColor;

  const PatroniteSupport({this.textColor = Colors.white, super.key});

  @override
  Widget build(BuildContext context) {

    List<String> harcPatroni = [
      'Wiktor Karpała',
      'Piotr Maciej Kabata'
    ];
    harcPatroni.shuffle();

    return RotatedBox(
      quarterTurns: 3,
      child: Row(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Text('HarcPatroni: ', style: AppTextStyle(color: textColor.withOpacity(0.5), fontWeight: weight.halfBold)),
          FadeAnimatedTextKit(
              key: const ValueKey('HarcPatroni'),
              text: harcPatroni,
              duration: const Duration(seconds: 4),
              textStyle: AppTextStyle(fontWeight: weight.halfBold, color: textColor),
              textAlign: TextAlign.center,
              repeatForever: true,
            // or Alignment.topLeft
          ),
        ],
      ),
    );
  }
}

class DefaultLayout extends StatefulWidget{

  const DefaultLayout({super.key});

  @override
  State<StatefulWidget> createState(){
    switch(appMode){
      case AppMode.appModeDefault: return DefaultLayoutState();
      case AppMode.appModeAdwent: return AdwentLayoutState();
      case AppMode.appModeChristmas: return ChristmasLayoutState();
      case AppMode.appModePowstanieWielkopolskie: return PowstanieWielkopolskieLayoutState();
      case AppMode.appModeWielkiPiatek: return WielkiPiatekLayoutState();
      case AppMode.appModeZmartwychwstanie: return ZmartwychwstanieLayoutState();
      case AppMode.appModeWolyn: return WolynLayoutState();
      case AppMode.appModePowstWarsz: return PowstanieWarszawskieLayoutState();
      case AppMode.appModeAllSaints: return AllSaintsLayoutState();
      case AppMode.appModeNiepodleglosc: return NiepodlegloscLayoutState();
      default: return DefaultLayoutState();
    }
  }
}

class DefaultLayoutState extends State<DefaultLayout>{

  // 0 - quote
  // 1 - definition
  // 2 - fact
  late int messageType;

  @override
  void initState() {
    int val = Random().nextInt(9);
    if(val < 5) messageType = 0;        // 0, 1, 2, 3, 4
    else if(val < 7) messageType = 1;   // 5, 6
    else if(val < 9) messageType = 2;  // 7, 8

    super.initState();
  }

  @override
  Widget build(BuildContext context) => GradientWidget(
      radius: 0,
      colorStart: AppColors.startBackgroundDefault,
      colorEnd: Colors.teal,
      child: Stack(
        children: [

          HarcAppRotatedBackground(Colors.black.withOpacity(0.08)),

          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[

                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    children: [
                      const SizedBox(height: 48.0),

                      _HarcApp(color: Colors.black.withOpacity(0.08)),

                      const SizedBox(height: 36.0),

                      if(messageType == 0)
                        const QuoteWidget(quotes: CYTATY_REGULAR)
                      else if(messageType == 1)
                        const DefinitionWidget()
                      else if(messageType == 2)
                        FactWidget(
                          ecoFacts,
                          icon: MdiIcons.earth,
                          subtext: (fact){
                            if(fact == ecoFactPopulation) return null;
                            return 'Warto być <b>zawsze pogodnym</b>:\nna Ziemi żyje się coraz lepiej!';
                          }
                        )

                    ],
                  ),
                ),

                Container(),
                Container()
              ]
          ),
          const Positioned(
            bottom: Dimen.defMarg,
            right: Dimen.defMarg,
            child: PatroniteSupport(),
          ),

        ],
      )
  );
}

class AdwentLayoutState extends State<DefaultLayout>{

  String backgroundPath = 'assets/images/start/start_layout_adwent.webp';

  late bool chooseFrag;

  late bool backgroundPreloaded;

  Future<void> preload() async {
    await Future.delayed(Duration.zero);
    await precacheImage(AssetImage(backgroundPath), context);
    setState(() => backgroundPreloaded = true);
  }

  @override
  void initState() {
    backgroundPreloaded = false;
    preload();

    chooseFrag = Random().nextInt(adwentFrags.length + adwentFacts.length) < adwentFrags.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double unit = MediaQuery.of(context).size.width;

    return GradientWidget(
        radius: 0,
        colorStart: const Color.fromARGB(255, 14, 20, 54),
        colorEnd: const Color.fromARGB(255, 5, 5, 10),
        child:
        backgroundPreloaded?
        Stack(
          children: [

            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Image.asset(backgroundPath),
            ),

            Positioned(
              top: .18*unit,
              left: .02*unit,
              child: GlowWidget(size: .06*unit, icon: MdiIcons.heart),
            ),

            Positioned(
              top: .07*unit,
              left: .04*unit,
              child: GlowWidget(size: .06*unit, icon: MdiIcons.cross),
            ),

            Positioned(
              top: .37*unit,
              left: .14*unit,
              child: GlowWidget(size: .06*unit, icon: MdiIcons.heart),
            ),

            Positioned(
              top: .1*unit,
              left: .1*unit,
              child: GlowWidget(size: .1*unit),
            ),

            Positioned(
              top: .2*unit,
              left: .15*unit,
              child: GlowWidget(size: .1*unit, icon: MdiIcons.cross),
            ),

            Positioned(
              top: .3*unit,
              left: .2*unit,
              child: GlowWidget(size: .1*unit),
            ),

            Positioned(
              top: .35*unit,
              left: .4*unit,
              child: GlowWidget(size: .08*unit),
            ),

            Positioned(
              top: .4*unit,
              left: .3*unit,
              child: GlowWidget(size: .08*unit, icon: MdiIcons.heart),
            ),

            Positioned(
              top: .4*unit,
              left: .5*unit,
              child: GlowWidget(size: .08*unit, icon: MdiIcons.cross),
            ),

            Positioned(
              top: .45*unit,
              left: .58*unit,
              child: GlowWidget(size: .08*unit, icon: MdiIcons.heart),
            ),

            Positioned(
              top: .12*unit,
              left: .5*unit,
              child: GlowWidget(size: .08*unit, icon: MdiIcons.heart),
            ),

            Positioned(
              top: .1*unit,
              left: .3*unit,
              child: GlowWidget(size: .2*unit),
            ),

            Positioned(
              top: .2*unit,
              left: .5*unit,
              child: GlowWidget(size: .2*unit),
            ),

            Positioned(
              top: .4*unit,
              left: .653*unit,
              child: GlowWidget(size: .05*unit, icon: MdiIcons.cross),
            ),

            Positioned(
              top: .1*unit,
              left: .7*unit,
              child: GlowWidget(size: .11*unit),
            ),

            Positioned(
              top: .08*unit,
              left: .58*unit,
              child: GlowWidget(size: .11*unit, icon: MdiIcons.cross),
            ),

            Positioned(
              top: .3*unit,
              left: .8*unit,
              child: GlowWidget(size: .1*unit),
            ),
            Positioned(
              top: .22*unit,
              left: .75*unit,
              child: GlowWidget(size: .08*unit, icon: MdiIcons.cross),
            ),

            Positioned(
              top: .4*unit,
              left: .78*unit,
              child: GlowWidget(size: .06*unit, icon: MdiIcons.cross),
            ),

            HarcAppRotatedBackground(Colors.white.withOpacity(0.08)),

            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[

                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        const SizedBox(height: 34.0),

                        //_HarcApp(color: Colors.white.withOpacity(0.08)),
                        const Text(
                          'Adwent',
                          style: TextStyle(
                              fontFamily: 'PlayfairDisplay',
                              fontSize: _HarcApp.defFontSize,
                              color: Colors.white,
                              shadows: [Shadow(color: Colors.black, blurRadius: 10)]
                          ),
                        ),

                        const Text(
                          'radosny czas oczekiwania',
                          style: TextStyle(
                              fontFamily: 'PlayfairDisplay',
                              fontSize: 17.8,
                              color: Colors.white,
                              shadows: [Shadow(color: Colors.black, blurRadius: 10)]
                          ),
                        ),

                        const SizedBox(height: 36.0),

                        if(chooseFrag)
                          const HolyBibleFragWidget(adwentFrags)
                        else
                          const FactWidget(adwentFacts)
                      ],
                    ),
                  ),



                  //CytatHintWidget(),

                  Container(),
                  Container()
                  //HarcAppLogo(),
                ]
            ),
            const Positioned(
              bottom: Dimen.defMarg,
              right: Dimen.defMarg,
              child: PatroniteSupport(),
            ),

          ],
        ):
        Container()
    );
  }
}

class ChristmasLayoutState extends State<DefaultLayout>{

  static const String backgroundPath = 'assets/images/start/merry_joseph_jesus.webp';

  final bool _isRunning = true;
  late bool chooseQuote;

  late bool backgroundPreloaded;

  Future<void> preload() async {
    await Future.delayed(Duration.zero);
    await precacheImage(const AssetImage(backgroundPath), context);
    setState(() => backgroundPreloaded = true);
  }

  @override
  void initState() {
    backgroundPreloaded = false;
    preload();

    chooseQuote = Random().nextInt(7) > 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => GradientWidget(
        radius: 0,
        colorStart: Colors.lightBlueAccent,//Colors.amber,//Color.fromARGB(255, 220, 20, 20),
        colorEnd: Colors.indigo[900]!,//Colors.red[900],//Color.fromARGB(255, 110, 0, 0),
        child:
        backgroundPreloaded?
        Stack(
          children: [

            HarcAppRotatedBackground(Colors.black.withOpacity(0.08)),

            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[

                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        const SizedBox(height: 48.0),

                        SizedBox(
                          height: 100,
                          child: Image.asset(backgroundPath),
                        ),

                        const SizedBox(height: 18.0),

                        Text(
                            'Bóg się rodzi!',
                            style: AppTextStyle(fontSize: 36.0, color: Colors.white, fontWeight: weight.bold),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 36.0),

                        if(chooseQuote)
                          const QuoteWidget(quotes: CYTATY_REGULAR)
                        else
                          const DefinitionWidget()
                      ],
                    ),
                  ),



                  //CytatHintWidget(),

                  Container(),
                  Container()
                  //HarcAppLogo(),
                ]
            ),
            const Positioned(
              bottom: Dimen.defMarg,
              right: Dimen.defMarg,
              child: PatroniteSupport(),
            ),

            SnowWidget(totalSnow: 150, speed: 0.3, isRunning: _isRunning)
          ],
        ):
        Container()
    );

}

class PowstanieWielkopolskieLayoutState extends State<DefaultLayout>{

  @override
  Widget build(BuildContext context) => GradientWidget(
      radius: 0,
      colorStart: Colors.white,
      colorEnd: Colors.grey,
      child: Stack(
        children: [

          Column(
              children:[

                const SizedBox(height: 32.0),

                Center(
                  child: SvgPicture.asset(
                    'assets/images/start/powstanie_wielkopolskie_orzel.svg',
                    width: MediaQuery.of(context).size.shortestSide/2,
                    color: Colors.red[700]!,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      top: 32,
                      left: 32,
                      right: 32
                  ),
                  child: Text(
                    '16 lutego 1919 A.D.',
                    style: GoogleFonts.cinzelDecorative(
                        fontSize: QuoteWidgetState.textSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.red[700]!,
                        height: 1.3
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 32,
                    right: 32,
                  ),
                  child: Text(
                    'Zwycięstwo Powstania Wielkopolskiego',
                    style: GoogleFonts.cinzelDecorative(
                        fontSize: QuoteWidgetState.textSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.red[700]!,
                        height: 1.3
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/images/start/powstanie_wielkopolskie_zolnierz.webp',
                      width: MediaQuery.of(context).size.shortestSide/1.2,
                    ),
                  ),
                )

              ]
          ),

          const Positioned(
            bottom: Dimen.defMarg,
            right: Dimen.defMarg,
            child: PatroniteSupport(),
          )

        ],
      )
  );

}

class WielkiPiatekLayoutState extends State<DefaultLayout>{

  static const backgroundPath = 'assets/images/start/start_good_friday.webp';

  late bool imageLoaded;

  loadBackground() async {
    await Future.delayed(Duration.zero);
    await precacheImage(const AssetImage(backgroundPath), context);
    setState(() => imageLoaded = true);
  }

  @override
  void initState() {

    imageLoaded = false;
    loadBackground();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
      color: Colors.black,
      child: Column(
        children: [

          Stack(
            children: [

              AspectRatio(
                  aspectRatio: 3/2,
                  child: AnimatedOpacity(
                    opacity: imageLoaded?1:0,
                    duration: const Duration(seconds: 1),
                    child: Image.asset(backgroundPath),
                  ),
              ),

              Positioned.fill(
                child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black,
                          ],
                        )
                    )
                ),
              ),

            ],
          ),
          
          Expanded(child: Stack(
            children: [

              HarcAppRotatedBackground(Colors.white.withOpacity(0.08)),

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 64, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Eloi, lema sabachthani?',
                        textAlign: TextAlign.center,
                        style: AppTextStyle(color: Colors.white, fontSize: 32.0),
                      ),
                      const SizedBox(height: Dimen.defMarg),
                      Text(
                        'Wielki piątek.',
                        textAlign: TextAlign.end,
                        style: AppTextStyle(color: Colors.white, fontSize: 24.0, fontWeight: weight.bold),
                      ),
                    ],
                  )
                ),
              ),

              Positioned(
                bottom: Dimen.defMarg,
                right: Dimen.defMarg,
                child: PatroniteSupport(textColor: Colors.white.withOpacity(.2)),
              )

            ],
          ))
          
        ],
      )
  );

}

class ZmartwychwstanieLayoutState extends State<DefaultLayout>{

  late bool glow;
  static const glowDuration = Duration(milliseconds: 1300);

  ValueNotifier<List<double>>? notifier;

  @override
  void initState() {
    glow = true;

    () async{
      while(true){
        await Future.delayed(glowDuration);
        if(mounted) setState(() => glow = !glow);
      }
    }();

    notifier = ValueNotifier([0, 0, 0]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) => GradientWidget(
      radius: 0,
      colorStart: Colors.yellow,
      colorEnd: Colors.orange,
      child: Stack(
        children: [

          const HarcAppRotatedBackground(Colors.orange),

          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[

                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    children: [

                      _HarcApp(color: Colors.white.withOpacity(0.2)),

                      const SizedBox(height: 36.0),

                      SizedBox(
                        height: 100,
                        child: Stack(
                          children: <Widget>[

                            Container(
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: Container(
                                height: 60,
                                width: 50,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40.0),
                                      topRight: Radius.circular(40.0),
                                      bottomLeft: Radius.circular(4.0),
                                      bottomRight: Radius.circular(4.0),
                                    )
                                ),
                              ),
                            ),

                            AnimatedOpacity(
                              duration: glowDuration,
                              opacity: glow?0.6:0.2,
                              child: Container(
                                color: Colors.transparent,
                                alignment: Alignment.center,
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100.0)
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 175),
                              child: GyroscopeWidget(
                                multipleY: 0,
                                multipleX: 44,
                                child: SvgPicture.asset(
                                  'assets/images/resur_rock.svg',
                                  height: 110,
                                  width: 110,
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),

                      const QuoteWidget(quote: tischnerZmartwychwstwanie)
                    ],
                  ),
                ),

                Container(),
                Container(),
                Container(),
                Container()

                //CytatHintWidget(),
                //const HarcAppLogo(),
              ]
          ),

          const Positioned(
            bottom: Dimen.defMarg,
            right: Dimen.defMarg,
            child: PatroniteSupport(textColor: Colors.pink),
          )

        ],
      )
  );

}

class WolynLayoutState extends State<DefaultLayout>{

  @override
  Widget build(BuildContext context) => Container(
    color: Colors.black,
    child: Metaballs(
        color: Colors.black,
        effect: MetaballsEffect.follow(
          growthFactor: 1,
          smoothing: 1,
          radius: 0.5,
        ),
        gradient: LinearGradient(
            colors: [
              Colors.orange[600]!,
              Colors.red[800]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        ),
        metaballs: 110,
        animationDuration: const Duration(milliseconds: 200),
        speedMultiplier: 1,
        bounceStiffness: 5,
        minBallRadius: 7,
        maxBallRadius: 30,
        glowRadius: 0.3,
        glowIntensity: 1,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              const Text(
                'Wołyń 1943',
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Hand15',
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 36.0),

              Text(
                '„Nie o zemstę,\nlecz o pamięć i prawdę\nwołają ofiary.”',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Hand15',
                  color: Colors.black,
                  shadows: <Shadow>[
                    Shadow(
                      blurRadius: 100.0,
                      color: Colors.orange[800]!,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 160.0),

            ],
          ),
        )
    ),
  );

}

class PowstanieWarszawskieLayoutState extends State<DefaultLayout>{

  static const String BG_IMG_PATH = 'assets/images/start/start_layout_pol_walcz_bg.webp';

  late bool imageLoaded;

  loadImage()async{
    post(() async => await precacheImage(const AssetImage(BG_IMG_PATH), context));
    setState(() => imageLoaded = true);
  }

  @override
  void initState() {
    imageLoaded = false;
    loadImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(!imageLoaded)
      return Container(
        color: Colors.black,
      );

    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(BG_IMG_PATH),
              fit: BoxFit.cover,
              alignment: Alignment.center
          ),
        ),
        //color: Colors.red,
        child: Stack(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: _HarcApp(size: 48.0, color: Colors.white,),
                  ),

                  SvgPicture.asset(
                    'assets/images/hist/hist_2.svg',
                    color: Colors.white,
                    height: 100,
                  ),

                  const Padding(
                    padding: EdgeInsets.only(right: 24, left: 24),
                    child: QuoteWidget(quotes: CYTATY_POWST_WARSZ),
                  ),

                  const HarcAppLogo(),
                ]
            ),
            const Positioned(
              bottom: Dimen.defMarg,
              right: Dimen.defMarg,
              child: PatroniteSupport(),
            )

          ],
        )
    );
  }
}

class WaveDownClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;

}

class WaveUpClipper extends CustomClipper<Rect> {

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(-.3*size.width, 0, 1.3*size.width, 1.5*size.height);
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;

}

class SaintData{

  final String name;
  final String imageName;
  final double glowXPositionFraction;
  final double glowYPositionFraction;
  final double glowSizeFraction;
  final String description;

  const SaintData({
    required this.name,
    required this.imageName,
    required this.glowXPositionFraction,
    required this.glowYPositionFraction,
    required this.glowSizeFraction,
    required this.description,
  });

}

class AnimatedCircleGlow extends StatefulWidget{

  const AnimatedCircleGlow({super.key});

  @override
  State<StatefulWidget> createState() => AnimatedCircleGlowState();

}

class AnimatedCircleGlowState extends State<AnimatedCircleGlow>{

  late Color colorStart;
  late Color colorEnd;

  late Color colorStartSecond;
  late Color colorEndSecond;

  void run() async {
    while(true){
      await Future.delayed(const Duration(milliseconds: 400));
      if(!mounted) return;
      setState((){
        colorStart = Colors.yellow[400]!;
        colorEnd = Colors.deepOrange[800]!;
      });
      await Future.delayed(const Duration(milliseconds: 400));
      if(!mounted) return;
      setState((){
        colorStart = Colors.deepOrange[800]!;
        colorEnd = Colors.yellow[400]!;
      });
    }
  }

  void runSecond() async {
    while(true){
      await Future.delayed(const Duration(milliseconds: 250));
      if(!mounted) return;
      setState((){
        colorStartSecond = Colors.yellow[100]!;
        colorEndSecond = Colors.deepOrange[800]!;
      });
      await Future.delayed(const Duration(milliseconds: 250));
      if(!mounted) return;
      setState((){
        colorStartSecond = Colors.deepOrange[800]!;
        colorEndSecond = Colors.yellow[100]!;
      });
    }
  }

  @override
  void initState() {
    colorStart = Colors.yellow[400]!;
    colorEnd = Colors.deepOrange[800]!;
    colorStartSecond = Colors.yellow[100]!;
    colorEndSecond = Colors.deepOrange[800]!;
    run();
    runSecond();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Stack(
    clipBehavior: Clip.none,
    children: [

      GradientWidget(
        colorStart: colorStart,
        colorEnd: colorEnd,
        radius: 1000,
        elevation: 10.0,
        child: Container(),
      ),

      Opacity(
        opacity: .5,
        child: GradientWidget(
          colorStart: colorStartSecond,
          colorEnd: colorEndSecond,
          radius: 1000,
          alignment: Alignment.topRight,
          child: Container(),
        ),
      )

    ],
  );

}

class AllSaintsLayoutState extends State<DefaultLayout>{

  static const double photoPadding = 20;

  List<SaintData> data = [

    const SaintData(
        name: 'bł. Chiara Badano',
        imageName: 'bl_chiara_badano',
        glowXPositionFraction: .21,
        glowYPositionFraction: -.1,
        glowSizeFraction: .7,
        description: '19-latka wychowana przez mamę, licealistka, sportowiec, działała dla potrzebujących. Dwa lata walczyła z rakiem. Do końca żyła w przyjaźni z Bogiem. Przyjaciele przychodzili ją pocieszać, tymczasem sami wychodzili umocnieni.'
    ),

    const SaintData(
        name: 'bł. Sandra Sabattini',
        imageName: 'bl_sandra_sabattini',
        glowXPositionFraction: .23,
        glowYPositionFraction: -.08,
        glowSizeFraction: .55,
        description: '22-latka, narzeczona, grała w piłkę z bratem i jego kolegami. Poświęciła życie biednym, niepełnosprawnym i narkomanom, kiedy to poznała Boga w codziennej modlitwie.'
    ),

    const SaintData(
        name: 'bł. Stanisław Rother',
        imageName: 'bl_stanislaw_rother',
        glowXPositionFraction: .14,
        glowYPositionFraction: -.08,
        glowSizeFraction: .7,
        description: 'Kapłan, misjonarz w Gwatemali, gdzie zbudował szpital. Za pomoc ludności został ogłoszony wrogiem publicznym. Wiedział, że grozi mu śmierć, ale jako jedyny nie opuścił placówki.'
    ),

    const SaintData(
      name: 'św. Carlo Acutis',
      imageName: 'sw_carlo_acutis',
      glowXPositionFraction: .29,
      glowYPositionFraction: -.09,
      glowSizeFraction: .5,
      description: '15-latek, programista, amator gry na saksofonie, piłkarz, dusza towarzystwa. Świadek wiary, zmarły na białaczkę, autorytet rówieśników chcących żyć tak, jak żył on.',
    ),

    const SaintData(
        name: 'św. Joanna Skwarczyńska',
        imageName: 'sw_joanna_skwarczynska',
        glowXPositionFraction: .16,
        glowYPositionFraction: -.1,
        glowSizeFraction: .7,
        description: 'Łódzka harcerka, moralna wagarowiczka. Podczas wojny wywieziona do Kazachstanu, później grała w tajnym teatrze we Lwowie. Oddana przyjaciołom, braterska, wierna Bogu.'
    ),

    const SaintData(
        name: 'św. Maksymilian Maria Kolbe',
        imageName: 'sw_maksymilian_maria_kolbe',
        glowXPositionFraction: .23,
        glowYPositionFraction: -.1,
        glowSizeFraction: .55,
        description: 'Franciszkanin, doktor nauk, misjonarz w Japonii. Podczas wojny trafił do Auschwitz. Potajemnie pełnił posługę kapłańską dla współwięźniów, zmarł zgłosiwszy się na śmierć zamiast skazanego więźnia - męża i ojca.'
    ),

    const SaintData(
        name: 'św. Stanisław Kostka',
        imageName: 'sw_stanislaw_kostka',
        glowXPositionFraction: .13,
        glowYPositionFraction: -.08,
        glowSizeFraction: .7,
        description: '18-latek, szlachcic, jezuita, jako dziecko bardzo wrażliwy. Uczył się we Wiedniu. Uciekł z domu, by móc wstąpić do zakonu. Patron Polski.'
    ),

    const SaintData(
        name: 'bł. Wincenty Frelichowski',
        imageName: 'sw_wicek',
        glowXPositionFraction: .335,
        glowYPositionFraction: .31,
        glowSizeFraction: .35,
        description: 'Harcerz, drużynowy, instruktor, ksiądz; wędrował, żeglował, śpiewał. Zesłany do niemieckiego obozu koncentracyjnego. Zgłosił się, by służyć chorym na tyfus, na który zmarł dwa miesiące przed wyzwoleniem obozu.'
    ),

  ];

  late SaintData selectedSaint;

  @override
  void initState() {
    selectedSaint = data[Random().nextInt(data.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) => GradientWidget(
      radius: 0,
      colorStart: Colors.lightBlue[100]!,
      colorEnd: Colors.blue[300]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [

                  const SizedBox(height: 20.0),

                  AutoSizeText(
                    'Dzień\nWszystkich Świętych',
                    maxLines: 2,
                    style: GoogleFonts.cinzelDecorative(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.amber[800]!,
                        height: 1.3
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 32.0),

                  Row(
                    children: [

                      Expanded(child: Container()),

                      Expanded(
                        flex: 3,
                        child: LayoutBuilder(
                          builder: (BuildContext context, BoxConstraints constraints) {

                            double baseSize = constraints.maxWidth - 2*photoPadding;

                            double glowSize = baseSize*selectedSaint.glowSizeFraction;
                            double glowXPosition = photoPadding + baseSize*selectedSaint.glowXPositionFraction;
                            double glowYPosition = photoPadding + baseSize*selectedSaint.glowYPositionFraction;

                            return Stack(
                              clipBehavior: Clip.none,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.all(photoPadding),
                                  child: Image.asset(
                                      'assets/images/start/saints/${selectedSaint.imageName}.webp'
                                  ),
                                ),

                                Positioned.fill(child: Blur(
                                    child: Container()
                                )),

                                Positioned(
                                  left: glowXPosition,
                                  top: glowYPosition,
                                  child: SizedBox(
                                    width: glowSize,
                                    height: glowSize,
                                    child: const AnimatedCircleGlow(),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(photoPadding),
                                  child: Image.asset(
                                      'assets/images/start/saints/${selectedSaint.imageName}.webp'
                                  ),
                                ),

                              ],
                            );

                          },
                        ),
                      ),

                      Expanded(child: Container()),

                    ],
                  ),

                  AutoSizeText(
                    selectedSaint.name,
                    maxLines: 1,
                    style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_APPBAR,
                      fontWeight: weight.halfBold,
                      color: Colors.black,
                      shadow: true
                    ),
                  ),

                  const SizedBox(height: 36.0),

                  Text(
                    selectedSaint.description,
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_BIG,
                        color: Colors.black87
                    ),
                  ),

                  Expanded(child: Container()),

                  const SizedBox(height: 6.0),

                  AutoSizeText(
                    'Świętość jest dla każdego.\nDla Ciebie też :)',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cinzelDecorative(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.amber[800]!,
                        height: 1.3,
                        shadows: [
                          Shadow(
                            offset: const Offset(1.0, 1.0),
                            blurRadius: 3.0,
                            color: Colors.blue[900]!.withOpacity(.5),
                          )
                        ]
                    ),
                  ),

                ],
              ),
            ),
          ),

        ],
      )
  );

}

class NiepodlegloscLayoutState extends State<DefaultLayout>{

  @override
  Widget build(BuildContext context) => GradientWidget(
      radius: 0,
      colorStart: Colors.red[900]!,
      colorEnd: Colors.deepOrange,
      child: Stack(
        children: [

          HarcAppRotatedBackground(Colors.white.withOpacity(0.14)),

          Column(
              children:[

                ClipPath(
                  clipper: WaveDownClipper(),
                  child: PhysicalModel(
                    color: Colors.black,
                    child: GradientWidget(
                        radius: 0,
                        colorStart: Colors.white,
                        colorEnd: const Color.fromARGB(255, 210, 210, 210),
                        height: MediaQuery.of(context).size.height/2.4,
                        child: Column(
                          children: [

                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: _HarcApp(size: 48.0, color: Colors.black12),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 32, right: 32),
                              child: Text(
                                'Niepodległość nie jest nam dana raz na zawsze.',
                                style: GoogleFonts.cinzelDecorative(
                                    fontSize: QuoteWidgetState.textSize,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red[700],
                                    height: 1.3
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),

                            const SizedBox(height: 36.0),
                            const SizedBox(height: 12.0),

                          ],
                        )
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 32, right: 32),
                  child: Text(
                    'Wymaga od każdego pokolenia troski o ojczyznę.',
                    style: GoogleFonts.cinzelDecorative(
                        fontSize: QuoteWidgetState.textSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1.3
                    ),
                    textAlign: TextAlign.center,
                  ),
                )

              ]
          ),

          const Positioned(
            bottom: Dimen.defMarg,
            right: Dimen.defMarg,
            child: PatroniteSupport(),
          )

        ],
      )
  );

}