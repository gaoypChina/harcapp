import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CommonIconData{
  
  static Map<String, IconData> get all{
    Map<String, IconData> all = {};

    all.addAll(books);
    all.addAll(fire);
    all.addAll(writing);
    all.addAll(home);
    all.addAll(symbols);
    all.addAll(music);
    all.addAll(plants);
    all.addAll(animals);
    all.addAll(sport);
    all.addAll(food);
    all.addAll(masks);
    all.addAll(sea);
    all.addAll(tools);
    all.addAll(cars);
    all.addAll(weather);
    all.addAll(other);

    return all;
  }

  static String get randomKey => all.keys.toList()[Random().nextInt(all.length)];

  static const Map<String, IconData> books = {
    'notebookOutline': MdiIcons.notebookOutline,
    'bookMusic': MdiIcons.bookMusic,
    'bookMusicOutline': MdiIcons.bookMusicOutline,
    'bookEdit': MdiIcons.bookEdit,
    'bookEditOutline': MdiIcons.bookEditOutline,
    'bookEducation': MdiIcons.bookEducation,
    'bookEducationOutline': MdiIcons.bookEducationOutline,
    'scriptOutline': MdiIcons.scriptOutline,
    'scriptTextOutline': MdiIcons.scriptTextOutline,
    'bookOpenVariant': MdiIcons.bookOpenVariant,
    'bookVariant': MdiIcons.bookVariant,
    'bookAccount': MdiIcons.bookAccount,
    'bookSync': MdiIcons.bookClock,
    'bookCross': MdiIcons.bookCross,
    'bookCheckOutline': MdiIcons.bookCheckOutline,
    'textBoxMultiple': MdiIcons.textBoxMultiple,
    'graveStone': MdiIcons.graveStone,
  };

  static const Map<String, IconData> fire = {
    'fireplace': MdiIcons.fireplace,
    'campfire': MdiIcons.campfire,
    'fire': MdiIcons.fire,
    'firework': MdiIcons.firework,
    'torch': MdiIcons.torch
  };

  static const Map<String, IconData> writing = {
    'fountainPenTip': MdiIcons.fountainPenTip,
    'pencilOutline': MdiIcons.pencilOutline,
    'pencilRuler': MdiIcons.pencilRuler,
    'greasePencil': MdiIcons.greasePencil,
    'draw': MdiIcons.draw,
    'leadPencil': MdiIcons.leadPencil,
    'feather': MdiIcons.feather,
  };

  static const Map<String, IconData> home = {
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

  static const Map<String, IconData> symbols = {
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

  static const Map<String, IconData> music = {
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

  static const Map<String, IconData> plants = {
    'pineTree': MdiIcons.pineTree,
    'treeOutline': MdiIcons.treeOutline,
    'flower': MdiIcons.flower,
    'flowerTulipOutline': MdiIcons.flowerTulipOutline,
    'flowerPoppy': MdiIcons.flowerPoppy,
  };

  static const Map<String, IconData> animals = {
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

  static const Map<String, IconData> sport = {
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

  static const Map<String, IconData> food = {
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

  static const Map<String, IconData> masks = {
    'dominoMask': MdiIcons.dominoMask,
    'dramaMasks': MdiIcons.dramaMasks,
  };

  static const Map<String, IconData> sea = {
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

  static const Map<String, IconData> tools = {
    'sawBlade': MdiIcons.sawBlade,
    'handSaw': MdiIcons.handSaw,
    'axe': MdiIcons.axe,
    'hammer': MdiIcons.hammer,
    'screwdriver': MdiIcons.screwdriver,
    'tools': MdiIcons.tools,
    'toolboxOutline': MdiIcons.toolboxOutline,
    'wrench': MdiIcons.wrench,
  };

  static const Map<String, IconData> cars = {
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

  static const Map<String, IconData> weather = {
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

  static const Map<String, IconData> other = {
    'fleurDeLis': MdiIcons.fleurDeLis,

    'bed': MdiIcons.bed,
    'bagPersonal': MdiIcons.bagPersonal,
    'flagTriangle': MdiIcons.flagTriangle,
    'flag': MdiIcons.flag,
    'flagCheckered': MdiIcons.flagCheckered,
    'map': MdiIcons.map,
    'binoculars': MdiIcons.binoculars,
    'compassOutline': MdiIcons.compassOutline,
    'timerSandEmpty': MdiIcons.timerSandEmpty,
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
    'trophyOutline': MdiIcons.trophyOutline,
    'shimmer': MdiIcons.shimmer,

    'paperRollOutline': MdiIcons.paperRollOutline,
    'giftOpenOutline': MdiIcons.giftOpenOutline,
    'package': MdiIcons.package,
    'packageVariant': MdiIcons.packageVariant,
    folderIconKey: MdiIcons.folder,
  };

  static const String defIconKey = 'bookVariant';
  static const String folderIconKey = 'folder';
  static const IconData folderIcon = MdiIcons.folder;

  static IconData get(String key, {String defKey = defIconKey}) =>
      all[key]??all[defKey]??all[defIconKey]!;

}