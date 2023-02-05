import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class ConfettiLayer extends StatelessWidget{

  final ConfettiController? confettiController;
  final int? numberOfParticles;
  final BlastDirectionality? blastDirectionality;
  final Path Function(Size)? createParticlePath;
  final List<Color>? colors;
  final Color? strokeColor;
  final double? strokeWidth;
  final Size minimumSize;
  final Size maximumSize;

  const ConfettiLayer(
      this.confettiController,
      { this.numberOfParticles,
        this.blastDirectionality,
        this.createParticlePath,
        this.colors,
        this.strokeColor,
        this.strokeWidth,
        this.minimumSize = const Size(20, 10),
        this.maximumSize = const Size(30, 15),
        super.key
      });

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.topCenter,
    child: ConfettiWidget(
      key: ValueKey(Tuple7(strokeWidth, strokeColor, blastDirectionality, createParticlePath, colors, minimumSize, maximumSize)),
      confettiController: confettiController!,
      emissionFrequency: 0,
      numberOfParticles: numberOfParticles??200,
      blastDirectionality: blastDirectionality ?? BlastDirectionality.explosive,
      minBlastForce: 1,
      maxBlastForce: 25,
      blastDirection: pi,
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
    ),
  );

}
