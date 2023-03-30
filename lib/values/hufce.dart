// STOPNIE HARCERSKIE

enum StopZHP{
  dhd,
  dhc,
  
  zhpMlodzik, zhpOchotniczka,
  zhpWywiadowca, zhpTropicielka,
  zhpOdkrywca, zhpPionierka,
  zhpCwik, zhpSamarytanka,
  zhpHOc, zhpHOd,
  zhpHRc, zhpHRd,

  zhrMlodzik, zhrOchotniczka,
  zhrWywiadowca, zhrTropicielka,
  zhrCwik, zhrSamarytanka,
  zhrHOc, zhrWedrowniczka,
  zhrHRc, zhrHRd,
}

Map<StopZHP, String> stopZHPToString = {
  StopZHP.dhd: 'dhd',
  StopZHP.dhc: 'dhc',
  StopZHP.zhpMlodzik: 'zhpMlodzik',
  StopZHP.zhpOchotniczka: 'zhpOchotniczka',
  StopZHP.zhpWywiadowca: 'zhpWywiadowca',
  StopZHP.zhpTropicielka: 'zhpTropicielka',
  StopZHP.zhpOdkrywca: 'zhpOdkrywca',
  StopZHP.zhpPionierka: 'zhpPionierka',

  StopZHP.zhpCwik: 'zhpCwik',
  StopZHP.zhpSamarytanka: 'zhpSamarytanka',
  StopZHP.zhpHOc: 'zhpHOc',
  StopZHP.zhpHOd: 'zhpHOd',
  StopZHP.zhpHRc: 'zhpHRc',
  StopZHP.zhpHRd: 'zhpHRd',

  StopZHP.zhrMlodzik: 'zhrMlodzik',
  StopZHP.zhrOchotniczka: 'zhrOchotniczka',
  StopZHP.zhrWywiadowca: 'zhrWywiadowca',
  StopZHP.zhrTropicielka: 'zhrTropicielka',
  StopZHP.zhrCwik: 'zhrCwik',
  StopZHP.zhrSamarytanka: 'zhrSamarytanka',
  StopZHP.zhrHOc: 'zhrHOc',
  StopZHP.zhrWedrowniczka: 'zhrWedrowniczka',
  StopZHP.zhrHRc: 'zhrHRc',
  StopZHP.zhrHRd: 'zhrHRd',
};

Map<String, StopZHP> stringToStopZHP = {
  'dhd': StopZHP.dhd,
  'dhc': StopZHP.dhc,
  'zhpMlodzik': StopZHP.zhpMlodzik,
  'zhpOchotniczka': StopZHP.zhpOchotniczka,
  'zhpWywiadowca': StopZHP.zhpWywiadowca,
  'zhpTropicielka': StopZHP.zhpTropicielka,
  'zhpOdkrywca': StopZHP.zhpOdkrywca,
  'zhpPionierka': StopZHP.zhpPionierka,

  'zhpCwik': StopZHP.zhpCwik,
  'zhpSamarytanka': StopZHP.zhpSamarytanka,
  'zhpHOc': StopZHP.zhpHOc,
  'zhpHOd': StopZHP.zhpHOd,
  'zhpHRc': StopZHP.zhpHRc,
  'zhpHRd': StopZHP.zhpHRd,

  'zhrMlodzik': StopZHP.zhrMlodzik,
  'zhrOchotniczka': StopZHP.zhrOchotniczka,
  'zhrWywiadowca': StopZHP.zhrWywiadowca,
  'zhrTropicielka': StopZHP.zhrTropicielka,
  'zhrCwik': StopZHP.zhrCwik,
  'zhrSamarytanka': StopZHP.zhrSamarytanka,
  'zhrHOc': StopZHP.zhrHOc,
  'zhrWedrowniczka': StopZHP.zhrWedrowniczka,
  'zhrHRc': StopZHP.zhrHRc,
  'zhrHRd': StopZHP.zhrHRd,
};

const String stopZhpDhD = 'Druhna';
const String stopZhpDhDShort = 'dh.';
const String stopZhpDhC = 'Druh';
const String stopZhpDhCShort = 'dh';

const String stopZhpMlodzik = 'Młodzik';
const String stopZhpMlodzikShort = 'mł.';
const String stopZhpOchotniczka = 'Ochotniczka';
const String stopZhpOchotniczkaShort = 'och.';

