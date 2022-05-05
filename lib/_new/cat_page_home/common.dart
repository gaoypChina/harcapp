import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiLayer extends StatelessWidget{

  final ConfettiController confettiController;

  const ConfettiLayer(this.confettiController, {Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        confettiController: confettiController,
        emissionFrequency: 0,
        numberOfParticles: 200,
        blastDirectionality: BlastDirectionality.explosive,
        minBlastForce: 1,
        maxBlastForce: 25,
        blastDirection: pi,
        colors: const [
          Colors.red,
          Colors.orangeAccent,
          Colors.amberAccent,
          Colors.lightBlueAccent,
          Colors.deepPurpleAccent
        ],
      ),
    );
  }

}
