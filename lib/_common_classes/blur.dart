import 'dart:ui';

import 'package:flutter/material.dart';

class Blur extends StatelessWidget{

  final Widget child;
  final double sigma;
  final TileMode mode;
  const Blur({this.child, this.sigma=8.0, this.mode = TileMode.repeated});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma, tileMode: TileMode.repeated),
          child: child??Container(color: Colors.transparent)
      )
    );
  }

}