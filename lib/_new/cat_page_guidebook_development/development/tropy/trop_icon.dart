import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop.dart';

class TropIcon extends StatelessWidget{

  static const double defSize = 72;

  final TropCategory tropCategory;
  final double size;
  final String? zuchTropName;

  const TropIcon(this.tropCategory, {this.size = defSize, this.zuchTropName, super.key});

  static String assetPath(TropCategory category, {String? zuchTropName}){
    switch(category){
      case TropCategory.harcZlotyTrop: return 'harc/zloty_trop';
      case TropCategory.harcZaradnosc: return 'harc/zaradnosc_1';
      case TropCategory.harcOjczyzna: return 'harc/ojczyzna_1';
      case TropCategory.harcOdkrywanie: return 'harc/odkrywanie_1';
      case TropCategory.harcNatura: return 'harc/natura_1';
      case TropCategory.harcInicjatywa: return 'harc/inicjatywa_1';
      case TropCategory.harcCzlowiek: return 'harc/czlowiek_1';
      case TropCategory.harcBraterstwo: return 'harc/braterstwo_1';

      case TropCategory.zuchArtystyczne: return 'zuch/artystyczne_$zuchTropName';
      case TropCategory.zuchBajkowe: return 'zuch/bajkowe_$zuchTropName';
      case TropCategory.zuchKulturoznawcze: return 'zuch/kulturoznawcze_$zuchTropName';
      case TropCategory.zuchObywatelskie: return 'zuch/obywatelskie_$zuchTropName';
      case TropCategory.zuchPrzyrodnicze: return 'zuch/przyrodnicze_$zuchTropName';
      case TropCategory.zuchSportoweITurystyczne: return 'zuch/sportowe_i_turystyczne_$zuchTropName';
      case TropCategory.zuchZawodowe: return 'zuch/zawodowe_$zuchTropName';
    }

  }

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    'assets/images/trop/${assetPath(tropCategory, zuchTropName: zuchTropName)}.svg',
    width: size,
    height: size,
  );


}