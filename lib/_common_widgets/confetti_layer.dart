import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import 'custom_confetti/confetti.dart';

class ConfettiLayer extends StatelessWidget{

  final ConfettiController? confettiController;
  final int? numberOfParticles;
  final BlastDirectionality? blastDirectionality;
  final Path Function(Size)? createParticlePath;
  final List<Color>? colors;
  final Color? strokeColor;
  final double? strokeWidth;
  final double minBlastForce;
  final double maxBlastForce;
  final double particleDrag;
  final double blastDirection;
  final Alignment alignment;
  final Size minimumSize;
  final Size maximumSize;
  final bool disableFullRotation;

  const ConfettiLayer(
      this.confettiController,
      { this.numberOfParticles,
        this.blastDirectionality,
        this.createParticlePath,
        this.colors,
        this.strokeColor,
        this.strokeWidth,
        this.minBlastForce = 1,
        this.maxBlastForce = 25,
        this.particleDrag = 0.05,
        this.blastDirection = pi,
        this.alignment = Alignment.topCenter,
        this.minimumSize = const Size(20, 10),
        this.maximumSize = const Size(30, 15),
        this.disableFullRotation = false,
        super.key
      });

  @override
  Widget build(BuildContext context) => Align(
    alignment: alignment,
    child: CustomConfettiWidget(
      key: ValueKey(Tuple7(strokeWidth, strokeColor, blastDirectionality, createParticlePath, colors, minimumSize, maximumSize)),
      confettiController: confettiController!,
      emissionFrequency: 0,
      numberOfParticles: numberOfParticles??200,
      blastDirectionality: blastDirectionality ?? BlastDirectionality.explosive,
      minBlastForce: minBlastForce,
      maxBlastForce: maxBlastForce,
      particleDrag: particleDrag,
      blastDirection: blastDirection,
      strokeWidth: strokeWidth ?? 0,
      strokeColor: strokeColor ?? Colors.black,
      colors: colors ?? const [
        Colors.red,
        Colors.orangeAccent,
        Colors.amberAccent,
        Colors.lightBlueAccent,
        Colors.deepPurpleAccent
      ],
      createParticlePath: createParticlePath,
      minimumSize: minimumSize,
      maximumSize: maximumSize,
      disableFullRotation: disableFullRotation,
    ),
  );

}
