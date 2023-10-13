import 'package:flutter/widgets.dart';

import 'package:harcapp_core/comm_classes/color_pack.dart';

import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/slowo_klucz/_main.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/slowo_klucz/how_to_guide/_how_to_guide.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/pytaki/_main.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/pytaki/how_to.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/slowo_klucz/how_to.dart';

class GameData{

  final ColorPack colorPack;
  final String name;
  final String description;
  final String coverImg;
  final Alignment bgAlignment;
  final Widget Function(BuildContext context) builder;
  final Widget Function(BuildContext context) builderHowToDescription;
  final Widget Function(BuildContext context)? builderHowToGuide;

  final int minPlayerCount;
  final int maxPlayerCount;

  const GameData({
    required this.colorPack,
    required this.name,
    required this.description,
    required this.coverImg,
    this.bgAlignment = Alignment.topCenter,
    required this.builder,
    this.builderHowToGuide,
    required this.builderHowToDescription,
    required this.minPlayerCount,
    required this.maxPlayerCount,
  });

}

GameData gameDataPytajki = GameData(
  colorPack: ColorPackGamePytaki(),
  builder: (context) => const GamePytakiPage(),
  builderHowToDescription: (context) => const HowToPytajki(),
  coverImg: 'bg_pytajki',
  name: 'Pytajki',
  description: 'Zobacz jak dobrze znasz członków swojej rodziny!',
  minPlayerCount: 2,
  maxPlayerCount: 12,
);

GameData gameDataSlowoKlucz = GameData(
  colorPack: ColorPackGamePytaki(),
  builder: (context) => const SlowoKluczStartPage(),
  builderHowToDescription: (context) => const HowToSlowoKlucz(),
  builderHowToGuide: (context) => const SlowoKluczHowToGuide(),
  coverImg: 'bg_slowo_klucz',
  name: 'Słowo klucz',
  description: 'Jak trafnie potrafisz połączyć zupełnie różne słowa?',
  minPlayerCount: 6,
  maxPlayerCount: -1,
  bgAlignment: Alignment.center,
);

List<GameData> gameList = [
  gameDataPytajki,
  gameDataSlowoKlucz,
];