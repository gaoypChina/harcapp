import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_icon.dart';

class SprawIconRotating extends StatefulWidget{

  final double? size;
  final Spraw? Function(Spraw?) onNewUIDRequested;
  final void Function(Spraw?)? onTap;

  const SprawIconRotating({required this.onNewUIDRequested, this.size, this.onTap});

  @override
  State<StatefulWidget> createState() => SprawIconRotatingState();
}

class SprawIconRotatingState extends State<SprawIconRotating>{

  static const int rotateDuration = 500;

  double? get size => widget.size;
  Spraw? Function(Spraw?) get onNewUIDRequested => widget.onNewUIDRequested;
  void Function(Spraw?)? get onTap => widget.onTap;

  GlobalKey<FlipCardState>? stateKey;

  Spraw? sprawFront;
  Spraw? sprawBack;

  @override
  void initState() {
    sprawFront = onNewUIDRequested(sprawFront);
    stateKey = GlobalKey<FlipCardState>();
    keepRotating();
    super.initState();
  }

  void keepRotating() async{

    int initTime = 1000 + Random().nextInt(16000);
    await Future.delayed(Duration(milliseconds: initTime));

    while(true) {
      if(!mounted)
        return;

      setState(() => sprawBack = onNewUIDRequested(sprawFront));
      stateKey!.currentState!.toggleCard();
      await Future.delayed(Duration(milliseconds: 8000 + Random().nextInt(12000)));

      if(!mounted)
        return;

      setState(() => sprawFront = onNewUIDRequested(sprawBack));
      stateKey!.currentState!.toggleCard();
      await Future.delayed(Duration(milliseconds: 8000 + Random().nextInt(12000)));
    }
  }

  @override
  Widget build(BuildContext context) {

    return FlipCard(
        key: stateKey,
        speed: rotateDuration,

        front:
        sprawFront == null?
        Container(height: 30, width: 30, color: Colors.red):
        Opacity(
          opacity: sprawFront!.inProgress?0.35:1.0,
          child: SprawIcon(
            sprawFront,
            size: size,
            onTap: () => onTap?.call(sprawFront),
          ),
        ),

        back:
        sprawBack==null?
        Container(height: 30, width: 30, color: Colors.blue):
        Opacity(
          opacity: sprawBack!.inProgress?0.35:1.0,
          child: SprawIcon(
            sprawBack,
            size: size,
            onTap: () => onTap?.call(sprawBack),
          ),
        ),
        flipOnTouch: false,
    );

  }

}