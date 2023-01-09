import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/category_thumbnail_widget.dart';
import 'package:harcapp/values/colors.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum CommunityCategory{
  error,

  gromada,
  gromadaZuchowaZHP,
  gromadaZuchowZHR,
  gromadaZuchenekZHR,

  radaGromady,
  szostka,

  druzyna,
  druzynaHarcerskaZHP,
  druzynaHarcerzyStarszychZHP,
  druzynaWedrowniczaZHP,
  druzynaHarcerzyZHR,
  druzynaHarcerekZHR,
  druzynaWedrownikowZHR,
  druzynaWedrowniczekZHR,

  radaDruzyny,
  zastep,
  patrol,

  szczep,
  radaSzczepu,
  komisjaStopniHarcerskich,

  zwiazekDruzyn,
  radaZwiazkuDruzyn,

  hufiec,
  komendaHufca,
  namiestnictwo,
  komisjaStopniInstruktorskich,

  toIOwo
}

List<CommunityCategory> get allUsableCommunityCategory{
  List<CommunityCategory> all = List.of(CommunityCategory.values);
  all.remove(CommunityCategory.error);
  return all;
}

Color getCommCatColor(CommunityCategory commCat){

  switch(commCat) {
    case CommunityCategory.error: return Colors.transparent;
    case CommunityCategory.gromada: return AppColors.metoZhpZ;
    case CommunityCategory.gromadaZuchowaZHP: return AppColors.metoZhpZ;
    case CommunityCategory.gromadaZuchowZHR: return AppColors.metoZhpZ;
    case CommunityCategory.gromadaZuchenekZHR: return AppColors.metoZhpZ;

    case CommunityCategory.radaGromady: return AppColors.metoZhpZ;
    case CommunityCategory.szostka: return AppColors.metoZhpZ;

    case CommunityCategory.druzyna: return Colors.white;
    case CommunityCategory.druzynaHarcerskaZHP: return AppColors.metoZhpH;
    case CommunityCategory.druzynaHarcerzyStarszychZHP: return AppColors.metoZhpHS;
    case CommunityCategory.druzynaWedrowniczaZHP: return AppColors.metoZhpW;
    case CommunityCategory.druzynaHarcerzyZHR: return AppColors.metoZhpH;
    case CommunityCategory.druzynaHarcerekZHR: return AppColors.metoZhpH;
    case CommunityCategory.druzynaWedrownikowZHR: return AppColors.metoZhpW;
    case CommunityCategory.druzynaWedrowniczekZHR: return AppColors.metoZhpW;

    case CommunityCategory.radaDruzyny: return Colors.transparent;
    case CommunityCategory.zastep: return Colors.transparent;
    case CommunityCategory.patrol: return Colors.transparent;

    case CommunityCategory.szczep: return Colors.transparent;
    case CommunityCategory.radaSzczepu: return Colors.transparent;
    case CommunityCategory.komisjaStopniHarcerskich: return Colors.transparent;

    case CommunityCategory.zwiazekDruzyn: return Colors.transparent;
    case CommunityCategory.radaZwiazkuDruzyn: return Colors.transparent;

    case CommunityCategory.hufiec: return Colors.transparent;
    case CommunityCategory.komendaHufca: return Colors.transparent;
    case CommunityCategory.namiestnictwo: return Colors.transparent;
    case CommunityCategory.komisjaStopniInstruktorskich: return Colors.transparent;
    case CommunityCategory.toIOwo: return Colors.transparent;
  }

}

