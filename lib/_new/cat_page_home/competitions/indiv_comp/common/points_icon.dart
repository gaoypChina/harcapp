import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/gradient_icon.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PointsIcon extends StatefulWidget{

  static const double defSize = 32.0;
  static const IconData icon = MdiIcons.circleMultiple;
  static const IconData insideIcon = MdiIcons.fleurDeLis;

  final double size;

  const PointsIcon({this.size = defSize, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PointsIconState();

}

class PointsIconState extends State<PointsIcon>{

  final int refreshPerSec = 60;
  final List<Color?> _colors = [
    //Colors.yellowAccent,
    Colors.yellow,
    Colors.amberAccent,
    Colors.amber,
    Colors.amber[600],
    Colors.orangeAccent,
  ];

  Color? colorStart;
  Color? colorEnd;

  Color? oldColorStart;
  Color? oldColorEnd;

  late int index;
  late double transformation;

  void run() async {
    while(true){
      Duration duration = Duration(milliseconds: 100 + Random().nextInt(200));
      transformation = 0;
      await refresh(duration);
      if(!mounted) return;
      index = (index + 1)%_colors.length;
      oldColorStart = colorStart;
      oldColorEnd = colorEnd;
      _colors.shuffle();
      colorStart = _colors.first;
      colorEnd = _colors.last;
    }
  }

  Future<void> refresh(Duration duration) async {
    int noRefreshed = duration.inMilliseconds*refreshPerSec~/1000;
    int refreshPeriod = duration.inMilliseconds ~/ noRefreshed;
    for(int i=0; i < noRefreshed; i++){
      await Future.delayed(Duration(milliseconds: refreshPeriod));
      if(!mounted) return;
      setState(() => transformation += refreshPeriod/duration.inMilliseconds);
    }
  }

  @override
  void initState() {
    index = Random().nextInt(_colors.length);
    _colors.shuffle();
    colorStart = _colors.first;
    colorEnd = _colors.last;

    oldColorStart = colorStart;
    oldColorEnd = colorEnd;

    transformation = 0;

    run();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      GradientIcon(
        PointsIcon.icon,
        colorStart: _colorTween(oldColorStart, colorStart),
        colorEnd: _colorTween(oldColorEnd, colorEnd),
        size: widget.size,
      ),

      Positioned(
        top: .22*widget.size,
        right: .10*widget.size,
        child: Icon(
          PointsIcon.insideIcon,
          color: background_(context),
          size: widget.size/1.8,
        ),
      )
    ],
  );

  Color? _colorTween(Color? begin, Color? end) {
    return ColorTween(begin: begin, end: end).transform(transformation);
  }

}
