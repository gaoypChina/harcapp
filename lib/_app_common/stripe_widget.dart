import 'package:flutter/material.dart';

class StripeWidget extends StatelessWidget{

  final Color colorStart;
  final Color colorEnd;
  final int stripes;
  final BorderRadius? borderRadius;
  final Widget? child;

  const StripeWidget({
    this.colorStart = Colors.red,
    this.colorEnd = Colors.yellow,
    this.stripes = 22,
    this.borderRadius,
    this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    List<double> stops = [];
    List<Color> colors = [];

    stops.add(0);
    for(int i=1; i<stripes; i += 1){
      stops.add(i/stripes);
      stops.add(i/stripes);
    }
    stops.add(1);

    for(int i=0; i<stripes; i++){
      Color color = i%2==0?colorStart:colorEnd;
      colors.add(color);
      colors.add(color);
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: stops,
          colors: colors,
          tileMode: TileMode.repeated,
        ),
      ),
      child: child,
    );

  }

}