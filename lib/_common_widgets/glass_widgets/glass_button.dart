import 'package:flutter/material.dart';

import './glass_container.dart';

class GlassButton extends StatelessWidget {
  const GlassButton({
    this.radius = 16,
    this.child,
    @required this.onPressed,
    this.onLongPressed,
  });

  final double radius;
  final Widget child;
  final void Function() onPressed;
  final void Function() onLongPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      onPressed: onPressed,
      onLongPress: onLongPressed,
      child: GlassContainer(
        radius: radius,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: child,
        ),
      ),
    );
  }
}