import 'package:flutter/material.dart';
import 'package:harcapp_core/dimen.dart';

class GradientIcon extends StatelessWidget {

  final IconData icon;
  final Color colorStart;
  final Color colorEnd;
  final double size;

  const GradientIcon(
      this.icon,
      {required this.colorStart,
        required this.colorEnd,
        this.size = Dimen.ICON_SIZE
      });

  @override
  Widget build(BuildContext context) {

    Gradient gradient = LinearGradient(
      colors: <Color>[
        colorStart,
        colorEnd,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return ShaderMask(
      child: SizedBox(
        width: size,
        height: size,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}