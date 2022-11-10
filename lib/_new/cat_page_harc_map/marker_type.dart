import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum MarkerType{
  GROMADA_ZUCHOWA_ZHP,
  DRUZYNA_HARCERSKA_ZHP,
  DRUZYNA_STARSZOHARCERSKA_ZHP,
  DRUZYNA_WEDROWNICZA_ZHP,

  DUSZPASTERSTWO_AKADEMICKIE,

  SIEDZIBA_HUFCA_ZHP,
  SIEDZIBA_CHORAGWI_ZHP,
  SIEDZIBA_GLOWNEJ_KWATERY_ZHP,

}

Map<MarkerType, String> markerTypeToStr = {
  MarkerType.GROMADA_ZUCHOWA_ZHP: 'GROMADA_ZUCHOWA_ZHP',
  MarkerType.DRUZYNA_HARCERSKA_ZHP: 'DRUZYNA_HARCERSKA_ZHP',
  MarkerType.DRUZYNA_STARSZOHARCERSKA_ZHP: 'DRUZYNA_STARSZOHARCERSKA_ZHP',
  MarkerType.DRUZYNA_WEDROWNICZA_ZHP: 'DRUZYNA_WEDROWNICZA_ZHP',

  MarkerType.DUSZPASTERSTWO_AKADEMICKIE: 'DUSZPASTERSTWO_AKADEMICKIE',

  MarkerType.SIEDZIBA_HUFCA_ZHP: 'SIEDZIBA_HUFCA_ZHP',
  MarkerType.SIEDZIBA_CHORAGWI_ZHP: 'SIEDZIBA_CHORAGWI_ZHP',
  MarkerType.SIEDZIBA_GLOWNEJ_KWATERY_ZHP: 'SIEDZIBA_GLOWNEJ_KWATERY_ZHP',

};

Map<String, MarkerType> strToMarkerType = {
  'GROMADA_ZUCHOWA_ZHP': MarkerType.GROMADA_ZUCHOWA_ZHP,
  'DRUZYNA_HARCERSKA_ZHP': MarkerType.DRUZYNA_HARCERSKA_ZHP,
  'DRUZYNA_STARSZOHARCERSKA_ZHP': MarkerType.DRUZYNA_STARSZOHARCERSKA_ZHP,
  'DRUZYNA_WEDROWNICZA_ZHP': MarkerType.DRUZYNA_WEDROWNICZA_ZHP,

  'DUSZPASTERSTWO_AKADEMICKIE': MarkerType.DUSZPASTERSTWO_AKADEMICKIE,

  'SIEDZIBA_HUFCA_ZHP': MarkerType.SIEDZIBA_HUFCA_ZHP,
  'SIEDZIBA_CHORAGWI_ZHP': MarkerType.SIEDZIBA_CHORAGWI_ZHP,
  'SIEDZIBA_GLOWNEJ_KWATERY_ZHP': MarkerType.SIEDZIBA_GLOWNEJ_KWATERY_ZHP,
};

Map<MarkerType, String> markerTypeToName = {
  MarkerType.GROMADA_ZUCHOWA_ZHP: 'Gromada zuchowa ZHP',
  MarkerType.DRUZYNA_HARCERSKA_ZHP: 'Drużyna harcerska ZHP',
  MarkerType.DRUZYNA_STARSZOHARCERSKA_ZHP: 'Drużyna harcerzy starszych ZHP',
  MarkerType.DRUZYNA_WEDROWNICZA_ZHP: 'Drużyna wędrownicza ZHP',

  MarkerType.DUSZPASTERSTWO_AKADEMICKIE: 'Duszpasterstwo akademickie',

  MarkerType.SIEDZIBA_HUFCA_ZHP: 'Siedziba hufca ZHP',
  MarkerType.SIEDZIBA_CHORAGWI_ZHP: 'Siedziba chorągwi ZHP',
  MarkerType.SIEDZIBA_GLOWNEJ_KWATERY_ZHP: 'Siedziba Głównej Kwatery ZHP',
};

