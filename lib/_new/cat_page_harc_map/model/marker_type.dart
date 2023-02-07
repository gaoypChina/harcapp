import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/category_thumbnail_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum MarkerType{
  error,

  harcowka,
  miejsceOgniskowe,
  miejsceBiwakowe,
  miejsceObozowe,
  szkola,
  kosciol,
  salaParafialna,
  remiza,

  duszpasterstwoAkademickie,

  schronTurystyczny,

  siedzibaHufcaZhp,
  siedzibaChoragwiZhp,
  siedzibaGlownejKwateryZhp,

  wiata,

  inne,

}

List<MarkerType> get allUsableMarkerType{
  List<MarkerType> all = List.of(MarkerType.values);
  all.remove(MarkerType.error);
  return all;
}

String markerTypeToStr(MarkerType type){

  switch(type){
    case MarkerType.harcowka: return 'HARCOWKA';
    case MarkerType.miejsceOgniskowe: return 'MIEJSCE_OGNISKOWE';
    case MarkerType.miejsceBiwakowe: return 'MIEJSCE_BIWAKOWE';
    case MarkerType.miejsceObozowe: return 'MIEJSCE_OBOZOWE';
    case MarkerType.szkola: return 'SZKOLA';
    case MarkerType.kosciol: return 'KOSCIOL';
    case MarkerType.salaParafialna: return 'SALA_PARAFIALNA';
    case MarkerType.remiza: return 'REMIZA';

    case MarkerType.duszpasterstwoAkademickie: return 'DUSZPASTERSTWO_AKADEMICKIE';

    case MarkerType.schronTurystyczny: return 'SCHRON_TURYSTYCZNY';

    case MarkerType.siedzibaHufcaZhp: return 'SIEDZIBA_HUFCA_ZHP';
    case MarkerType.siedzibaChoragwiZhp: return 'SIEDZIBA_CHORAGWI_ZHP';
    case MarkerType.siedzibaGlownejKwateryZhp: return 'SIEDZIBA_GLOWNEJ_KWATERY_ZHP';

    case MarkerType.wiata: return 'WIATA';

    case MarkerType.inne: return 'INNE';
    case MarkerType.error: return 'ERROR';
  }

}

Map<String, MarkerType> strToMarkerType = {
  'HARCOWKA': MarkerType.harcowka,
  'MIEJSCE_OGNISKOWE': MarkerType.miejsceOgniskowe,
  'MIEJSCE_BIWAKOWE': MarkerType.miejsceBiwakowe,
  'MIEJSCE_OBOZOWE': MarkerType.miejsceObozowe,
  'SZKOLA': MarkerType.szkola,
  'KOSCIOL': MarkerType.kosciol,
  'SALA_PARAFIALNA': MarkerType.salaParafialna,
  'REMIZA': MarkerType.remiza,

  'DUSZPASTERSTWO_AKADEMICKIE': MarkerType.duszpasterstwoAkademickie,

  'SCHRON_TURYSTYCZNY': MarkerType.schronTurystyczny,

  'SIEDZIBA_HUFCA_ZHP': MarkerType.siedzibaHufcaZhp,
  'SIEDZIBA_CHORAGWI_ZHP': MarkerType.siedzibaChoragwiZhp,
  'SIEDZIBA_GLOWNEJ_KWATERY_ZHP': MarkerType.siedzibaGlownejKwateryZhp,

  'WIATA': MarkerType.wiata,

  'INNE': MarkerType.inne,
};