Widget commCatToWidget(CommunityCategory commCat, {required double size, bool elevated = true}){

  switch(commCat) {
    case CommunityCategory.error: return CategoryThumbnailCommonWidget.fromIcon(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        icon: MdiIcons.alertCircleOutline);
    case CommunityCategory.gromada: return CategoryThumbnailCommonWidget.fromText(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        text: 'Z');
    case CommunityCategory.gromadaZuchowaZHP: return CategoryThumbnailCommonWidget.fromSvg(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        svgPath: 'assets/images/meto/z.svg', svgSizeFraction: .8);
    case CommunityCategory.gromadaZuchowZHR: return CategoryThumbnailCommonWidget.fromSvg(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        svgPath: 'assets/images/scout_org_logos/logo_zhr_simple.svg', svgSizeFraction: .8);
    case CommunityCategory.gromadaZuchenekZHR: return CategoryThumbnailCommonWidget.fromSvg(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        svgPath: 'assets/images/scout_org_logos/logo_zhr_simple.svg', svgSizeFraction: .8);
    case CommunityCategory.radaGromady: return CategoryThumbnailCommonWidget.fromText(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        text: 'Z');
    case CommunityCategory.szostka: return CategoryThumbnailCommonWidget.fromText(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        text: 'Z');

    case CommunityCategory.druzyna: return CategoryThumbnailCommonWidget.fromText(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        text: 'D');
    case CommunityCategory.druzynaHarcerskaZHP: return CategoryThumbnailCommonWidget.fromSvg(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        svgPath: 'assets/images/meto/h.svg');
    case CommunityCategory.druzynaHarcerzyStarszychZHP: return CategoryThumbnailCommonWidget.fromSvg(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        svgPath: 'assets/images/meto/hs.svg');
    case CommunityCategory.druzynaWedrowniczaZHP: return CategoryThumbnailCommonWidget.fromSvg(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        svgPath: 'assets/images/meto/w.svg');
    case CommunityCategory.druzynaHarcerzyZHR: return CategoryThumbnailCommonWidget.fromSvg(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        svgPath: 'assets/images/scout_org_logos/logo_zhr_simple.svg', svgSizeFraction: .8);
    case CommunityCategory.druzynaHarcerekZHR: return CategoryThumbnailCommonWidget.fromSvg(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        svgPath: 'assets/images/scout_org_logos/logo_zhr_simple.svg', svgSizeFraction: .8);
    case CommunityCategory.druzynaWedrownikowZHR: return CategoryThumbnailCommonWidget.fromSvg(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        svgPath: 'assets/images/scout_org_logos/logo_zhr_simple.svg', svgSizeFraction: .8);
    case CommunityCategory.druzynaWedrowniczekZHR: return CategoryThumbnailCommonWidget.fromSvg(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        svgPath: 'assets/images/scout_org_logos/logo_zhr_simple.svg', svgSizeFraction: .8);

    case CommunityCategory.radaDruzyny: return CategoryThumbnailCommonWidget.fromText(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        text: 'RD');
    case CommunityCategory.zastep: return CategoryThumbnailCommonWidget.fromText(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        text: 'Z');
    case CommunityCategory.patrol: return CategoryThumbnailCommonWidget.fromText(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        text: 'P');

    case CommunityCategory.szczep: return CategoryThumbnailCommonWidget.fromText(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        text: 'Sz');
    case CommunityCategory.radaSzczepu: return CategoryThumbnailCommonWidget.fromText(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        text: 'RS');
    case CommunityCategory.komisjaStopniHarcerskich: return CategoryThumbnailCommonWidget.fromText(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        text: 'KSH');

    case CommunityCategory.zwiazekDruzyn: return CategoryThumbnailCommonWidget.fromText(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        text: 'ZD');
    case CommunityCategory.radaZwiazkuDruzyn: return CategoryThumbnailCommonWidget.fromText(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        text: 'RZD');

    case CommunityCategory.hufiec: return CategoryThumbnailCommonWidget.fromText(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        text: 'H');
    case CommunityCategory.komendaHufca: return CategoryThumbnailCommonWidget.fromText(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        text: 'KH');
    case CommunityCategory.namiestnictwo: return CategoryThumbnailCommonWidget.fromText(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        text: 'N');
    case CommunityCategory.komisjaStopniInstruktorskich: return CategoryThumbnailCommonWidget.fromText(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        text: 'KSI');
    case CommunityCategory.toIOwo: return CategoryThumbnailCommonWidget.fromText(
        color: getCommCatColor(commCat), size: size, elevated: elevated,
        text: ':)');
  }

}

