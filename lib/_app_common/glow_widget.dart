import 'dart:math';

import 'package:flutter/material.dart';

class GlowWidget extends StatefulWidget{

  static const double defSize = 36.0;

  final double size;
  final IconData? icon;
  const GlowWidget({this.size = defSize, this.icon, super.key});

  @override
  State<StatefulWidget> createState() => _GlowWidgetState();

}

class _GlowWidgetState extends State<GlowWidget>{

  double get size => widget.size;
  IconData? get icon => widget.icon;

  static const glowDuration1 = Duration(seconds: 1);
  static const glowDuration2 = Duration(milliseconds: 1800);
  static const glowDuration3 = Duration(milliseconds: 450);

  bool? glow1;
  bool? glow2;
  bool? glow3;

  void run1() async {

    await Future.delayed(Duration(milliseconds: 100 + Random().nextInt(2000)));

    while(true){
      if(!mounted) return;
      setState(() => glow1 = true);
      await Future.delayed(glowDuration1);
      if(!mounted) return;
      setState(() => glow1 = false);
      await Future.delayed(glowDuration1);
    }

  }

  void run2() async {

    await Future.delayed(Duration(milliseconds: 100 + Random().nextInt(2000)));

    while(true){
      if(!mounted) return;
      setState(() => glow2 = true);
      await Future.delayed(glowDuration2);
      if(!mounted) return;
      setState(() => glow2 = false);
      await Future.delayed(glowDuration2);
    }

  }

  void run3() async {

    await Future.delayed(Duration(milliseconds: 100 + Random().nextInt(2000)));

    while(true){
      if(!mounted) return;
      setState(() => glow3 = true);
      await Future.delayed(glowDuration3);
      if(!mounted) return;
      setState(() => glow3 = false);
      await Future.delayed(glowDuration3);
    }

  }

  @override
  void initState() {
    glow1 = false;
    glow2 = false;
    glow3 = false;
    run1();
    run2();
    run3();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        if(icon == null) _Circle(size, Colors.amber, Colors.red, glow1, glowDuration1)
        else _Icon(size, icon, Colors.amber, glow1, glowDuration1),

        if(icon == null) _Circle(size, Colors.deepOrange, Colors.red, glow2, glowDuration2)
        else _Icon(size, icon, Colors.red, glow2, glowDuration2),

        if(icon == null) _Circle(size, Colors.deepOrange, Colors.yellow, glow3, glowDuration3)
        else _Icon(size, icon, Colors.deepOrange, glow3, glowDuration3),

      ],
    );
  }

}

class _Circle extends StatelessWidget{

  final double size;
  final Color colorStart;
  final Color colorEnd;
  final bool? glow;
  final Duration glowDuration;
  final bool reverseGradient;

  const _Circle(this.size, this.colorStart, this.colorEnd, this.glow, this.glowDuration, {this.reverseGradient = false});

  @override
  Widget build(BuildContext context) => AnimatedContainer(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size),
        gradient: LinearGradient(
          begin: reverseGradient?Alignment.topLeft:Alignment.topRight,
          end: reverseGradient?Alignment.bottomRight:Alignment.bottomLeft,
          colors: [
            colorStart.withOpacity(glow!?0.12:0.01),
            colorEnd.withOpacity(!glow!?0.12:0.01),
          ],
        )
    ),
    duration: glowDuration,
    width: size,
    height: size,
  );



}

class _Icon extends StatelessWidget{

  final double size;
  final IconData? icon;
  final Color color;
  final bool? glow;
  final Duration glowDuration;

  const _Icon(this.size, this.icon, this.color, this.glow, this.glowDuration);

  @override
  Widget build(BuildContext context) => AnimatedOpacity(
    duration: glowDuration,
    opacity: glow!?0.12:0.01,
    child: Icon(icon, color: color, size: size),
  );

}