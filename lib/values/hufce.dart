// STOPNIE HARCERSKIE

enum StopZHP{
  dhd,
  dhc,
  
  zhpMlodzik, zhpOchotniczka,
  zhpWywiadowca, zhpTropicielka,
  zhpOdkrywca, zhpPionierka,
  zhpCwik, zhpSamarytanka,
  zhpHOd, zhpHOc,
  zhpHRd, zhpHRc,
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
  StopZHP.zhpHOd: 'zhpHOd',
  StopZHP.zhpHOc: 'zhpHOc',
  StopZHP.zhpHRd: 'zhpHRd',
  StopZHP.zhpHRc: 'zhpHRc',
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
  'zhpHOd': StopZHP.zhpHOd,
  'zhpHOc': StopZHP.zhpHOc,
  'zhpHRd': StopZHP.zhpHRd,
  'zhpHRc': StopZHP.zhpHRc,
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

const String stopZhpHoD = 'Harcerka Orla';
const String stopZhpHoC = 'Harcerz Orli';
const String stopZhpHoShort = 'HO';

const String stopZhpHrD = 'Harcerka Rzeczypospolitej';
const String stopZhpHrC = 'Harcerz Rzeczypospolitej';
const String stopZhpHrShort = 'HR';

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
      default: return '';
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
    default: return '';
  }
}

// HUFCE
const String huf_zhp_uk = 'Hufiec Wilno - Związek Harcerstwa Polskiego w Wielkiej Brytanii.';

const String huf_zhp_andrychow = 'Hufiec ZHP Andrychów';
const String huf_zhp_beskidzki = 'Hufiec ZHP Beskidzki';
const String huf_zhp_brodnica = 'Hufiec ZHP Brodnica';
const String huf_zhp_bydgoszcz_miasto = 'Hufiec ZHP Bydgoszcz-Miasto';
const String huf_zhp_czestochowa = 'Hufiec ZHP Częstochowa';
const String huf_zhp_doliny_liwca = 'Hufiec ZHP Doliny Liwca im. Edmunda Zarzyckiego';
const String huf_zhp_gdansk_srodmiesie = 'Hufiec ZHP Gdańsk-Śródmieście';
const String huf_zhp_glowno = 'Hufiec ZHP Głowno';
const String huf_zhp_gniezno = 'Hufiec ZHP Gniezno';
const String huf_zhp_grodzisk_mazowiecki = 'Hufiec ZHP Grodzisk Mazowiecki';
const String huf_zhp_jarocin = 'Hufiec ZHP Jarocin';
const String huf_zhp_karkonoski = 'Karkonoski Hufiec ZHP';
const String huf_zhp_kielce_poludnie = 'Hufiec ZHP Kielce-Południe';
const String huf_zhp_konin = 'Hufiec ZHP Konin';
const String huf_zhp_lask = 'Hufiec ZHP Łask';
const String huf_zhp_legionowo = 'Hufiec ZHP Legionowo';
const String huf_zhp_luban = 'Hufiec ZHP Lubań';
const String huf_zhp_lublin = 'Hufiec ZHP Lublin';
const String huf_zhp_lodz_baluty = 'Hufiec ZHP Łódź-Bałuty';
const String huf_zhp_myslenice = 'Hufiec ZHP Myślenice';
const String huf_zhp_opole = 'Hufiec ZHP Opole';
const String huf_zhp_podkrakowski = 'Hufiec Podkrakowski ZHP';
const String huf_zhp_poznan_nowe_miasto = 'Hufiec ZHP Poznań Nowe Miasto';
const String huf_zhp_poznan_wilda = 'Hufiec ZHP Poznań-Wilda';
const String huf_zhp_pruszkow = 'Hufiec ZHP Pruszków';
const String huf_zhp_pulawy = 'Hufiec ZHP Puławy';
const String huf_zhp_rybnik = 'Hufiec ZHP Rybnik';
const String huf_zhp_rzeszow = 'Hufiec ZHP Rzeszów';
const String huf_zhp_torun = 'Hufiec ZHP Toruń';
const String huf_zhp_trzebinia = 'Hufiec ZHP Trzebinia';

const String huf_zhp_warszawa_mokotow = 'Hufiec ZHP Warszawa Mokotów';
const String huf_zhp_warszawa_praga_pn = 'Hufiec ZHP Warszawa-Praga-Północ';
const String huf_zhp_warszawa_ursynow = 'Hufiec ZHP Warszawa Ursynów';
const String huf_zhp_warszawa_zoliborz = 'Hufiec ZHP Warszawa Żoliborz';

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
const String huf_zhp_ziemi_rybnickiej = 'Hufiec ZHP Ziemii Rybnickiej';
const String huf_zhp_ziemi_tarnogorskiej = 'Hufiec Ziemi Tarnogórskiej im. Powstańców Śląskich';
const String huf_zhp_ziemi_wodzislawskiej = 'Hufiec ZHP Ziemi Wodzisławskiej';
const String huf_zhp_zielonka = 'Hufiec ZHP Zielonka im. Janusza Korczaka';

const String huf_zhr_zielonagora_topor = 'Zielonogórski Hufiec Harcerzy "Topór"';
const String huf_zhr_lodz = 'Hufiec „Szaniec” - Okręg Łódzki ZHR';