String commCatToName(CommunityCategory category){

  switch(category){
    case CommunityCategory.error: return 'Błąd!';

    case CommunityCategory.gromada: return 'Gromada';
    case CommunityCategory.gromadaZuchowaZHP: return 'Gromada zuchowa ZHP';
    case CommunityCategory.gromadaZuchowZHR: return 'Gromada zuchów ZHR';
    case CommunityCategory.gromadaZuchenekZHR: return 'Gromada zuchenek ZHR';
    case CommunityCategory.radaGromady: return 'Rada gromady';
    case CommunityCategory.szostka: return 'Szóstka';

    case CommunityCategory.druzyna: return 'Druzyna';
    case CommunityCategory.druzynaHarcerskaZHP: return 'Drużyna harcerska ZHP';
    case CommunityCategory.druzynaHarcerzyStarszychZHP: return 'Drużyna harcerzy starszych ZHP';
    case CommunityCategory.druzynaWedrowniczaZHP: return 'Drużyna wędrownicza ZHP';
    case CommunityCategory.druzynaHarcerzyZHR: return 'Drużyna harcerzy ZHR';
    case CommunityCategory.druzynaHarcerekZHR: return 'Drużyna harcerek ZHR';
    case CommunityCategory.druzynaWedrownikowZHR: return 'Drużyna wedrowników ZHR';
    case CommunityCategory.druzynaWedrowniczekZHR: return 'Drużyna wedrowniczek ZHR';

    case CommunityCategory.radaDruzyny: return 'Rada drużyny';
    case CommunityCategory.zastep: return 'Zastęp';
    case CommunityCategory.patrol: return 'Patrol';

    case CommunityCategory.szczep: return 'Szczep';
    case CommunityCategory.radaSzczepu: return 'Rada szczepu';
    case CommunityCategory.komisjaStopniHarcerskich: return 'Komisja Stopni Harcerskich';

    case CommunityCategory.zwiazekDruzyn: return 'Związek Drużyn';
    case CommunityCategory.radaZwiazkuDruzyn: return 'Rada zwiazku drużyn';

    case CommunityCategory.hufiec: return 'Hufiec';
    case CommunityCategory.komendaHufca: return 'Komenda hufca';
    case CommunityCategory.namiestnictwo: return 'Namiestnictwo';
    case CommunityCategory.komisjaStopniInstruktorskich: return 'Komisja Stopni Instruktorskich';
    case CommunityCategory.toIOwo: return 'To i owo';

  }

}

String commCatToNameShort(CommunityCategory category){

  switch(category){
    case CommunityCategory.error: return 'Błąd!';

    case CommunityCategory.gromada: return 'Gromada';
    case CommunityCategory.gromadaZuchowaZHP: return 'Gromada zuchowa ZHP';
    case CommunityCategory.gromadaZuchowZHR: return 'Gromada zuchów ZHR';
    case CommunityCategory.gromadaZuchenekZHR: return 'Gromada zuchenek ZHR';
    case CommunityCategory.radaGromady: return 'Rada gromady';
    case CommunityCategory.szostka: return 'Szóstka';

    case CommunityCategory.druzyna: return 'Drużyna';
    case CommunityCategory.druzynaHarcerskaZHP: return 'Drużyna harcerska ZHP';
    case CommunityCategory.druzynaHarcerzyStarszychZHP: return 'Drużyna harcerzy starszych ZHP';
    case CommunityCategory.druzynaWedrowniczaZHP: return 'Drużyna wędrownicza ZHP';
    case CommunityCategory.druzynaHarcerzyZHR: return 'Drużyna harcerzy ZHR';
    case CommunityCategory.druzynaHarcerekZHR: return 'Drużyna harcerek ZHR';
    case CommunityCategory.druzynaWedrownikowZHR: return 'Drużyna wedrowników ZHR';
    case CommunityCategory.druzynaWedrowniczekZHR: return 'Drużyna wedrowniczek ZHR';

    case CommunityCategory.radaDruzyny: return 'Rada drużyny';
    case CommunityCategory.zastep: return 'Zastęp';
    case CommunityCategory.patrol: return 'Patrol';

    case CommunityCategory.szczep: return 'Szczep';
    case CommunityCategory.radaSzczepu: return 'Rada szczepu';
    case CommunityCategory.komisjaStopniHarcerskich: return 'Komisja Stopni Harcerskich';

    case CommunityCategory.zwiazekDruzyn: return 'Związek Drużyn';
    case CommunityCategory.radaZwiazkuDruzyn: return 'Rada zwiazku drużyn';

    case CommunityCategory.hufiec: return 'Hufiec';
    case CommunityCategory.komendaHufca: return 'Komenda hufca';
    case CommunityCategory.namiestnictwo: return 'Namiestnictwo';
    case CommunityCategory.komisjaStopniInstruktorskich: return 'Komisja Stopni Instruktorskich';
    case CommunityCategory.toIOwo: return 'To i owo';

  }

}

