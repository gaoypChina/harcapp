import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop.dart';

class TropIcon extends StatelessWidget{

  static const double defSize = 72;

  final TropCategory tropCategory;
  final double size;

  const TropIcon(this.tropCategory, {this.size = defSize, super.key});

  static String assetPath(TropCategory category){
    switch(category){
      case TropCategory.harcZlotyTrop: return 'zloty_trop';
      case TropCategory.harcZaradnosc: return 'zaradnosc_1';
      case TropCategory.harcOjczyzna: return 'ojczyzna_1';
      case TropCategory.harcOdkrywanie: return 'odkrywanie_1';
      case TropCategory.harcNatura: return 'natura_1';
      case TropCategory.harcInicjatywa: return 'inicjatywa_1';
      case TropCategory.harcBraterstwo: return 'braterstwo_1';
    }

  }

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    'assets/images/trop/harc/${assetPath(tropCategory)}.svg',
    width: size,
    height: size,
  );


}