// STOPNIE HARCERSKIE

enum StopZHP{
  dhd, dhc,
  ml, och,
  wyw, trop,
  odk, pion,
  cw, sam,
  HOd, HOc,
  HRd, HRc,
}

Map<StopZHP, String> stopZHPToString = {
  StopZHP.dhd: 'dhd',
  StopZHP.dhc: 'dhc',
  StopZHP.ml: 'ml',
  StopZHP.och: 'och',
  StopZHP.wyw: 'wyw',
  StopZHP.trop: 'trop',
  StopZHP.odk: 'odk',
  StopZHP.pion: 'pion',

  StopZHP.cw: 'cw',
  StopZHP.sam: 'sam',
  StopZHP.HOd: 'HOd',
  StopZHP.HOc: 'HOc',
  StopZHP.HRd: 'HRd',
  StopZHP.HRc: 'HRc',
};

Map<String, StopZHP> stringToStopZHP = {
  'dhd': StopZHP.dhd,
  'dhc': StopZHP.dhc,
  'ml': StopZHP.ml,
  'och': StopZHP.och,
  'wyw': StopZHP.wyw,
  'trop': StopZHP.trop,
  'odk': StopZHP.odk,
  'pion': StopZHP.pion,

  'cw': StopZHP.cw,
  'sam': StopZHP.sam,
  'HOd': StopZHP.HOd,
  'HOc': StopZHP.HOc,
  'HRd': StopZHP.HRd,
  'HRc': StopZHP.HRc,
};

const String stop_h_dh_d_sh = 'dh.';
const String stop_h_dh_d = 'Druhna';
const String stop_h_dh_c_sh = 'dh';
const String stop_h_dh_c = 'Druh';

const String stop_h_mlodzik = 'Młodzik';
const String stop_h_mlodzik_sh = 'mł.';
const String stop_h_ochotniczka = 'Ochotniczka';
const String stop_h_ochotniczka_sh = 'och.';

const String stop_h_wywiadowca = 'Wywiadowca';
const String stop_h_wywiadowca_sh = 'wyw.';
const String stop_h_tropicielka = 'Tropicielka';
const String stop_h_tropicielka_sh = 'trop.';

const String stop_h_odkrywca = 'Odkrywca';
const String stop_h_odkrywca_sh = 'odk.';
const String stop_h_pionierka = 'Pionierka';
const String stop_h_pionierka_sh = 'pion.';

const String stop_h_cwik = 'Ćwik';
const String stop_h_cwik_sh = 'ćw.';
const String stop_h_samarytanka = 'Samarytanka';
const String stop_h_samarytanka_sh = 'sam.';

const String stop_h_ho_d = 'Harcerka Orla';
const String stop_h_ho_c = 'Harcerz Orli';
const String stop_h_ho_sh = 'HO';

const String stop_h_hr_d = 'Harcerka Rzeczypospolitej';
const String stop_h_hr_c = 'Harcerz Rzeczypospolitej';
const String stop_h_hr_sh = 'HR';

String stopFullName(StopZHP stop){
    switch(stop){
      case StopZHP.dhd: return stop_h_dh_d;
      case StopZHP.dhc: return stop_h_dh_c;
      case StopZHP.ml: return stop_h_mlodzik;
      case StopZHP.och: return stop_h_ochotniczka;
      case StopZHP.wyw: return stop_h_wywiadowca;
      case StopZHP.trop: return stop_h_tropicielka;
      case StopZHP.odk: return stop_h_odkrywca;
      case StopZHP.pion: return stop_h_pionierka;
      case StopZHP.cw: return stop_h_cwik;
      case StopZHP.sam: return stop_h_samarytanka;
      case StopZHP.HOd: return stop_h_ho_d;
      case StopZHP.HOc: return stop_h_ho_c;
      case StopZHP.HRd: return stop_h_hr_d;
      case StopZHP.HRc: return stop_h_hr_c;
      default: return '';
    }
}

String stopShortName(StopZHP? stop){
  switch(stop){
    case StopZHP.dhd: return stop_h_dh_d_sh;
    case StopZHP.dhc: return stop_h_dh_c_sh;
    case StopZHP.ml: return stop_h_mlodzik_sh;
    case StopZHP.och: return stop_h_ochotniczka_sh;
    case StopZHP.wyw: return stop_h_wywiadowca_sh;
    case StopZHP.trop: return stop_h_tropicielka_sh;
    case StopZHP.odk: return stop_h_odkrywca_sh;
    case StopZHP.pion: return stop_h_pionierka_sh;
    case StopZHP.cw: return stop_h_cwik_sh;
    case StopZHP.sam: return stop_h_samarytanka_sh;
    case StopZHP.HOd: return stop_h_ho_sh;
    case StopZHP.HOc: return stop_h_ho_sh;
    case StopZHP.HRd: return stop_h_hr_sh;
    case StopZHP.HRc: return stop_h_hr_sh;
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