Color getMarkerColor(MarkerType markerType){

  switch(markerType) {
    case MarkerType.GROMADA_ZUCHOWA_ZHP:
      return const Color.fromARGB(255, 248, 196, 11);

    case MarkerType.DRUZYNA_HARCERSKA_ZHP:
      return const Color.fromARGB(255, 175, 202, 11);

    case MarkerType.DRUZYNA_STARSZOHARCERSKA_ZHP:
      return const Color.fromARGB(255, 25, 64, 147);

    case MarkerType.DRUZYNA_WEDROWNICZA_ZHP:
      return const Color.fromARGB(255, 227, 6, 19);

    case MarkerType.DUSZPASTERSTWO_AKADEMICKIE:
      return Colors.white;

    case MarkerType.SIEDZIBA_HUFCA_ZHP:
      return Colors.white;

    case MarkerType.SIEDZIBA_CHORAGWI_ZHP:
      return Colors.white;

    case MarkerType.SIEDZIBA_GLOWNEJ_KWATERY_ZHP:
      return Colors.white;
  }

}

Widget getMarkerTypeWidget({required MarkerType markerType, double size = Dimen.ICON_SIZE}){

  return Material(
    elevation: 2,
    borderRadius: BorderRadius.circular(100),
    color: getMarkerColor(markerType),
    child: Builder(
      builder: (context){

        switch(markerType) {
          case MarkerType.GROMADA_ZUCHOWA_ZHP:
            return SvgPicture.asset(
              'assets/images/meto/z.svg',
              width: size,
              height: size,
            );

          case MarkerType.DRUZYNA_HARCERSKA_ZHP:
            return SvgPicture.asset(
              'assets/images/meto/h.svg',
              width: size,
              height: size,
            );

          case MarkerType.DRUZYNA_STARSZOHARCERSKA_ZHP:
            return SvgPicture.asset(
              'assets/images/meto/hs.svg',
              width: size,
              height: size,
            );

          case MarkerType.DRUZYNA_WEDROWNICZA_ZHP:
            return SvgPicture.asset(
              'assets/images/meto/w.svg',
              width: size,
              height: size,
            );

          case MarkerType.DUSZPASTERSTWO_AKADEMICKIE:
            return Icon(MdiIcons.cross, color: Colors.black, size: size);

          case MarkerType.SIEDZIBA_HUFCA_ZHP:
            return Icon(MdiIcons.homeVariantOutline, color: Colors.black, size: size);

          case MarkerType.SIEDZIBA_CHORAGWI_ZHP:
            return Icon(MdiIcons.flag, color: Colors.black, size: size);

          case MarkerType.SIEDZIBA_GLOWNEJ_KWATERY_ZHP:
            return Icon(MdiIcons.star, color: Colors.black, size: size);
        }

      },
    )
  );

  switch(markerType) {
    case MarkerType.GROMADA_ZUCHOWA_ZHP:
      return Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromARGB(255, 248, 196, 11),
        child: SvgPicture.asset(
          'assets/images/meto/z.svg',
          width: size,
          height: size,
        ),
      );

    case MarkerType.DRUZYNA_HARCERSKA_ZHP:
      return Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromARGB(255, 175, 202, 11),
        child: SvgPicture.asset(
          'assets/images/meto/h.svg',
          width: size,
          height: size,
        ),
      );

    case MarkerType.DRUZYNA_STARSZOHARCERSKA_ZHP:
      return Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromARGB(255, 25, 64, 147),
        child: SvgPicture.asset(
          'assets/images/meto/hs.svg',
          width: size,
          height: size,
        ),
      );

    case MarkerType.DRUZYNA_WEDROWNICZA_ZHP:
      return Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromARGB(255, 227, 6, 19),
        child: SvgPicture.asset(
          'assets/images/meto/w.svg',
          width: size,
          height: size,
        ),
      );

    case MarkerType.DUSZPASTERSTWO_AKADEMICKIE:
      return Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
        child: const Icon(MdiIcons.cross),
      );

    case MarkerType.SIEDZIBA_HUFCA_ZHP:
      return Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
        child: const Icon(MdiIcons.cross),
      );

    case MarkerType.SIEDZIBA_CHORAGWI_ZHP:
      return Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
        child: const Icon(MdiIcons.cross),
      );

    case MarkerType.SIEDZIBA_GLOWNEJ_KWATERY_ZHP:
      return Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
        child: const Icon(MdiIcons.cross),
      );
  }

}