const String stopZhpWywiadowca = 'Wywiadowca';
const String stopZhpWywiadowcaShort = 'wyw.';
const String stopZhpTropicielka = 'Tropicielka';
const String stopZhpTropicielkaShort = 'trop.';

const String stopZhpOdkrywca = 'Odkrywca';
const String stopZhpOdkrywcaShort = 'odk.';
const String stopZhpPionierka = 'Pionierka';
const String stopZhpPionierkaShort = 'pion.';

const String stopZhpCwik = 'Ćwik';
const String stopZhpCwikShort = 'ćw.';
const String stopZhpSamarytanka = 'Samarytanka';
const String stopZhpSamarytankaShort = 'sam.';

const String stopZhpHoC = 'Harcerz Orli';
const String stopZhpHoD = 'Harcerka Orla';
const String stopZhpHoShort = 'HO';

const String stopZhpHrC = 'Harcerz Rzeczypospolitej';
const String stopZhpHrD = 'Harcerka Rzeczypospolitej';
const String stopZhpHrShort = 'HR';

const String stopZhrMlodzik = 'Młodzik';
const String stopZhrMlodzikShort = 'mł.';
const String stopZhrOchotniczka = 'Ochotniczka';
const String stopZhrOchotniczkaShort = 'och.';

const String stopZhrWywiadowca = 'Wywiadowca';
const String stopZhrWywiadowcaShort = 'wyw.';
const String stopZhrTropicielka = 'Tropicielka';
const String stopZhrTropicielkaShort = 'trop.';

const String stopZhrCwik = 'Ćwik';
const String stopZhrCwikShort = 'ćw.';
const String stopZhrSamarytanka = 'Samarytanka';
const String stopZhrSamarytankaShort = 'sam.';

const String stopZhrHoC = 'Harcerz Orli';
const String stopZhrHoShort = 'HO';
const String stopZhrWedrowniczka = 'Wędrowniczka';
const String stopZhrWedrowniczkaShort = 'wędr.';

const String stopZhrHrC = 'Harcerz Rzeczypospolitej';
const String stopZhrHrD = 'Harcerka Rzeczypospolitej';
const String stopZhrHrShort = 'HR';

String stopFullName(StopZHP stop){
    switch(stop){
      case StopZHP.dhd: return stopZhpDhD;
      case StopZHP.dhc: return stopZhpDhC;
      case StopZHP.zhpMlodzik: return stopZhpMlodzik;
      case StopZHP.zhpOchotniczka: return stopZhpOchotniczka;
      case StopZHP.zhpWywiadowca: return stopZhpWywiadowca;
      case StopZHP.zhpTropicielka: return stopZhpTropicielka;
      case StopZHP.zhpOdkrywca: return stopZhpOdkrywca;
      case StopZHP.zhpPionierka: return stopZhpPionierka;
      case StopZHP.zhpCwik: return stopZhpCwik;
      case StopZHP.zhpSamarytanka: return stopZhpSamarytanka;
      case StopZHP.zhpHOd: return stopZhpHoD;
      case StopZHP.zhpHOc: return stopZhpHoC;
      case StopZHP.zhpHRd: return stopZhpHrD;
      case StopZHP.zhpHRc: return stopZhpHrC;

      case StopZHP.zhrMlodzik: return stopZhrMlodzik;
      case StopZHP.zhrOchotniczka: return stopZhrOchotniczka;
      case StopZHP.zhrWywiadowca: return stopZhrWywiadowca;
      case StopZHP.zhrTropicielka: return stopZhrTropicielka;
      case StopZHP.zhrCwik: return stopZhrCwik;
      case StopZHP.zhrSamarytanka: return stopZhrSamarytanka;
      case StopZHP.zhrHOc: return stopZhrHoC;
      case StopZHP.zhrWedrowniczka: return stopZhrWedrowniczka;
      case StopZHP.zhrHRc: return stopZhrHrC;
      case StopZHP.zhrHRd: return stopZhrHrD;
    }
}

