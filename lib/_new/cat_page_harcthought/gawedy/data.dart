import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_harcthought/gawedy/wiersz.dart';
import 'package:harcapp/_new/details/part_contributors.dart';

import 'gaweda.dart';

List<Gaweda> allGawedy = [

  Gaweda(
      title: 'O idealnej polanie',
      fileName: 'gaweda_o_idealnej_polanie',
      titleColor: (context) => Colors.white,
      graphicalResource: GraphicalResource('gaweda_o_idealnej_polanie.webp', 'Freepik (wirestock)')
  ),
  Gaweda(
      title: 'O lwie i myszy',
      fileName: 'gaweda_o_lwie_i_myszy',
      titleColor: (context) => Colors.white,
      graphicalResource: GraphicalResource('gaweda_o_lwie_i_myszy.webp', 'Freepik (wirestock)')
  ),
  Gaweda(
      title: 'O małym smoku',
      fileName: 'gaweda_o_malym_smoku',
      titleColor: (context) => Colors.black,
      graphicalResource: GraphicalResource('gaweda_o_malym_smoku.webp', 'Freepik (snowing)')
  ),
  Gaweda(
      title: 'O worku jabłek i mężu',
      fileName: 'gaweda_o_worku_jablek_i_mezu',
      titleColor: (context) => Colors.black,
      graphicalResource: GraphicalResource('gaweda_o_worku_jablek_i_mezu.webp', 'Freepik (upklyak)')
  ),
  Gaweda(
      title: 'O rozgwiazdach',
      fileName: 'gaweda_o_rozgwiazdach',
      titleColor: (context) => Colors.black,
      graphicalResource: GraphicalResource('gaweda_o_rozgwiazdach.webp', '')
  ),
  Gaweda(
      title: 'O niebieskiej trawie',
      fileName: 'gaweda_o_niebieskiej_trawie',
      titleColor: (context) => Colors.black,
      graphicalResource: GraphicalResource('gaweda_o_niebieskiej_trawie.webp', 'Freepik (upklyak)')
  ),
  Gaweda(
      title: 'O przyjaźni',
      fileName: 'gaweda_o_przyjazni',
      titleColor: (context) => Colors.black,
      graphicalResource: GraphicalResource('gaweda_o_przyjazni.webp', 'Freepik (freepik)')
  ),
  Gaweda(
      title: 'O pastuszku i wilku',
      fileName: 'gaweda_o_pastuszku_i_wilku',
      titleColor: (context) => Colors.black,
      graphicalResource: GraphicalResource('gaweda_o_pastuszku_i_wilku.webp', 'Freepik (freepik)')
  ),
];

List<Wiersz> allWiersze = [

  Wiersz(
    title: 'Paweł i Gaweł',
    author: 'Aleksander Fredro',
    fileName: 'wiersz_pawel_i_gawel',
    titleColor: (context) => Colors.black,
    graphicalResource: GraphicalResource('wiersz_pawel_i_gawel.webp', 'Freepik (freepik)')
  ),

  Wiersz(
      title: 'Chciwość osła',
      author: 'Aleksander Fredro',
      fileName: 'wiersz_chciwosc_osla',
      titleColor: (context) => Colors.black,
      graphicalResource: GraphicalResource('wiersz_chciwosc_osla.webp', 'Freepik (brgfx)')
  )

];