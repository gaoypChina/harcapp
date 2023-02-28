import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/spraw_icon.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop.dart';

class TropIcon extends StatelessWidget{

  static const double defSize = 72;
  static const double tileSize = SprawIcon.sizeBig;

  final TropCategory tropCategory;
  final double size;
  final String? zuchTropName;
  final int count;

  const TropIcon(this.tropCategory, {this.size = defSize, this.zuchTropName, this.count = 1, super.key});

  static String assetPath(TropCategory category, {String? zuchTropName, int count = 1}){
    count = max(min(count, 5), 1);
    switch(category){
      case TropCategory.harcZlotyTrop: return 'harc/zloty_trop';
      case TropCategory.harcZaradnosc: return 'harc/zaradnosc_$count';
      case TropCategory.harcOjczyzna: return 'harc/ojczyzna_$count';
      case TropCategory.harcOdkrywanie: return 'harc/odkrywanie_$count';
      case TropCategory.harcNatura: return 'harc/natura_$count';
      case TropCategory.harcInicjatywa: return 'harc/inicjatywa_$count';
      case TropCategory.harcCzlowiek: return 'harc/czlowiek_$count';
      case TropCategory.harcBraterstwo: return 'harc/braterstwo_$count';

      case TropCategory.zuchArtystyczne: return 'zuch/artystyczne_$zuchTropName';
      case TropCategory.zuchBajkowe: return 'zuch/bajkowe_$zuchTropName';
      case TropCategory.zuchKulturoznawcze: return 'zuch/kulturoznawcze_$zuchTropName';
      case TropCategory.zuchObywatelskie: return 'zuch/obywatelskie_$zuchTropName';
      case TropCategory.zuchPrzyrodnicze: return 'zuch/przyrodnicze_$zuchTropName';
      case TropCategory.zuchSportoweITurystyczne: return 'zuch/sportowe_i_turystyczne_$zuchTropName';
      case TropCategory.zuchZawodowe: return 'zuch/zawodowe_$zuchTropName';
    }

  }

  bool get isHarc => allHarcTropCategories.contains(tropCategory);

  @override
  Widget build(BuildContext context) => SizedBox(
    width: size,
    height: size,
    child: Center(
      child: SvgPicture.asset(
          'assets/images/trop/${assetPath(tropCategory, zuchTropName: zuchTropName, count: count)}.svg',
          width: size*(isHarc?1.0:(1.71/2)),
          height: size*(isHarc?1.0:(1.71/2)),
          placeholderBuilder: (context) =>
          allHarcTropCategories.contains(tropCategory)?
          SvgPicture.asset(
              'assets/images/trop/harc/_empty.svg',
              width: size,
              height: size
          ):
          SvgPicture.asset(
            'assets/images/trop/zuch/_empty.svg',
            width: size*(1.71/2),
            height: size*(1.71/2),
          ),
      ),
    ),
  );


}