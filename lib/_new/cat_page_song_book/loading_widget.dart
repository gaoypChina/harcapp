import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SlidingMusicIcon extends StatefulWidget{

  const SlidingMusicIcon({super.key});

  @override
  State<StatefulWidget> createState() => SlidingMusicIconState();

}

class SlidingMusicIconState extends State<SlidingMusicIcon>{

  static List<IconData> icons = [
    MdiIcons.musicClefBass,
    MdiIcons.musicClefTreble,

    MdiIcons.musicAccidentalNatural,
    MdiIcons.musicAccidentalFlat,
    MdiIcons.musicAccidentalDoubleFlat,
    MdiIcons.musicAccidentalSharp,
    //MdiIcons.musicAccidentalDoubleSharp,

    MdiIcons.musicRestWhole,
    MdiIcons.musicRestHalf,
    MdiIcons.musicRestQuarter,
    MdiIcons.musicRestEighth,
    MdiIcons.musicRestSixteenth,

    MdiIcons.musicNoteWhole,
    MdiIcons.musicNoteWholeDotted,
    MdiIcons.musicNote,
    MdiIcons.musicNotePlus,
    MdiIcons.musicNoteHalf,
    MdiIcons.musicNoteHalfDotted,
    MdiIcons.music,
    MdiIcons.musicNoteEighth,
    MdiIcons.musicNoteEighthDotted,
    MdiIcons.musicNoteSixteenth,
    MdiIcons.musicNoteSixteenthDotted,

    MdiIcons.piano,
    MdiIcons.instrumentTriangle,
    //MdiIcons.guitarElectric,
    MdiIcons.guitarPickOutline,

    MdiIcons.campfire,

    MdiIcons.microphone,
    MdiIcons.microphoneVariant,
    MdiIcons.headphones,
    MdiIcons.candle,

    MdiIcons.play,
    MdiIcons.playCircleOutline,
    MdiIcons.pause,
    MdiIcons.pauseCircleOutline
  ];

  late int _millis;
  IconData? icon;
  bool? visible;

  void run(bool? visibleFirst) async {

    if(mounted) setState((){
      if(!visibleFirst!) icon = icons[Random().nextInt(icons.length)];
      visible = !visibleFirst;
    });
    await Future.delayed(Duration(milliseconds:_millis));

    if(mounted) setState((){
      if(visibleFirst!) icon = icons[Random().nextInt(icons.length)];
      visible = visibleFirst;
    });
    await Future.delayed(Duration(milliseconds: _millis));

    if(mounted) run(visibleFirst);
  }

  @override
  void initState() {
    _millis = 200 + Random().nextInt(600);
    icon = icons[Random().nextInt(icons.length)];
    visible = Random().nextBool();
    run(visible);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: visible!?1:0,
        duration: Duration(milliseconds: _millis),
        child: Icon(icon, color: hintEnab_(context), size: 28.0,),
    );
  }

}

class LoadingWidget extends StatelessWidget{

  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {

    double textSize = (MediaQuery.of(context).size.width - 4*Dimen.ICON_FOOTPRINT)/6;

    return Stack(
      children: [

        Positioned.fill(
          child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              reverse: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: Dimen.ICON_FOOTPRINT,
                  childAspectRatio: 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemBuilder: (context, index) => const SlidingMusicIcon()
          ),
        ),

        Positioned.fill(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(2*Dimen.ICON_FOOTPRINT),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ogarnianie',
                      style: AppTextStyle(
                          fontSize: textSize,
                          fontWeight: weight.bold,
                          color: iconEnab_(context),
                          shadow: true,
                          height: 1.2
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      'śpiewnika',
                      style: AppTextStyle(
                          fontSize: textSize,
                          fontWeight: weight.bold,
                          color: iconEnab_(context),
                          shadow: true,
                          height: 1.2
                      ),
                      maxLines: 1,
                    ),

                    const SizedBox(height: 60),

                    SpinKitChasingDots(color: iconEnab_(context), size: textSize)
                  ],
                ),
              ),
            )
        )

      ],
    );

  }
}