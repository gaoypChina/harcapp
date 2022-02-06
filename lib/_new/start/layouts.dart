import 'dart:async';
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harcapp/_app_common/glow_widget.dart';
import 'package:harcapp/values/definition.dart';
import 'package:harcapp/values/fact.dart';
import 'package:harcapp/values/holy_bible.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/gyroscope_widget.dart';
import 'package:harcapp/_common_widgets/snow.dart';
import 'package:harcapp/main.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp/values/quote.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class _HarcApp extends StatefulWidget{

  static const double defFontSize = 56;

  final double size;
  final Color color;
  final bool shadow;
  const _HarcApp({this.size: defFontSize, this.color: AppColors.text_def_enab, this.shadow: false});

  @override
  State<StatefulWidget> createState() => _HarcAppState();

}

class _HarcAppState extends State<_HarcApp> with TickerProviderStateMixin{

  double get size => widget.size;
  Color get color => widget.color;
  bool get shadow => widget.shadow;

  bool showH;
  bool showA;

  AnimationController contrH;
  Animation<Offset> offsetH;

  AnimationController contrA;
  Animation<Offset> offsetA;

  startAnimation() async{
    await Future.delayed(Duration(milliseconds: 100));
    await contrH.forward();
    setState(() => showH = true);
    await Future.delayed(Duration(milliseconds: 400));
    contrA.forward();
    setState(() => showA = true);
  }

  @override
  void initState() {
    showH = false;
    showA = false;

    contrH = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    contrA = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));

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
            child: Text('Harc', style: AppTextStyle(fontSize: size, fontWeight: weight.halfBold, color: color, shadow: shadow, height: 1.0)),
            opacity: showH?1:0,
            duration: Duration(milliseconds: 1000),
          ),
        ),
        SlideTransition(
          position: offsetA,
          child: AnimatedOpacity(
            child: Text('App', style: AppTextStyle(fontSize: size, fontWeight: weight.normal, color: color, shadow: shadow, height: 1.0)),
            opacity: showA?1:0,
            duration: Duration(milliseconds: 1000),
          ),
        ),

      ],
    );
  }

}

class HarcAppRotatedBackground extends StatefulWidget{

  final Color color;
  const HarcAppRotatedBackground(this.color);

  @override
  State<StatefulWidget> createState() => HarcAppRotatedBackgroundState();

}

class HarcAppRotatedBackgroundState extends State<HarcAppRotatedBackground>{

  static const String _ICON_PATH = 'assets/images/harcapp_logo.svg';

  bool loaded;

  load()async{
    await precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, _ICON_PATH), null);
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

    double bgIconSize = MediaQuery.of(context).size.width*.9;

    return Positioned(
      bottom: -1*bgIconSize*0.167,
      left: -1*bgIconSize*0.167,
      child: RotationTransition(
        child: AnimatedOpacity(
          opacity: loaded?1:0,
          duration: Duration(milliseconds: 2000),
          child: SvgPicture.asset(
              _ICON_PATH,
              height: bgIconSize,
              width: bgIconSize,
              color: widget.color),
        ),
        turns: AlwaysStoppedAnimation(45 / 360),
      ),
    );
  }

}

class HarcAppLogo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(Dimen.DEF_MARG),
        child: SvgPicture.asset('assets/images/harcapp_logo.svg', width: 40, height: 40,)
    );
  }
}

class HolyBibleFragWidget extends StatefulWidget{

  final List<BibleFrag> allFrags;

  const HolyBibleFragWidget(this.allFrags);

  @override
  State<StatefulWidget> createState() => HolyBibleFragWidgetState();

}

class HolyBibleFragWidgetState extends State<HolyBibleFragWidget>{

  List<BibleFrag> get allFrags => widget.allFrags;

  BibleFrag bibleFrag;

  @override
  void initState() {
    bibleFrag = allFrags[Random().nextInt(adwentFrags.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[

        Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            MdiIcons.bookCross,
            size: 64.0,
            color: Colors.white,
          ),
        ),

        SizedBox(height: 18.0),

        Text(
            bibleFrag.text,
            style: TextStyle(
                fontFamily: 'Merriweather',
                //fontWeight: FontWeight.,
                fontSize: CytatWidgetState.textSize,
                color: Colors.white,
                height: 1.3)
        ),

        SizedBox(height: 32),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            bibleFrag.source,
            style: TextStyle(
                fontFamily: 'Merriweather',
                color: Colors.white54,
                fontSize: CytatWidgetState.textSize+2,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

}

class FactWidget extends StatefulWidget{

  final List<Fact> allFacts;

  const FactWidget(this.allFacts);

  @override
  State<StatefulWidget> createState() => FactWidgetState();

}

class FactWidgetState extends State<FactWidget>{

  List<Fact> get allFacts => widget.allFacts;

  Fact fact;

  @override
  void initState() {
    fact = allFacts[Random().nextInt(allFacts.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: CytatWidgetState.iconSize,
            height: CytatWidgetState.iconSize,
            child: Center(
              child: Icon(
                MdiIcons.lightbulb,
                size: 38.0,
                color: Colors.white,
              ),
            ),
          ),
        ),

        SizedBox(height: 18.0),

        Text(
          'Czy wiesz, że...',
          style: TextStyle(
            fontFamily: 'Merriweather',
              color: Colors.white,
              fontSize: DefinitionWidgetState.textSize+6,
              fontWeight: FontWeight.bold
          ),
        ),

        SizedBox(height: 18.0),

        Text(
            fact.text,
            style: AppTextStyle(
                fontSize: DefinitionWidgetState.textSize, color: Colors.white, height: 1.3)
        ),


      ],
    );
  }

}

class DefinitionWidget extends StatefulWidget{