String markerTypeToName(MarkerType markerType){

  switch(markerType) {
    case MarkerType.error:
      return 'Błąd';

    case MarkerType.harcowka:
      return 'Harcówka';
    case MarkerType.miejsceOgniskowe:
      return 'Miejsce Ogniskowe';
    case MarkerType.miejsceBiwakowe:
      return 'Miejsce biwakowe';
    case MarkerType.miejsceObozowe:
      return 'Miejsce obozowe';
    case MarkerType.szkola:
      return 'Szkoła';
    case MarkerType.kosciol:
      return 'Kościół';
    case MarkerType.salaParafialna:
      return 'Sala parafialna';
    case MarkerType.remiza:
      return 'Remiza';

    case MarkerType.duszpasterstwoAkademickie:
      return 'Duszpasterstwo akademickie';

    case MarkerType.schronTurystyczny:
      return 'Schron turystyczny';

    case MarkerType.siedzibaHufcaZhp:
      return 'Siedziba hufca ZHP';
    case MarkerType.siedzibaChoragwiZhp:
      return 'Siedziba chorągwi ZHP';
    case MarkerType.siedzibaGlownejKwateryZhp:
      return 'Siedziba Głównej Kwatery ZHP';

    case MarkerType.wiata:
      return 'Wiata';

    case MarkerType.inne:
      return 'Inne';
  }

}

Color getMarkerTypeColor(MarkerType markerType){

  switch(markerType) {
    case MarkerType.error: return Colors.transparent;

    case MarkerType.harcowka: return Colors.brown[200]!;
    case MarkerType.miejsceOgniskowe: return Colors.amber[200]!;
    case MarkerType.miejsceBiwakowe: return Colors.white;
    case MarkerType.miejsceObozowe: return Colors.white;
    case MarkerType.szkola: return Colors.white;
    case MarkerType.kosciol: return Colors.white;
    case MarkerType.salaParafialna: return Colors.white;
    case MarkerType.remiza: return Colors.white;

    case MarkerType.duszpasterstwoAkademickie: return Colors.white;

    case MarkerType.schronTurystyczny: return Colors.green[200]!;

    case MarkerType.siedzibaHufcaZhp: return Colors.white;
    case MarkerType.siedzibaChoragwiZhp: return Colors.white;
    case MarkerType.siedzibaGlownejKwateryZhp: return Colors.white;

    case MarkerType.wiata: return Colors.white;

    case MarkerType.inne: return Colors.white;
  }

}

Color getMarkerTypeIconColor(MarkerType markerType){

  switch(markerType) {
    case MarkerType.error: return Colors.black;

    case MarkerType.harcowka: return Colors.brown[900]!;
    case MarkerType.miejsceOgniskowe: return Colors.amber[900]!;
    case MarkerType.miejsceBiwakowe: return Colors.black;
    case MarkerType.miejsceObozowe: return Colors.black;
    case MarkerType.szkola: return Colors.black;
    case MarkerType.kosciol: return Colors.black;
    case MarkerType.salaParafialna: return Colors.black;
    case MarkerType.remiza: return Colors.black;

    case MarkerType.duszpasterstwoAkademickie: return Colors.black;

    case MarkerType.schronTurystyczny: return Colors.green[900]!;

    case MarkerType.siedzibaHufcaZhp: return Colors.black;
    case MarkerType.siedzibaChoragwiZhp: return Colors.black;
    case MarkerType.siedzibaGlownejKwateryZhp: return Colors.black;

    case MarkerType.wiata: return Colors.black;

    case MarkerType.inne: return Colors.black;
  }

}

