import 'dart:math';

import 'package:flutter/material.dart';

import '../_new/details/app_settings.dart';

class CommonColorData{

  static String get DEF_COLORS_KEY => 'gold';
  static String get CONF_COLORS_KEY => 'dawn';
  static String get OMEGA_COLORS_KEY => 'omegaalbum';

  static String get randomKey => ALL_PICKABLE.keys.toList()[Random().nextInt(ALL_PICKABLE.length)];

  static Map<String, CommonColorData> get ALL{

    Map<String, CommonColorData> all = {};
    all.addAll(ALL_PICKABLE);
    all['white'] = const CommonColorData(Colors.white, Colors.white, true);
    all['black'] = const CommonColorData(Color.fromARGB(255, 30, 30, 30), Color.fromARGB(255, 30, 30, 30), true);

    return all;
  }

  static Map<String, CommonColorData> ALL_PICKABLE = {

    'chocolate': CommonColorData(Colors.pink, Colors.brown[900], false),
    'raspberry': CommonColorData(Colors.red[800], Colors.deepPurple, false),
    'dawn': const CommonColorData(Colors.orange, Colors.purple, false),
    'rosegold': const CommonColorData(Colors.amberAccent, Colors.pinkAccent, false),
    'gold': const CommonColorData(Colors.yellow, Colors.orange, false),

    'mint': const CommonColorData(Colors.yellow, Colors.greenAccent, false),
    'green': const CommonColorData(Colors.lightGreenAccent, Colors.lightBlueAccent, false),
    'turquoise': const CommonColorData(Colors.greenAccent, Colors.blue, false),
    'blueberry': CommonColorData(Colors.cyan[800], Colors.purple[900], true),
    'deepblue': const CommonColorData(Colors.blue, Colors.deepPurple, false),

    'darkorange': const CommonColorData(Colors.pinkAccent, Colors.blueGrey, false),
    'darkgreen': CommonColorData(Colors.cyan[300], Colors.blueGrey, false),
    'darkblue': const CommonColorData(Colors.blueAccent, Colors.blueGrey, false),
    'darkpurple': const CommonColorData(Colors.deepPurple, Colors.blueGrey, true),
    'darkbrown': const CommonColorData(Colors.brown, Colors.blueGrey, true),

    'blood': CommonColorData(Colors.red[900], Colors.black, true),
    'deepforest': CommonColorData(Colors.green[900], Colors.black, true),
    'navy': CommonColorData(Colors.blue[900], Colors.black, true),
    'blackberry': CommonColorData(Colors.purple[900], Colors.black, true),
    'blackwood': CommonColorData(Colors.brown[800], Colors.black, true),

    'omegaalbum': const CommonColorData(Colors.greenAccent, Colors.blue, false)
  };
  
  final Color? colorStart;
  final Color? colorEnd;
  final bool iconWhite;
  Color get iconColor => iconWhite?Colors.white:Colors.black;
  Color? get moreVisible => AppSettings.isDark?colorStart:colorEnd;

  Color get avgColor{
    return Color.fromARGB(
        255,
        (colorStart!.red + colorEnd!.red)~/2,
        (colorStart!.green + colorEnd!.green)~/2,
        (colorStart!.blue + colorEnd!.blue)~/2
    );
  }

  const CommonColorData(this.colorStart, this.colorEnd, this.iconWhite);
  
}