String commCatToString(CommunityCategory category){

  switch(category){
    case CommunityCategory.error: return 'err';

    case CommunityCategory.gromada: return 'gromada';
    case CommunityCategory.gromadaZuchowaZHP: return 'gromadaZuchowaZHP';
    case CommunityCategory.gromadaZuchowZHR: return 'gromadaZuchowZHR';
    case CommunityCategory.gromadaZuchenekZHR: return 'gromadaZuchenekZHR';
    case CommunityCategory.radaGromady: return 'radaGromady';
    case CommunityCategory.szostka: return 'szostka';

    case CommunityCategory.druzyna: return 'druzyna';
    case CommunityCategory.druzynaHarcerskaZHP: return 'druzynaHarcerskaZHP';
    case CommunityCategory.druzynaHarcerzyStarszychZHP: return 'druzynaHarcerzyStarszychZHP';
    case CommunityCategory.druzynaWedrowniczaZHP: return 'druzynaWedrowniczaZHP';
    case CommunityCategory.druzynaHarcerzyZHR: return 'druzynaHarcerzyZHR';
    case CommunityCategory.druzynaHarcerekZHR: return 'druzynaHarcerekZHR';
    case CommunityCategory.druzynaWedrownikowZHR: return 'druzynaWedrownikowZHR';
    case CommunityCategory.druzynaWedrowniczekZHR: return 'druzynaWedrowniczekZHR';

    case CommunityCategory.radaDruzyny: return 'radaDruzyny';
    case CommunityCategory.zastep: return 'zastep';
    case CommunityCategory.patrol: return 'patrol';

    case CommunityCategory.szczep: return 'szczep';
    case CommunityCategory.radaSzczepu: return 'radaSzczepu';
    case CommunityCategory.komisjaStopniHarcerskich: return 'komisjaStopniHarcerskich';

    case CommunityCategory.zwiazekDruzyn: return 'zwiazekDruzyn';
    case CommunityCategory.radaZwiazkuDruzyn: return 'radaZwiazkuDruzyn';

    case CommunityCategory.hufiec: return 'hufiec';
    case CommunityCategory.komendaHufca: return 'komendaHufca';
    case CommunityCategory.namiestnictwo: return 'namiestnictwo';
    case CommunityCategory.komisjaStopniInstruktorskich: return 'komisjaStopniInstruktorskich';
    case CommunityCategory.toIOwo: return 'toIOwo';

  }

}

const Map<String, CommunityCategory> strToCommCat = {
  'gromada': CommunityCategory.gromada,
  'gromadaZuchowaZHP': CommunityCategory.gromadaZuchowaZHP,
  'gromadaZuchowZHR': CommunityCategory.gromadaZuchowZHR,
  'gromadaZuchenekZHR': CommunityCategory.gromadaZuchenekZHR,
  'radaGromady': CommunityCategory.radaGromady,
  'szostka': CommunityCategory.szostka,

  'druzyna': CommunityCategory.druzyna,
  'druzynaHarcerskaZHP': CommunityCategory.druzynaHarcerskaZHP,
  'druzynaHarcerzyStarszychZHP': CommunityCategory.druzynaHarcerzyStarszychZHP,
  'druzynaWedrowniczaZHP': CommunityCategory.druzynaWedrowniczaZHP,
  'druzynaHarcerzyZHR': CommunityCategory.druzynaHarcerzyZHR,
  'druzynaHarcerekZHR': CommunityCategory.druzynaHarcerekZHR,
  'druzynaWedrownikowZHR': CommunityCategory.druzynaWedrownikowZHR,
  'druzynaWedrowniczekZHR': CommunityCategory.druzynaWedrowniczekZHR,

  'radaDruzyny': CommunityCategory.radaDruzyny,
  'zastep': CommunityCategory.zastep,
  'patrol': CommunityCategory.patrol,

  'szczep': CommunityCategory.szczep,
  'radaSzczepu': CommunityCategory.radaSzczepu,
  'komisjaStopniHarcerskich': CommunityCategory.komisjaStopniHarcerskich,

  'zwiazekDruzyn': CommunityCategory.zwiazekDruzyn,
  'radaZwiazkuDruzyn': CommunityCategory.radaZwiazkuDruzyn,

  'hufiec': CommunityCategory.hufiec,
  'komendaHufca': CommunityCategory.komendaHufca,
  'namiestnictwo': CommunityCategory.namiestnictwo,
  'komisjaStopniInstruktorskich': CommunityCategory.komisjaStopniInstruktorskich,
  'toIOwo': CommunityCategory.toIOwo,
};