  final Definition definition;

  const DefinitionWidget({this.definition});

  @override
  State<StatefulWidget> createState() => DefinitionWidgetState();

}

class DefinitionWidgetState extends State<DefinitionWidget>{

  static const double textSize = CytatWidgetState.textSize;
  static const double iconSize = 42.0;

  Definition _definition;
  Definition get definition => widget.definition??_definition;

  @override
  void initState() {

    if(widget.definition == null)
      _definition = allDefinitions[Random().nextInt(allDefinitions.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: CytatWidgetState.iconSize,
            height: CytatWidgetState.iconSize,
            child: Center(
              child: Icon(
                MdiIcons.bookOpenPageVariant,
                size: 38.0,
                color: Colors.white,
              ),
            ),
          ),
        ),

        SizedBox(height: 18.0),

        Text(
          definition.word,
          style: TextStyle(
              fontFamily: 'Merriweather',
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: textSize+6,
          ),
        ),

        SizedBox(height: 18.0),

        Text(
            definition.description,
            style: AppTextStyle(
                //fontFamily: 'Merriweather',
                fontSize: textSize,
                color: Colors.white,
                //fontWeight: weight.halfBold,
                height: 1.3
            )
        ),


      ],
    );
  }

}

class CytatWidget extends StatefulWidget{

  final Quote cytat;
  final List<Quote> cytaty;

  const CytatWidget({this.cytat, this.cytaty});

  @override
  State<StatefulWidget> createState() => CytatWidgetState();

}

class CytatWidgetState extends State<CytatWidget> with TickerProviderStateMixin{

  static const double textSize = 18.0;
  static const double iconSize = 64.0;

  Quote cytat;
  bool _showAuthor;

  Animation<Offset> offsetQ;

  List<Quote> get cytaty => widget.cytaty;

  startAnimation() async{
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() => _showAuthor = true);
  }

  @override
  void initState() {

    _showAuthor = false;

    if(widget.cytat == null)
      cytat = cytaty[Random().nextInt(cytaty.length)];
    else
      cytat = widget.cytat;

    startAnimation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            MdiIcons.formatQuoteClose,
            size: 64.0,
            color: Colors.white,
          ),
        ),

        SizedBox(height: 18.0),

        Text(
            cytat.cytat,
            style: TextStyle(
              fontFamily: 'Merriweather',
                //fontWeight: weight.halfBold,
                fontSize: textSize,
                color: Colors.white,
                height: 1.3
            )
        ),


        SizedBox(height: 32),
        AnimatedOpacity(
          opacity: _showAuthor?1.0:0.0,
          child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '~ ${cytat.autor}',
                style: TextStyle(
                    fontFamily: 'Merriweather',
                    color: Colors.white54,
                    fontSize: textSize+2,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.end,
              ),
          ), duration: Duration(seconds: 2),
        ),
      ],
    );
  }

}

class CytatHintWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => CytatHintWidgetState();
}

class CytatHintWidgetState extends State<CytatHintWidget>{

  bool _showClickHint;

  @override
  void initState() {
    _showClickHint = false;
    Timer(const Duration(seconds: 18), () => setState(() => _showClickHint = true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _showClickHint?1.0:0.0,
      child: Align(
          alignment: Alignment.center,
          child: Text('Kliknij cytat, aby kontynuować...', style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_SMALL, color: hintEnab_(context)))
      ), duration: Duration(seconds: 2),
    );
  }
}

class PatroniteSupport extends StatelessWidget{

  final Color textColor;

  const PatroniteSupport({this.textColor: Colors.white});

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
              key: ValueKey('HarcPatroni'),
              text: harcPatroni,
              duration: Duration(seconds: 4),
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

  const DefaultLayout();

