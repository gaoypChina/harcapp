import 'dart:math';

import 'package:flutter/material.dart';

import '../_new/details/app_settings.dart';

class CommonColorData{

  static const String defColorsKey = goldKey;
  static const String confColorsKey = 'dawn';
  static const String omegaColorsKey = 'omegaalbum';
  static const String spaceColorsKey = 'blueberry';

  static const String chocolateKey = 'chocolate';
  static const String raspberryKey = 'raspberry';
  static const String dawnKey = 'dawn';
  static const String rosegoldKey = 'rosegold';
  static const String goldKey = 'gold';
  static const String mintKey = 'mint';
  static const String greenKey = 'green';
  static const String turquoiseKey = 'turquoise';
  static const String blueberryKey = 'blueberry';
  static const String deepblueKey = 'deepblue';
  static const String darkorangeKey = 'darkorange';
  static const String darkgreenKey = 'darkgreen';
  static const String darkblueKey = 'darkblue';
  static const String darkpurpleKey = 'darkpurple';
  static const String darkbrownKey = 'darkbrown';
  static const String bloodKey = 'blood';
  static const String deepforestKey = 'deepforest';
  static const String navyKey = 'navy';
  static const String blackberryKey = 'blackberry';
  static const String blackwoodKey = 'blackwood';

  static String get randomKey => allPickable.keys.toList()[Random().nextInt(allPickable.length)];

  static Map<String, CommonColorData> get all{

    Map<String, CommonColorData> all = {};
    all.addAll(allPickable);
    all['white'] = const CommonColorData(Colors.white, Colors.white, true);
    all['black'] = const CommonColorData(Color.fromARGB(255, 30, 30, 30), Color.fromARGB(255, 30, 30, 30), true);

    return all;
  }

  static Map<String, CommonColorData> allPickable = {

    chocolateKey: CommonColorData(Colors.pink, Colors.brown[900]!, true),
    raspberryKey: CommonColorData(Colors.red[800]!, Colors.deepPurple, false),
    dawnKey: const CommonColorData(Colors.orange, Colors.purple, false),
    rosegoldKey: const CommonColorData(Colors.amberAccent, Colors.pinkAccent, false),
    goldKey: const CommonColorData(Colors.yellow, Colors.orange, false),

    mintKey: const CommonColorData(Colors.yellow, Colors.greenAccent, false),
    greenKey: const CommonColorData(Colors.lightGreenAccent, Colors.lightBlueAccent, false),
    turquoiseKey: const CommonColorData(Colors.greenAccent, Colors.blue, false),
    blueberryKey: CommonColorData(Colors.cyan[800]!, Colors.purple[900]!, true),
    deepblueKey: const CommonColorData(Colors.blue, Colors.deepPurple, false),

    darkorangeKey: const CommonColorData(Colors.pinkAccent, Colors.blueGrey, false),
    darkgreenKey: CommonColorData(Colors.cyan[300]!, Colors.blueGrey, false),
    darkblueKey: const CommonColorData(Colors.blueAccent, Colors.blueGrey, false),
    darkpurpleKey: const CommonColorData(Colors.deepPurple, Colors.blueGrey, true),
    darkbrownKey: const CommonColorData(Colors.brown, Colors.blueGrey, true),

    bloodKey: CommonColorData(Colors.red[900]!, Colors.black, true),
    deepforestKey: CommonColorData(Colors.green[900]!, Colors.black, true),
    navyKey: CommonColorData(Colors.blue[900]!, Colors.black, true),
    blackberryKey: CommonColorData(Colors.purple[900]!, Colors.black, true),
    blackwoodKey: CommonColorData(Colors.brown[800]!, Colors.black, true),

    omegaColorsKey: const CommonColorData(Colors.greenAccent, Colors.blue, false)
  };

  static CommonColorData get(String key, {String defKey = defColorsKey}) =>
      all[key]??all[defKey]??all[defColorsKey]!;

  final Color colorStart;
  final Color colorEnd;
  final bool iconWhite;
  Color get iconColor => iconWhite?Colors.white:Colors.black;
  Color? get moreVisible => AppSettings.isDark?colorStart:colorEnd;

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