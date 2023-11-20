import 'dart:core';

import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/slowo_klucz/how_to_guide/player_widget.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/dimen.dart';

import '../common.dart';

class AnimStage{
  final Duration before;
  final void Function() function;
  final Duration after;

  const AnimStage({
    this.before = Duration.zero,
    required this.function,
    this.after = Duration.zero,
  });
}

class AnimStageManager{

  final Duration initWaitDuration;
  final List<AnimStage> stages;
  final void Function() cleanUp;
  final Duration finishedDuration;
  final Duration reverseWaitDuration;
  final bool Function() isMounted;

  const AnimStageManager({
    this.initWaitDuration = Duration.zero,
    required this.stages,
    required this.cleanUp,
    this.finishedDuration = Duration.zero,
    this.reverseWaitDuration = Duration.zero,
    required this.isMounted,
  });

  Future<bool> wait(Duration duration) async{
    await Future.delayed(duration);
    return !isMounted();
  }

  Future<bool> run() async{

    if(await wait(initWaitDuration)) return false;
    while(true){

      for(AnimStage stage in stages){
        if(await wait(stage.before)) return false;
        stage.function.call();
        if(await wait(stage.after)) return false;
      }
      if(await wait(finishedDuration)) return false;

      cleanUp.call();
      if(await wait(reverseWaitDuration)) return false;
    }
  }

  Duration allStagesDuration(){

    Duration duration = Duration.zero;

    for(AnimStage stage in stages){
      duration += stage.before;
      duration += stage.after;
    }
    return duration;
  }

}

mixin class PageTemplateInterface{

  static const _horizCnt = 4;

  double initGridSize(double width) => width/_horizCnt;
  double initPlayerOffset(double width) => (initGridSize(width) - PlayerWidget.size)/2;

  bool get mounted {
    throw UnimplementedError();
  }

  Future<bool> wait(Duration duration) async{
    await Future.delayed(duration);
    return !mounted;
  }

  Curve get curve => Curves.easeInOutQuart;

  Duration get initWaitDuration => const Duration(milliseconds: 1000);
  Duration get animDuration => const Duration(milliseconds: 1000);
  static const Duration pauseDuration = Duration(milliseconds: 5000);
  Duration convDuration = const Duration(milliseconds: 2600);
  Duration get finishDuration => const Duration(milliseconds: 5000);
  Duration get reverseWaitDuration => const Duration(milliseconds: 1500);

}

class PageTemplate extends StatelessWidget{

  final Widget Function(BuildContext, double width, double height) builder;
  final String text;
  final Color textColor;
  final Duration totalInitWaitDuration;
  final Duration totalAnimDuration;
  final Duration totalFinishedDuration;
  final Duration totalReverseWaitDuration;

  const PageTemplate({
    required this.builder,
    required this.text,
    required this.textColor,
    required this.totalInitWaitDuration,
    required this.totalAnimDuration,
    required this.totalFinishedDuration,
    required this.totalReverseWaitDuration,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              builder(context, constraints.maxWidth, constraints.maxHeight),
        )),

        _ProgressBar(totalInitWaitDuration, totalAnimDuration, totalFinishedDuration, totalReverseWaitDuration),

        Padding(
          padding: const EdgeInsets.only(
            top: Dimen.SIDE_MARG,
            left: Dimen.SIDE_MARG,
            right: Dimen.SIDE_MARG,
            bottom: Dimen.SIDE_MARG,
          ),
          child: Text(
            text,
            style: TextStyle(fontFamily: fontFamily, fontSize: 18.0, color: textColor),
            textAlign: TextAlign.center,
          ),
        )

      ],
    );
  }


}

class _ProgressBar extends StatefulWidget{

  final Duration initWaitDuration;
  final Duration animDuration;
  final Duration finishDuration;
  final Duration reverseWaitDuration;

  const _ProgressBar(this.initWaitDuration, this.animDuration, this.finishDuration, this.reverseWaitDuration);

  @override
  State<StatefulWidget> createState() => _ProgressBarState();

}

class _ProgressBarState extends State<_ProgressBar>{

  Duration get initWaitDuration => widget.initWaitDuration;
  Duration get animDuration => widget.animDuration;
  Duration get finishDuration => widget.finishDuration;
  Duration get reverseWaitDuration => widget.reverseWaitDuration;

  double? progress;

  void runProgress() async{
    await Future.delayed(initWaitDuration);
    if(!mounted) return;

    while(true){
      if(!mounted) return;
      post(() => mounted?setState(() => progress = 1):null);
      await Future.delayed(animDuration);
      await Future.delayed(finishDuration);
      if(!mounted) return;
      post(() => mounted?setState(() => progress = 0):null);
      await Future.delayed(reverseWaitDuration);

    }

  }

  @override
  void initState() {
    progress = 0;
    runProgress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {

          return Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(20)
              ),
              height: 3.0,
              width: constraints.maxWidth*progress!,
              duration: progress == 1?animDuration:const Duration(milliseconds: 300),
              curve: Curves.linear,
            ),
          );
        },
      ),
    );
  }

}