// STOPNIE HARCERSKIE

enum StopHarc{
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

Map<StopHarc, String> stopHarcToString = {
  StopHarc.dhd: 'dhd',
  StopHarc.dhc: 'dhc',
  StopHarc.zhpMlodzik: 'zhpMlodzik',
  StopHarc.zhpOchotniczka: 'zhpOchotniczka',
  StopHarc.zhpWywiadowca: 'zhpWywiadowca',
  StopHarc.zhpTropicielka: 'zhpTropicielka',
  StopHarc.zhpOdkrywca: 'zhpOdkrywca',
  StopHarc.zhpPionierka: 'zhpPionierka',

  StopHarc.zhpCwik: 'zhpCwik',
  StopHarc.zhpSamarytanka: 'zhpSamarytanka',
  StopHarc.zhpHOc: 'zhpHOc',
  StopHarc.zhpHOd: 'zhpHOd',
  StopHarc.zhpHRc: 'zhpHRc',
  StopHarc.zhpHRd: 'zhpHRd',

  StopHarc.zhrMlodzik: 'zhrMlodzik',
  StopHarc.zhrOchotniczka: 'zhrOchotniczka',
  StopHarc.zhrWywiadowca: 'zhrWywiadowca',
  StopHarc.zhrTropicielka: 'zhrTropicielka',
  StopHarc.zhrCwik: 'zhrCwik',
  StopHarc.zhrSamarytanka: 'zhrSamarytanka',
  StopHarc.zhrHOc: 'zhrHOc',
  StopHarc.zhrWedrowniczka: 'zhrWedrowniczka',
  StopHarc.zhrHRc: 'zhrHRc',
  StopHarc.zhrHRd: 'zhrHRd',
};

Map<String, StopHarc> stringToStopHarc = {
  'dhd': StopHarc.dhd,
  'dhc': StopHarc.dhc,
  'zhpMlodzik': StopHarc.zhpMlodzik,
  'zhpOchotniczka': StopHarc.zhpOchotniczka,
  'zhpWywiadowca': StopHarc.zhpWywiadowca,
  'zhpTropicielka': StopHarc.zhpTropicielka,
  'zhpOdkrywca': StopHarc.zhpOdkrywca,
  'zhpPionierka': StopHarc.zhpPionierka,

  'zhpCwik': StopHarc.zhpCwik,
  'zhpSamarytanka': StopHarc.zhpSamarytanka,
  'zhpHOc': StopHarc.zhpHOc,
  'zhpHOd': StopHarc.zhpHOd,
  'zhpHRc': StopHarc.zhpHRc,
  'zhpHRd': StopHarc.zhpHRd,

  'zhrMlodzik': StopHarc.zhrMlodzik,
  'zhrOchotniczka': StopHarc.zhrOchotniczka,
  'zhrWywiadowca': StopHarc.zhrWywiadowca,
  'zhrTropicielka': StopHarc.zhrTropicielka,
  'zhrCwik': StopHarc.zhrCwik,
  'zhrSamarytanka': StopHarc.zhrSamarytanka,
  'zhrHOc': StopHarc.zhrHOc,
  'zhrWedrowniczka': StopHarc.zhrWedrowniczka,
  'zhrHRc': StopHarc.zhrHRc,
  'zhrHRd': StopHarc.zhrHRd,
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

String stopHarcFullName(StopHarc stop){
    switch(stop){
      case StopHarc.dhd: return stopZhpDhD;
      case StopHarc.dhc: return stopZhpDhC;
      case StopHarc.zhpMlodzik: return stopZhpMlodzik;
      case StopHarc.zhpOchotniczka: return stopZhpOchotniczka;
      case StopHarc.zhpWywiadowca: return stopZhpWywiadowca;
      case StopHarc.zhpTropicielka: return stopZhpTropicielka;
      case StopHarc.zhpOdkrywca: return stopZhpOdkrywca;
      case StopHarc.zhpPionierka: return stopZhpPionierka;
      case StopHarc.zhpCwik: return stopZhpCwik;
      case StopHarc.zhpSamarytanka: return stopZhpSamarytanka;
      case StopHarc.zhpHOd: return stopZhpHoD;
      case StopHarc.zhpHOc: return stopZhpHoC;
      case StopHarc.zhpHRd: return stopZhpHrD;
      case StopHarc.zhpHRc: return stopZhpHrC;

      case StopHarc.zhrMlodzik: return stopZhrMlodzik;
      case StopHarc.zhrOchotniczka: return stopZhrOchotniczka;
      case StopHarc.zhrWywiadowca: return stopZhrWywiadowca;
      case StopHarc.zhrTropicielka: return stopZhrTropicielka;
      case StopHarc.zhrCwik: return stopZhrCwik;
      case StopHarc.zhrSamarytanka: return stopZhrSamarytanka;
      case StopHarc.zhrHOc: return stopZhrHoC;
      case StopHarc.zhrWedrowniczka: return stopZhrWedrowniczka;
      case StopHarc.zhrHRc: return stopZhrHrC;
      case StopHarc.zhrHRd: return stopZhrHrD;
    }
}

String stopHarcShortName(StopHarc? stop){
  switch(stop){
    case StopHarc.dhd: return stopZhpDhDShort;
    case StopHarc.dhc: return stopZhpDhCShort;
    case StopHarc.zhpMlodzik: return stopZhpMlodzikShort;
    case StopHarc.zhpOchotniczka: return stopZhpOchotniczkaShort;
    case StopHarc.zhpWywiadowca: return stopZhpWywiadowcaShort;
    case StopHarc.zhpTropicielka: return stopZhpTropicielkaShort;
    case StopHarc.zhpOdkrywca: return stopZhpOdkrywcaShort;
    case StopHarc.zhpPionierka: return stopZhpPionierkaShort;
    case StopHarc.zhpCwik: return stopZhpCwikShort;
    case StopHarc.zhpSamarytanka: return stopZhpSamarytankaShort;
    case StopHarc.zhpHOd: return stopZhpHoShort;
    case StopHarc.zhpHOc: return stopZhpHoShort;
    case StopHarc.zhpHRd: return stopZhpHrShort;
    case StopHarc.zhpHRc: return stopZhpHrShort;

    case StopHarc.zhrMlodzik: return stopZhrMlodzikShort;
    case StopHarc.zhrOchotniczka: return stopZhrOchotniczkaShort;
    case StopHarc.zhrWywiadowca: return stopZhrWywiadowcaShort;
    case StopHarc.zhrTropicielka: return stopZhrTropicielkaShort;
    case StopHarc.zhrCwik: return stopZhrCwikShort;
    case StopHarc.zhrSamarytanka: return stopZhrSamarytankaShort;
    case StopHarc.zhrHOc: return stopZhrHoShort;
    case StopHarc.zhrWedrowniczka: return stopZhrWedrowniczkaShort;
    case StopHarc.zhrHRc: return stopZhrHrShort;
    case StopHarc.zhrHRd: return stopZhrHrShort;
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
const String huf_zhp_chrzanow = 'Hufiec ZHP Chrzanów';
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
const String huf_zhp_kielce_miasto = 'Hufiec ZHP Kielce-Miasto';
const String huf_zhp_konin = 'Hufiec ZHP Konin';
const String huf_zhp_lask = 'Hufiec ZHP Łask';
const String huf_zhp_legionowo = 'Hufiec ZHP Legionowo im. Szarych Szeregów "Rój-Tom"';
const String huf_zhp_luban = 'Hufiec ZHP Lubań';
const String huf_zhp_lublin = 'Hufiec ZHP Lublin';
const String huf_zhp_lodz_baluty = 'Hufiec ZHP Łódź-Bałuty';
const String huf_zhp_lodz_gorna = 'Hufiec ZHP Łódź-Górna';
const String huf_zhp_lodz_polesie = 'Hufiec ZHP Łódź Polesie';
const String huf_zhp_miedzyrzecz = 'Hufiec ZHP Międzyrzecz';
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
