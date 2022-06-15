import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CommonIconData{
  
  static Map<String, IconData> get ALL{
    Map<String, IconData> all = {};

    all.addAll(BOOKS);
    all.addAll(FIRE);
    all.addAll(WRITING);
    all.addAll(HOME);
    all.addAll(SYMBOLS);
    all.addAll(MUSIC);
    all.addAll(PLANTS);
    all.addAll(ANIMALS);
    all.addAll(SPORT);
    all.addAll(FOOD);
    all.addAll(MASKS);
    all.addAll(SEA);
    all.addAll(TOOLS);
    all.addAll(CARS);
    all.addAll(WEATHER);
    all.addAll(OTHER);

    return all;
  }

  static String get randomKey => ALL.keys.toList()[Random().nextInt(ALL.length)];

  static const Map<String, IconData> BOOKS = {
    'bookMusicOutline': MdiIcons.bookMusicOutline,
    'scriptOutline': MdiIcons.scriptOutline,
    'scriptTextOutline': MdiIcons.scriptTextOutline,
    'notebookOutline': MdiIcons.notebookOutline,
    'bookOpenVariant': MdiIcons.bookOpenVariant,
    'bookVariant': MdiIcons.bookVariant,
    'bookEducation': MdiIcons.bookEducation,
    'bookAccount': MdiIcons.bookAccount,
    'bookSync': MdiIcons.bookClock,
    'bookCross': MdiIcons.bookCross,
    'bookCheckOutline': MdiIcons.bookCheckOutline,
    'textBoxMultiple': MdiIcons.textBoxMultiple,
    'graveStone': MdiIcons.graveStone,
  };

  static const Map<String, IconData> FIRE = {
    'fireplace': MdiIcons.fireplace,
    'campfire': MdiIcons.campfire,
    'fire': MdiIcons.fire,
    'firework': MdiIcons.firework,
    'torch': MdiIcons.torch
  };

  static const Map<String, IconData> WRITING = {
    'fountainPenTip': MdiIcons.fountainPenTip,
    'pencilOutline': MdiIcons.pencilOutline,
    'pencilRuler': MdiIcons.pencilRuler,
    'greasePencil': MdiIcons.greasePencil,
    'feather': MdiIcons.feather,
  };

  static const Map<String, IconData> HOME = {
    'tent': MdiIcons.tent,
    'homeVariant': MdiIcons.homeVariant,
    'home': MdiIcons.home,
    'bankOutline': MdiIcons.bankOutline,
    'homeModern': MdiIcons.homeModern,
    'castle': MdiIcons.castle,
    'lighthouse': MdiIcons.lighthouse,
    'deathStarVariant': MdiIcons.deathStarVariant,
    'summit': MdiIcons.summit,
    'homeAnalytics': MdiIcons.warehouse,
  };

  static const Map<String, IconData> SYMBOLS = {
    'christianity': MdiIcons.cross,

    'cardsHeart': MdiIcons.cardsHeart,
    'cardsClub': MdiIcons.cardsClub,
    'cardsDiamond': MdiIcons.cardsDiamond,
    'cardsSpade': MdiIcons.cardsSpade,
    'candle': MdiIcons.candle,
    'star': MdiIcons.star,

    'cardsVariant': MdiIcons.cards,

    'chessPawn': MdiIcons.chessPawn,
    'chessBishop': MdiIcons.chessBishop,
    'chessKnight': MdiIcons.chessKnight,
    'chessRook': MdiIcons.chessRook,
    'chessKing': MdiIcons.chessKing,
    'chessQueen': MdiIcons.chessQueen,
    'clover': MdiIcons.clover,
  };

  static const Map<String, IconData> MUSIC = {
    'musicClefBass': MdiIcons.musicClefBass,
    'musicClefTreble': MdiIcons.musicClefTreble,
    'musicNoteQuarter': MdiIcons.musicNoteQuarter,
    'musicNoteEighth': MdiIcons.musicNoteEighth,
    'musicNoteSixteenth': MdiIcons.musicNoteSixteenth,
    'music': MdiIcons.music,

    'guitarAcoustic': MdiIcons.guitarAcoustic,
    'guitarElectric': MdiIcons.guitarElectric,
    'guitarPickOutline': MdiIcons.guitarPickOutline,
    'trumpet': MdiIcons.trumpet,
    'bugle': MdiIcons.bugle,
    'instrumentTriangle': MdiIcons.instrumentTriangle,
    'piano': MdiIcons.piano,
    'saxophone': MdiIcons.saxophone,
  };

  static const Map<String, IconData> PLANTS = {
    'pineTree': MdiIcons.pineTree,
    'treeOutline': MdiIcons.treeOutline,
    'flower': MdiIcons.flower,
    'flowerTulipOutline': MdiIcons.flowerTulipOutline,
    'flowerPoppy': MdiIcons.flowerPoppy,
  };

  static const Map<String, IconData> ANIMALS = {
    'penguin': MdiIcons.penguin,
    'dog': MdiIcons.dog,
    'cat': MdiIcons.cat,
    'fish': MdiIcons.fish,
    'beehiveOutline': MdiIcons.beehiveOutline,
    'bee': MdiIcons.bee,
    'snail': MdiIcons.snail,
    'snake': MdiIcons.snake,
    'bacteria': MdiIcons.bacteria,
    'bird': MdiIcons.bird,
    'butterflyOutline': MdiIcons.butterflyOutline,
    'cow': MdiIcons.cow,
    'rabbit': MdiIcons.rabbit,
    'horse': MdiIcons.horse,
    'horseshoe': MdiIcons.horseshoe,
    'jellyfish': MdiIcons.jellyfish,
    'paw': MdiIcons.paw,
  };

  static const Map<String, IconData> SPORT = {
    'basketball': MdiIcons.basketball,
    'waterPolo': MdiIcons.waterPolo,
    'baseball': MdiIcons.baseball,
    'baseballBat': MdiIcons.baseballBat,
    'badminton': MdiIcons.badminton,
    'boomerang': MdiIcons.boomerang,
    'bullseyeArrow': MdiIcons.bullseyeArrow,
    'swordCross': MdiIcons.swordCross,
    'sword': MdiIcons.sword,
    'bomb': MdiIcons.bomb,
    'airballoonOutline': MdiIcons.airballoonOutline,
    'jumpRope': MdiIcons.jumpRope,
    'tennis': MdiIcons.tennis,
    'tableTennis': MdiIcons.tableTennis,
    'whistle': MdiIcons.whistle,
  };

  static const Map<String, IconData> FOOD = {
    'breadSliceOutline': MdiIcons.breadSliceOutline,
    'cake': MdiIcons.cake,
    'candycane': MdiIcons.candycane,
    'eggEaster': MdiIcons.eggEaster,
    'fruitWatermelon': MdiIcons.fruitWatermelon,
    'fruitGrapes': MdiIcons.fruitGrapes,
    'fruitPineapple': MdiIcons.fruitPineapple,
    'fruitCitrus': MdiIcons.fruitCitrus,
    'fruitCherries': MdiIcons.fruitCherries,
    'carrot': MdiIcons.carrot,
    'chiliMild': MdiIcons.chiliMild,
    'foodApple': MdiIcons.foodApple,
    'foodDrumstick': MdiIcons.foodDrumstick,
    'foodSteak': MdiIcons.foodSteak,
    'cookie': MdiIcons.cookie,
    'peanutOutline': MdiIcons.peanutOutline,
    'iceCream': MdiIcons.iceCream,
    'icePop': MdiIcons.icePop,
    'silverware': MdiIcons.silverware,
    'kettleOutline': MdiIcons.kettleOutline,
    'bowlOutline': MdiIcons.bowlMixOutline,
  };

  static const Map<String, IconData> MASKS = {
    'dominoMask': MdiIcons.dominoMask,
    'dramaMasks': MdiIcons.dramaMasks,
  };

  static const Map<String, IconData> SEA = {
    'pirate': MdiIcons.pirate,
    'sailBoat': MdiIcons.sailBoat,
    'shipWheel': MdiIcons.shipWheel,
    'ferry': MdiIcons.ferry,
    'anchor': MdiIcons.anchor,
    'androidStudio': MdiIcons.androidStudio,
    'divingFlippers': MdiIcons.divingFlippers,
    'divingHelmet': MdiIcons.divingHelmet,
    'mine': MdiIcons.mine,
    'sharkFin': MdiIcons.sharkFin
  };

  static const Map<String, IconData> TOOLS = {
    'sawBlade': MdiIcons.sawBlade,
    'handSaw': MdiIcons.handSaw,
    'axe': MdiIcons.axe,
    'hammer': MdiIcons.hammer,
    'screwdriver': MdiIcons.screwdriver,
    'tools': MdiIcons.tools,
    'toolboxOutline': MdiIcons.toolboxOutline,
    'wrench': MdiIcons.wrench,
  };

  static const Map<String, IconData> CARS = {
    'bicycle': MdiIcons.bicycle,
    'bike': MdiIcons.bike,
    'bicycleCargo': MdiIcons.bicycleCargo,
    'carHatchback': MdiIcons.carHatchback,
    'car': MdiIcons.car,
    'jeepney': MdiIcons.jeepney,
    'wheelBarrow': MdiIcons.wheelBarrow,
    'rocketOutline': MdiIcons.rocketOutline,
    'rocketLaunchOutline': MdiIcons.rocketLaunchOutline,
  };

  static const Map<String, IconData> WEATHER = {
    'snowflake': MdiIcons.snowflake,
    'brightness3': MdiIcons.brightness3,
    'weatherNight': MdiIcons.weatherNight,
    'weatherSunny': MdiIcons.weatherSunny,
    'weatherTornado': MdiIcons.weatherTornado,
    'weatherLightning': MdiIcons.weatherLightning,
    'weatherCloudy': MdiIcons.weatherCloudy,
    'weatherFog': MdiIcons.weatherFog,
    'weatherHail': MdiIcons.weatherHail,
    'weatherSnowyHeavy': MdiIcons.weatherSnowyHeavy,
  };

  static const Map<String, IconData> OTHER = {
    'fleurDeLis': MdiIcons.fleurDeLis,

    'bed': MdiIcons.bed,
    'bagPersonal': MdiIcons.bagPersonal,
    'flagTriangle': MdiIcons.flagTriangle,
    'flag': MdiIcons.flag,
    'flagCheckered': MdiIcons.flagCheckered,
    'map': MdiIcons.map,
    'binoculars': MdiIcons.binoculars,
    'compassOutline': MdiIcons.compassOutline,
    'sunglasses': MdiIcons.sunglasses,
    'balloon': MdiIcons.balloon,

    'accountTie': MdiIcons.accountTie,
    'accountCowboyHat': MdiIcons.accountCowboyHat,
    'accountMultiple': MdiIcons.accountMultiple,
    'accountMusic': MdiIcons.accountMusic,
    'humanMaleFemale': MdiIcons.humanMaleFemale,
    'shoePrint': MdiIcons.shoePrint,
    'hiking': MdiIcons.hiking,
    'dna': MdiIcons.dna,
    'stringLights': MdiIcons.stringLights,

    'abacus': MdiIcons.abacus,
    'shimmer': MdiIcons.shimmer,

    'paperRollOutline': MdiIcons.paperRollOutline,
    'package': MdiIcons.package,
    'packageVariant': MdiIcons.packageVariant,
    FOLDER_ICON_KEY: MdiIcons.folder,
  };

  static const String DEF_ICON_KEY = 'bookVariant';
  static const String FOLDER_ICON_KEY = 'folder';
  static const IconData FOLDER_ICON = MdiIcons.folder;

}