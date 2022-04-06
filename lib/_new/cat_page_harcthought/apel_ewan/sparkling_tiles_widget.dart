import 'dart:math';

import 'package:flutter/material.dart';



class SparklingTilesWidget extends StatefulWidget{

  final List<Color> colors;
  final int count;

  const SparklingTilesWidget({
    @required this.colors,
    @required this.count,
    Key key
  }): super(key: key);


  @override
  State<StatefulWidget> createState() => SparklingTilesWidgetState();
}

class SparklingTilesWidgetState extends State<SparklingTilesWidget>{

  List<Color> get colors => widget.colors;
  int get count => widget.count;

  List<Color> currentColors;

  run() async {
    while(true){
      currentColors = List.generate(count*count, (index) => colors[Random().nextInt(colors.length)]);
      await Future.delayed(const Duration(milliseconds: 1000));
      if(!mounted) return;
      setState(() {});
    }
  }

  @override
  void initState() {
    currentColors = List.generate(count*count, (index) => colors[Random().nextInt(colors.length)]);
    run();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => GridView.count(
      crossAxisCount: count,
      children: List.generate(
          count*count,
              (index) => AnimatedContainer(
            duration: Duration(milliseconds: 500 + Random().nextInt(4700)),
            curve: Curves.easeOutQuad,
            color: currentColors[index],
          )
      )
  );

}