String stopShortName(StopZHP? stop){
  switch(stop){
    case StopZHP.dhd: return stopZhpDhDShort;
    case StopZHP.dhc: return stopZhpDhCShort;
    case StopZHP.zhpMlodzik: return stopZhpMlodzikShort;
    case StopZHP.zhpOchotniczka: return stopZhpOchotniczkaShort;
    case StopZHP.zhpWywiadowca: return stopZhpWywiadowcaShort;
    case StopZHP.zhpTropicielka: return stopZhpTropicielkaShort;
    case StopZHP.zhpOdkrywca: return stopZhpOdkrywcaShort;
    case StopZHP.zhpPionierka: return stopZhpPionierkaShort;
    case StopZHP.zhpCwik: return stopZhpCwikShort;
    case StopZHP.zhpSamarytanka: return stopZhpSamarytankaShort;
    case StopZHP.zhpHOd: return stopZhpHoShort;
    case StopZHP.zhpHOc: return stopZhpHoShort;
    case StopZHP.zhpHRd: return stopZhpHrShort;
    case StopZHP.zhpHRc: return stopZhpHrShort;

    case StopZHP.zhrMlodzik: return stopZhrMlodzikShort;
    case StopZHP.zhrOchotniczka: return stopZhrOchotniczkaShort;
    case StopZHP.zhrWywiadowca: return stopZhrWywiadowcaShort;
    case StopZHP.zhrTropicielka: return stopZhrTropicielkaShort;
    case StopZHP.zhrCwik: return stopZhrCwikShort;
    case StopZHP.zhrSamarytanka: return stopZhrSamarytankaShort;
    case StopZHP.zhrHOc: return stopZhrHoShort;
    case StopZHP.zhrWedrowniczka: return stopZhrWedrowniczkaShort;
    case StopZHP.zhrHRc: return stopZhrHrShort;
    case StopZHP.zhrHRd: return stopZhrHrShort;
    case null: return '';
  }
}

// HUFCE
const String huf_zhp_uk = 'Hufiec Wilno - Związek Harcerstwa Polskiego w Wielkiej Brytanii.';

const String huf_zhp_andrychow = 'Hufiec ZHP Andrychów';
const String huf_zhp_augustow = 'Hufiec ZHP Augustów';
const String huf_zhp_beskidzki = 'Hufiec ZHP Beskidzki';
const String huf_zhp_brodnica = 'Hufiec ZHP Brodnica';
const String huf_zhp_bydgoszcz_miasto = 'Hufiec ZHP Bydgoszcz-Miasto';
const String huf_zhp_czestochowa = 'Hufiec ZHP Częstochowa';
const String huf_zhp_doliny_liwca = 'Hufiec ZHP Doliny Liwca im. Edmunda Zarzyckiego';
const String huf_zhp_gdansk_srodmiesie = 'Hufiec ZHP Gdańsk-Śródmieście';
const String huf_zhp_glowno = 'Hufiec ZHP Głowno';
const String huf_zhp_gniezno = 'Hufiec ZHP Gniezno';
const String huf_zhp_grodzisk_mazowiecki = 'Hufiec ZHP Grodzisk Mazowiecki';
const String huf_zhp_grojec = 'Hufiec ZHP Grójec';
const String huf_zhp_jarocin = 'Hufiec ZHP Jarocin';
const String huf_zhp_karkonoski = 'Karkonoski Hufiec ZHP';
const String huf_zhp_kielce_poludnie = 'Hufiec ZHP Kielce-Południe';
const String huf_zhp_konin = 'Hufiec ZHP Konin';
const String huf_zhp_lask = 'Hufiec ZHP Łask';
const String huf_zhp_legionowo = 'Hufiec ZHP Legionowo im. Szarych Szeregów "Rój-Tom"';
const String huf_zhp_luban = 'Hufiec ZHP Lubań';
const String huf_zhp_lublin = 'Hufiec ZHP Lublin';
const String huf_zhp_lodz_baluty = 'Hufiec ZHP Łódź-Bałuty';
const String huf_zhp_lodz_gorna = 'Hufiec ZHP Łódź-Górna';
const String huf_zhp_lodz_polesie = 'Łódź Polesie';
const String huf_zhp_myslenice = 'Hufiec ZHP Myślenice';
const String huf_zhp_opole = 'Hufiec ZHP Opole';
const String huf_zhp_ostrowiec_swietokrzyski = 'Hufiec ZHP Ostrowiec Świętokrzyski';
const String huf_zhp_podkrakowski = 'Hufiec Podkrakowski ZHP';
const String huf_zhp_poznan_grunwald = 'Hufiec ZHP Poznań Grunwald';
const String huf_zhp_poznan_nowe_miasto = 'Hufiec ZHP Poznań Nowe Miasto';
const String huf_zhp_poznan_wilda = 'Hufiec ZHP Poznań-Wilda';
const String huf_zhp_pruszkow = 'Hufiec ZHP Pruszków';
const String huf_zhp_pulawy = 'Hufiec ZHP Puławy';
const String huf_zhp_redukta = 'Hufiec ZHP Reduta';
const String huf_zhp_ruda_slaska = 'Hufiec ZHP Ruda Śląska';
const String huf_zhp_rybnik = 'Hufiec ZHP Rybnik';
const String huf_zhp_rzeszow = 'Hufiec ZHP Rzeszów';
const String huf_zhp_torun = 'Hufiec ZHP Toruń';
const String huf_zhp_trzebinia = 'Hufiec ZHP Trzebinia';

