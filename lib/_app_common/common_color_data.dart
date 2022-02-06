import 'dart:math';

import 'package:flutter/material.dart';

class CommonColorData{

  static String get DEF_COLORS_KEY => 'gold';
  static String get CONF_COLORS_KEY => 'dawn';
  static String get OMEGA_COLORS_KEY => 'omegaalbum';

  static String get randomKey => ALL_PICKABLE.keys.toList()[Random().nextInt(ALL_PICKABLE.length)];

  static Map<String, CommonColorData> get ALL{

    Map<String, CommonColorData> all = {};
    all.addAll(ALL_PICKABLE);
    all['white'] = CommonColorData(Colors.white, Colors.white, true);
    all['black'] = CommonColorData(Color.fromARGB(255, 30, 30, 30), Color.fromARGB(255, 30, 30, 30), true);

    return all;
  }

  static Map<String, CommonColorData> ALL_PICKABLE = {

    'chocolate': CommonColorData(Colors.red[600], Colors.brown, true),
    'raspberry': CommonColorData(Colors.red[800], Colors.deepPurple, true),
    'rosegold': CommonColorData(Colors.amberAccent, Colors.pinkAccent, false),
    'gold': CommonColorData(Colors.yellow, Colors.orange, false),
    'dawn': CommonColorData(Colors.yellow, Colors.lightGreenAccent, false),

    'mint': CommonColorData(Colors.lightGreenAccent, Colors.greenAccent, false),
    'green': CommonColorData(Colors.lightGreenAccent, Colors.lightBlueAccent, false),
    'turquoise': CommonColorData(Colors.greenAccent, Colors.blue, true),
    'purplepink': CommonColorData(Colors.purpleAccent, Colors.deepPurple, true),
    'deepblue': CommonColorData(Colors.blue, Colors.deepPurple, true),

    'darkorange': CommonColorData(Colors.pinkAccent, Colors.blueGrey, false),
    'darkgreen': CommonColorData(Colors.cyan, Colors.blueGrey, false),
    'darkblue': CommonColorData(Colors.blueAccent, Colors.blueGrey, true),
    'darkpurple': CommonColorData(Colors.deepPurple, Colors.blueGrey, true),
    'darkbrown': CommonColorData(Colors.brown, Colors.blueGrey, true),

    'omegaalbum': CommonColorData(Colors.greenAccent, Colors.blue, false)
  };
  
  final Color colorStart;
  final Color colorEnd;
  final bool iconWhite;
  Color get iconColor => iconWhite?Colors.white:Colors.black;

  Color get avgColor{
    return Color.fromARGB(
        255,
        (colorStart.red + colorEnd.red)~/2,
        (colorStart.green + colorEnd.green)~/2,
        (colorStart.blue + colorEnd.blue)~/2
    );
  }

  const CommonColorData(this.colorStart, this.colorEnd, this.iconWhite);
  
}