  @override
  State<StatefulWidget> createState(){

    switch(appMode){
      case AppMode.APP_MODE_DEFAULT: return DefaultLayoutState();
      case AppMode.APP_MODE_ADWENT: return AdwentLayoutState();
      case AppMode.APP_MODE_CHRISTMAS: return ChristmasLayoutState();
      case AppMode.APP_MODE_ZMARTWYCHWSTANIE: return ZmartwychwstanieLayoutState();
      case AppMode.APP_MODE_POWST_WARSZ: return PowstanieWarszawskieLayoutState();
      case AppMode.APP_MODE_NIEPODLEGLOSC: return NiepodlegloscLayoutState();
      default: return DefaultLayoutState();
    }
  }
}

class DefaultLayoutState extends State<DefaultLayout>{

  bool chooseQuote;

  @override
  void initState() {
    chooseQuote = Random().nextInt(7) > 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GradientWidget(
      radius: 0,
      colorStart: AppColors.start_background_default,
      colorEnd: Colors.teal,
      child: Stack(
        children: [

          HarcAppRotatedBackground(Colors.black.withOpacity(0.08)),

          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[

                Padding(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    children: [
                      SizedBox(height: 48.0),

                      _HarcApp(color: Colors.black.withOpacity(0.08)),

                      SizedBox(height: 36.0),

                      if(chooseQuote)
                        CytatWidget(cytaty: CYTATY_REGULAR)
                      else
                        DefinitionWidget()
                    ],
                  ),
                ),



                //CytatHintWidget(),

                Container(),
                Container()
                //HarcAppLogo(),
              ]
          ),
          Positioned(
            bottom: Dimen.DEF_MARG,
            right: Dimen.DEF_MARG,
            child: PatroniteSupport(),
          ),

        ],
      )
    );
  }
}

class AdwentLayoutState extends State<DefaultLayout>{

  String backgroundPath = 'assets/images/start/start_layout_adwent.webp';

  bool chooseFrag;

  bool backgroundPreloaded;

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
        colorStart: Color.fromARGB(255, 14, 20, 54),
        colorEnd: Color.fromARGB(255, 5, 5, 10),
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
                    padding: EdgeInsets.all(32),
                    child: Column(
                      children: [
                        SizedBox(height: 34.0),

                        //_HarcApp(color: Colors.white.withOpacity(0.08)),
                        Text(
                          'Adwent',
                          style: TextStyle(
                              fontFamily: 'PlayfairDisplay',
                              fontSize: _HarcApp.defFontSize,
                              color: Colors.white,
                              shadows: [Shadow(color: Colors.black, blurRadius: 10)]
                          ),
                        ),

                        Text(
                          'radosny czas oczekiwania',
                          style: TextStyle(
                              fontFamily: 'PlayfairDisplay',
                              fontSize: 17.8,
                              color: Colors.white,
                              shadows: [Shadow(color: Colors.black, blurRadius: 10)]
                          ),
                        ),

                        SizedBox(height: 36.0),

                        if(chooseFrag)
                          HolyBibleFragWidget(adwentFrags)
                        else
                          FactWidget(adwentFacts)
                      ],
                    ),
                  ),



                  //CytatHintWidget(),

                  Container(),
                  Container()
                  //HarcAppLogo(),
                ]
            ),
            Positioned(
              bottom: Dimen.DEF_MARG,
              right: Dimen.DEF_MARG,
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

  bool _isRunning = true;
  bool chooseQuote;

  bool backgroundPreloaded;

  Future<void> preload() async {
    await Future.delayed(Duration.zero);
    await precacheImage(AssetImage(backgroundPath), context);
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
  Widget build(BuildContext context) {

    return GradientWidget(
        radius: 0,
        colorStart: Colors.lightBlueAccent,//Colors.amber,//Color.fromARGB(255, 220, 20, 20),
        colorEnd: Colors.indigo[900],//Colors.red[900],//Color.fromARGB(255, 110, 0, 0),
        child:
        backgroundPreloaded?
        Stack(
          children: [

            HarcAppRotatedBackground(Colors.black.withOpacity(0.08)),

            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[

                  Padding(
                    padding: EdgeInsets.all(32),
                    child: Column(
                      children: [
                        SizedBox(height: 48.0),

                        SizedBox(
                          height: 100,
                          child: Image.asset(backgroundPath),
                        ),

                        SizedBox(height: 18.0),

                        Text(
                            'Bóg się rodzi!',
                            style: AppTextStyle(fontSize: 36.0, color: Colors.white, fontWeight: weight.bold),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 36.0),

                        if(chooseQuote)
                          CytatWidget(cytaty: CYTATY_REGULAR)
                        else
                          DefinitionWidget()
                      ],
                    ),
                  ),



                  //CytatHintWidget(),

                  Container(),
                  Container()
                  //HarcAppLogo(),
                ]
            ),
            Positioned(
              bottom: Dimen.DEF_MARG,
              right: Dimen.DEF_MARG,
              child: PatroniteSupport(),
            ),

            SnowWidget(totalSnow: 150, speed: 0.3, isRunning: _isRunning)
          ],
        ):
        Container()
    );

  }
}