Widget markerTypeToWidget(MarkerType markerType, {required double size, bool elevated = false}){

  switch(markerType) {
    case MarkerType.error: return CategoryThumbnailCommonWidget.fromIcon(
          color: getMarkerTypeColor(markerType), iconColor: getMarkerTypeIconColor(markerType),
          size: size, elevated: elevated,
          icon: MdiIcons.alertCircleOutline);

    case MarkerType.harcowka: return CategoryThumbnailCommonWidget.fromIcon(
        color: getMarkerTypeColor(markerType), iconColor: getMarkerTypeIconColor(markerType),
        size: size, elevated: elevated,
        icon: MdiIcons.fleurDeLis);
    case MarkerType.miejsceOgniskowe: return CategoryThumbnailCommonWidget.fromIcon(
        color: getMarkerTypeColor(markerType), iconColor: getMarkerTypeIconColor(markerType),
        size: size, elevated: elevated,
        icon: MdiIcons.fireplace);
    case MarkerType.miejsceBiwakowe: return CategoryThumbnailCommonWidget.fromIcon(
        color: getMarkerTypeColor(markerType), iconColor: getMarkerTypeIconColor(markerType),
        size: size, elevated: elevated,
        icon: MdiIcons.flagTriangle);
    case MarkerType.miejsceObozowe: return CategoryThumbnailCommonWidget.fromIcon(
        color: getMarkerTypeColor(markerType), iconColor: getMarkerTypeIconColor(markerType),
        size: size, elevated: elevated,
        icon: MdiIcons.flagVariant);
    case MarkerType.szkola: return CategoryThumbnailCommonWidget.fromIcon(
        color: getMarkerTypeColor(markerType), iconColor: getMarkerTypeIconColor(markerType),
        size: size, elevated: elevated,
        icon: MdiIcons.school);
    case MarkerType.kosciol: return CategoryThumbnailCommonWidget.fromIcon(
        color: getMarkerTypeColor(markerType), iconColor: getMarkerTypeIconColor(markerType),
        size: size, elevated: elevated,
        icon: MdiIcons.church);
    case MarkerType.salaParafialna: return CategoryThumbnailCommonWidget.fromIcon(
        color: getMarkerTypeColor(markerType), iconColor: getMarkerTypeIconColor(markerType),
        size: size, elevated: elevated,
        icon: MdiIcons.churchOutline);
    case MarkerType.remiza: return CategoryThumbnailCommonWidget.fromIcon(
        color: getMarkerTypeColor(markerType), iconColor: getMarkerTypeIconColor(markerType),
        size: size, elevated: elevated,
        icon: MdiIcons.fireTruck);

    case MarkerType.duszpasterstwoAkademickie: return CategoryThumbnailCommonWidget.fromIcon(
        color: getMarkerTypeColor(markerType), iconColor: getMarkerTypeIconColor(markerType),
        size: size, elevated: elevated,
        icon: MdiIcons.cross);

    case MarkerType.schronTurystyczny: return CategoryThumbnailCommonWidget.fromIcon(
        color: getMarkerTypeColor(markerType), iconColor: getMarkerTypeIconColor(markerType),
        size: size, elevated: elevated,
        icon: MdiIcons.homeOutline);

    case MarkerType.siedzibaHufcaZhp: return CategoryThumbnailCommonWidget.fromIcon(
        color: getMarkerTypeColor(markerType), iconColor: getMarkerTypeIconColor(markerType),
        size: size, elevated: elevated,
        icon: MdiIcons.homeCityOutline);
    case MarkerType.siedzibaChoragwiZhp: return CategoryThumbnailCommonWidget.fromIcon(
        color: getMarkerTypeColor(markerType), iconColor: getMarkerTypeIconColor(markerType),
        size: size, elevated: elevated,
        icon: MdiIcons.domain);
    case MarkerType.siedzibaGlownejKwateryZhp: return CategoryThumbnailCommonWidget.fromIcon(
        color: getMarkerTypeColor(markerType), iconColor: getMarkerTypeIconColor(markerType),
        size: size, elevated: elevated,
        icon: MdiIcons.officeBuildingOutline);

    case MarkerType.wiata: return CategoryThumbnailCommonWidget.fromIcon(
        color: getMarkerTypeColor(markerType), iconColor: getMarkerTypeIconColor(markerType),
        size: size, elevated: elevated,
        icon: MdiIcons.homeOutline);

    case MarkerType.inne: return CategoryThumbnailCommonWidget.fromIcon(
        color: getMarkerTypeColor(markerType), iconColor: getMarkerTypeIconColor(markerType),
        size: size, elevated: elevated,
        icon: MdiIcons.helpCircleOutline);
  }

}