const String huf_zhp_warszawa_centrum = 'Hufiec ZHP Warszawa Centrum';
const String huf_zhp_warszawa_mokotow = 'Hufiec ZHP Warszawa Mokotów';
const String huf_zhp_warszawa_praga_pn = 'Hufiec ZHP Warszawa-Praga-Północ';
const String huf_zhp_warszawa_ursus_wlochy = 'Hufiec ZHP Warszawa Ursus-Włochy';
const String huf_zhp_warszawa_ursynow = 'Hufiec ZHP Warszawa Ursynów';
const String huf_zhp_warszawa_zoliborz = 'Hufiec ZHP Warszawa Żoliborz';
const String huf_zhp_wejherowo = 'Hufiec ZHP Wejherowo';
const String huf_zhp_wieliczka = 'Hufiec ZHP Wieliczka im. Edwarda Dembowskiego';

const String huf_zhp_wolsztyn = 'Hufiec ZHP Wolsztyn';

const String huf_zhp_wroclaw = 'Hufiec ZHP Wrocław im. Polonii Wrocławskiej';
const String huf_zhp_wroclaw_wschod = 'Hufiec ZHP Wrocław Wschód';
const String huf_zhp_wrzesnia_wrzos = 'Hufiec Września "Wrzos" ZHP im. Dzieci Wrzesińskich';

const String huf_zhp_kalisz = 'Hufiec ZHP Kalisz';
const String huf_zhp_krakow_pdg = 'Hufiec ZHP Kraków Podgórze';
const String huf_zhp_krakow_srodmiescie = 'ZHP Kraków-Śródmieście';
const String huf_zhp_krakow_nowa_huta = 'Hufiec Kraków-Nowa Huta im. Mariusza Zaruskiego';
const String huf_zhp_kutno = 'Hufiec ZHP Kutno';
const String huf_zhp_kwidzyn = 'Hufiec ZHP Kwidzyn';
const String huf_zhp_stargard = 'Hufiec ZHP Stargard';
const String huf_zhp_szczecin_pogodno = 'Hufiec ZHP Szczecin Pogodno';
const String huf_zhp_zary = 'Hufiec ZHP Żary';
const String huf_zhp_zdunska_wola = 'Hufiec ZHP Zduńska Wola';
const String huf_zhp_ziemi_bedzinskiej = 'Hufiec ZHP Ziemi Będzińskiej';
const String huf_zhp_ziemi_cieszynskiej = 'Hufiec ZHP Ziemi Cieszyńskiej';
const String huf_zhp_ziemi_gliwickiej = 'Hufiec ZHP Ziemi Gliwickiej';
const String huf_zhp_ziemi_koszalinskiej = 'Hufiec ZHP Ziemi Koszalińskiej';
const String huf_zhp_ziemi_rybnickiej = 'Hufiec ZHP Ziemi Rybnickiej';
const String huf_zhp_ziemi_sanockiej = 'Hufiec Ziemi Sanockiej';
const String huf_zhp_ziemi_tarnogorskiej = 'Hufiec Ziemi Tarnogórskiej im. Powstańców Śląskich';
const String huf_zhp_ziemi_wodzislawskiej = 'Hufiec ZHP Ziemi Wodzisławskiej';
const String huf_zhp_zielona_gora = 'Hufiec ZHP Zielona Góra';
const String huf_zhp_zielonka = 'Hufiec ZHP Zielonka im. Janusza Korczaka';
const String huf_zhp_zgierz = 'Hufiec ZHP Zgierz im. Wojska Polskiego';

const String huf_zhr_zielonagora_topor = 'Zielonogórski Hufiec Harcerzy "Topór"';
const String huf_zhr_lodz = 'Hufiec „Szaniec” - Okręg Łódzki ZHR';

const String huf_zhr_3_gdynski = 'III Gdyński Hufiec Harcerski "Pojutrze"';
