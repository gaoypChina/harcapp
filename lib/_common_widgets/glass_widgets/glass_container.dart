import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  GlassContainer({
    this.width,
    this.height,
    this.radius = 16,
    BorderRadius borderRadius,
    this.blur = 20,
    this.child,
  }) {
    this.borderRadius = borderRadius ?? BorderRadius.circular(radius);
  }

  final double width;
  final double height;
  final double radius;
  BorderRadius borderRadius;
  final double blur;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 24,
            spreadRadius: 16,
            color: Colors.black.withOpacity(0.2),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          // 背景をぼかす
          filter: ImageFilter.blur(
            sigmaX: blur,
            sigmaY: blur,
          ),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              border: Border.all(
                width: 1.5,
                color: Colors.white.withOpacity(0.2),
              ),
              borderRadius: borderRadius,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}