class ZmartwychwstanieLayoutState extends State<DefaultLayout>{

  bool glow;
  static const glowDuration = const Duration(milliseconds: 1300);

  ValueNotifier<List<double>> notifier;

  @override
  void initState() {
    glow = true;

    () async{
      while(true){
        await Future.delayed(glowDuration);
        setState(() => glow = !glow);
      }
    }();

    notifier = ValueNotifier([0, 0, 0]);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.app_yellow_main,
        child: Stack(
          children: [

            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Padding(
                    padding: EdgeInsets.only(top: 38, bottom: 18.0),
                    child: _HarcApp(size: 48.0, color: Colors.white,),
                  ),

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
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(40.0),
                                  topRight: const Radius.circular(40.0),
                                  bottomLeft: const Radius.circular(4.0),
                                  bottomRight: const Radius.circular(4.0),
                                )
                            ),
                          ),
                        ),

                        AnimatedOpacity(
                          child: Container(
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(const Radius.circular(100.0))
                              ),
                            ),
                          ),
                          duration: glowDuration,
                          opacity: glow?0.6:0.2,
                        ),

                        GyroscopeWidget(
                          child: Padding(
                            padding: EdgeInsets.only(left: 85),
                            child: SvgPicture.asset('assets/images/resur_rock.svg'),
                          ),
                          multipleY: 0,
                          multipleX: 24,
                        ),


                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(right: 24, left: 24),
                    child: CytatWidget(cytat: tischnerZmartwychwstwanie),
                  ),
                  CytatHintWidget(),
                  HarcAppLogo(),
                ]
            ),

            Positioned(
              bottom: Dimen.DEF_MARG,
              right: Dimen.DEF_MARG,
              child: PatroniteSupport(textColor: Colors.pink,),
            )


          ],
        )
    );
  }

}

class PowstanieWarszawskieLayoutState extends State<DefaultLayout>{

  static const String BG_IMG_PATH = 'assets/images/start/start_layout_pol_walcz_bg.webp';

  bool imageLoaded;

  loadImage()async{
    post(() async => await precacheImage(AssetImage(BG_IMG_PATH), context));
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
        decoration: BoxDecoration(
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
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: _HarcApp(size: 48.0, color: Colors.white,),
                  ),

                  SvgPicture.asset(
                    'assets/images/hist/hist_2.svg',
                    color: Colors.white,
                    height: 100,
                  ),

                  Padding(
                    padding: EdgeInsets.only(right: 24, left: 24),
                    child: CytatWidget(cytaty: CYTATY_POWST_WARSZ),
                  ),

                  HarcAppLogo(),
                ]
            ),
            Positioned(
              bottom: Dimen.DEF_MARG,
              right: Dimen.DEF_MARG,
              child: PatroniteSupport(),
            )

          ],
        )
    );
  }
}

class WaveClipper extends CustomClipper<Path> {

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

class NiepodlegloscLayoutState extends State<DefaultLayout>{

  @override
  Widget build(BuildContext context) {

    return GradientWidget(
      radius: 0,
        colorStart: Colors.red[900],
        colorEnd: Colors.deepOrange,
        child: Stack(
          children: [

            HarcAppRotatedBackground(Colors.white.withOpacity(0.14)),

            Column(
                children:[

                  ClipPath(
                    clipper: WaveClipper(),
                    child: PhysicalModel(
                      color: Colors.black,
                      child: GradientWidget(
                        radius: 0,
                        colorStart: Colors.white,
                        colorEnd: Color.fromARGB(255, 210, 210, 210),
                        height: MediaQuery.of(context).size.height/2.4,
                        child: Column(
                          children: [

                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: _HarcApp(size: 48.0, color: Colors.black12),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: 32, right: 32),
                              child: Text(
                                'Niepodległość nie jest nam dana raz na zawsze.',
                                style: GoogleFonts.cinzelDecorative(
                                    fontSize: CytatWidgetState.textSize,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red[700],
                                    height: 1.3
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),

                            SizedBox(height: 36.0),
                            SizedBox(height: 12.0),

                          ],
                        )
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 12.0, left: 32, right: 32),
                    child: Text(
                      'Wymaga od każdego pokolenia troski o ojczyznę.',
                      style: GoogleFonts.cinzelDecorative(
                          fontSize: CytatWidgetState.textSize,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          height: 1.3
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )

                ]
            ),

            Positioned(
              bottom: Dimen.DEF_MARG,
              right: Dimen.DEF_MARG,
              child: PatroniteSupport(),
            )

          ],
        )
    );
  }
}