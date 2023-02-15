import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/blur.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/slowo_klucz/common/preview_cards_grid_widget.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../_main.dart';

class PhoneWidget extends StatelessWidget{

  static const double aspectRatio = 3/2;//16/9;
  static const Curve _curve = Curves.easeInOutQuart;

  final Widget Function(BuildContext, double) builder;
  final double? size;
  final Duration duration;
  final bool? bottomLineDark;

  const PhoneWidget({
    required this.builder,
    required this.size,
    required this.duration,
    this.bottomLineDark=true,
    super.key});

  @override
  Widget build(BuildContext context) {


    return AnimatedContainer(
      duration: duration,
      curve: _curve,
      height: size!*aspectRatio,
      width: size,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){

          double size = constraints.maxWidth;
          double radius = 0.14*size;

          return SizedBox(
            height: size,
            width: size/aspectRatio,
            child: Material(
              animationDuration: Duration.zero,
              borderRadius: BorderRadius.circular(radius),
              elevation: 3.0,
              color: Colors.white,
              child: Center(
                child: Stack(
                  children: [

                    SizedBox(
                      height: .93*size*aspectRatio,
                      width: .88*size,
                      child: Material(
                        animationDuration: Duration.zero,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(.75*radius),
                        clipBehavior: Clip.hardEdge,
                        child: builder(context, .88*size),
                      ),
                    ),

                    Positioned(
                      bottom: .05*size,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: .25*size,
                          height: .03*size,
                          decoration: BoxDecoration(color: bottomLineDark!?Colors.black:Colors.white, borderRadius: BorderRadius.circular(100)),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );

        },
      ),
    );

  }

}

class ScreenMainScreen extends StatelessWidget{

  static const Duration highlightDuration = Duration(milliseconds: 180);

  final double size;
  final bool highlightButtonPlayers;
  final bool highlightButtonLeader;

  const ScreenMainScreen({
    required this.size,
    this.highlightButtonPlayers=false,
    this.highlightButtonLeader=false,
    super.key});

  @override
  Widget build(BuildContext context) {

    double padding = 0.07*size;
    double radius = 0.07*size;
    double sigmaBg = 0.01*size;
    double sigma = 0.04*size;
    double iconSize = 0.5*size;

    return Stack(
      children: [

        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/games/bg_slowo_klucz.webp"), fit: BoxFit.cover
              )
          ),
        ),

        Blur(
          sigma: sigmaBg,
          child: Container(color: Colors.blue.withOpacity(.5)),
          mode: TileMode.mirror,
        ),

        Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [

              SizedBox(height: 2*padding),

              Expanded(
                child: Material(
                  animationDuration: Duration.zero,
                  borderRadius: BorderRadius.circular(radius),
                  elevation: 4,
                  clipBehavior: Clip.hardEdge,
                  color: Colors.transparent,
                  child: Stack(
                    children: [

                      AnimatedContainer(
                          duration: highlightDuration,
                          color: highlightButtonPlayers?Colors.white:Colors.transparent
                      ),

                      Blur(
                          sigma: sigma,
                          child: Opacity(
                            opacity: .7,
                            child: GradientWidget(
                              width: double.infinity,
                              height: double.infinity,
                              colorStart: SlowoKluczStartPage.playerBoardColorStart,
                              colorEnd: SlowoKluczStartPage.playerBoardColorEnd,
                              child: Icon(MdiIcons.accountMultiple, size: iconSize, color: Colors.white60),
                            ),
                          )
                      ),

                    ],
                  )
                ),
              ),

              SizedBox(height: padding),

              Expanded(
                child: Material(
                  animationDuration: Duration.zero,
                  borderRadius: BorderRadius.circular(radius),
                  elevation: 4,
                  clipBehavior: Clip.hardEdge,
                  color: Colors.transparent,
                  child: Stack(
                    children: [

                      AnimatedContainer(
                          duration: highlightDuration,
                          color: highlightButtonLeader?Colors.white:Colors.transparent
                      ),

                      Blur(
                          sigma: sigma,
                          child: Opacity(
                            opacity: .7,
                            child: GradientWidget(
                              width: double.infinity,
                              height: double.infinity,
                              colorStart: SlowoKluczStartPage.leaderBoardColorStart,
                              colorEnd: SlowoKluczStartPage.leaderBoardColorEnd,
                              child: Icon(MdiIcons.accountCowboyHat, size: iconSize, color: Colors.white60),
                            ),
                          )
                      ),
                    ],
                  )
                ),
              ),

              SizedBox(height: 2*padding),

            ],
          ),
        ),
      ],
    );

  }

}

class ScreenQRCode extends StatelessWidget {

  const ScreenQRCode({super.key});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) => Icon(MdiIcons.qrcode, size: constraints.maxWidth, color: Colors.black),
  );

}

class ScreenCamera extends StatelessWidget {

  const ScreenCamera({super.key});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) => Icon(MdiIcons.camera, size: constraints.maxWidth, color: Colors.black),
  );

}

class ScreenScanning extends StatelessWidget {

  const ScreenScanning({super.key});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) => Icon(MdiIcons.qrcodeScan, size: constraints.maxWidth, color: Colors.black),
  );

}

class ScreenCheck extends StatelessWidget {

  const ScreenCheck({super.key});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) => Icon(MdiIcons.check, size: constraints.maxWidth, color: Colors.black),
  );

}

class ScreenGamePlay extends StatelessWidget {

  final bool withColors;
  final bool withWords;
  final PreviewCardsGridController? controller;

  const ScreenGamePlay({
    this.withColors=false,
    this.withWords=false,
    this.controller,
    super.key});

  @override
  Widget build(BuildContext context) => RotatedBox(
      quarterTurns: 1,
      child: PreviewCardsGridWidget(withColors: withColors, withWords: withWords, controller: controller)
  );

}