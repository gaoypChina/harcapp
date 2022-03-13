import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_harcthought/wiersze/wiersz.dart';
import 'package:harcapp/_new/details/part_contributors.dart';

List<Wiersz> allWiersze = [

  Wiersz(
    title: 'Paweł i Gaweł',
    author: 'Aleksander Fredro',
    fileName: 'wiersz_pawel_i_gawel',
    titleColor: (context) => Colors.black,
    graphicalResource: const GraphicalResource('wiersz_pawel_i_gawel.webp', 'Freepik (freepik)')
  ),

  Wiersz(
      title: 'Chciwość osła',
      author: 'Aleksander Fredro',
      fileName: 'wiersz_chciwosc_osla',
      titleColor: (context) => Colors.black,
      graphicalResource: const GraphicalResource('wiersz_chciwosc_osla.webp', 'Freepik (brgfx)')
  )

];