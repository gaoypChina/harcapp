enum RankHarc{
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

String rankHarcToParam(RankHarc rankHarc){
  switch(rankHarc){
    case RankHarc.dhd: return 'Dhd';
    case RankHarc.dhc: return 'Dhc';
    case RankHarc.zhpMlodzik: return 'ZhpMlodzik';
    case RankHarc.zhpOchotniczka: return 'ZhpOchotniczka';
    case RankHarc.zhpWywiadowca: return 'ZhpWywiadowca';
    case RankHarc.zhpTropicielka: return 'ZhpTropicielka';
    case RankHarc.zhpOdkrywca: return 'ZhpOdkrywca';
    case RankHarc.zhpPionierka: return 'ZhpPionierka';

    case RankHarc.zhpCwik: return 'ZhpCwik';
    case RankHarc.zhpSamarytanka: return 'ZhpSamarytanka';
    case RankHarc.zhpHOc: return 'ZhpHOc';
    case RankHarc.zhpHOd: return 'ZhpHOd';
    case RankHarc.zhpHRc: return 'ZhpHRc';
    case RankHarc.zhpHRd: return 'ZhpHRd';

    case RankHarc.zhrMlodzik: return 'ZhrMlodzik';
    case RankHarc.zhrOchotniczka: return 'ZhrOchotniczka';
    case RankHarc.zhrWywiadowca: return 'ZhrWywiadowca';
    case RankHarc.zhrTropicielka: return 'ZhrTropicielka';
    case RankHarc.zhrCwik: return 'ZhrCwik';
    case RankHarc.zhrSamarytanka: return 'ZhrSamarytanka';
    case RankHarc.zhrHOc: return 'ZhrHOc';
    case RankHarc.zhrWedrowniczka: return 'ZhrWedrowniczka';
    case RankHarc.zhrHRc: return 'ZhrHRc';
    case RankHarc.zhrHRd: return 'ZhrHRd';
  }
}

Map<String, RankHarc> paramToRankHarc = {
  'Dhd': RankHarc.dhd,
  'Dhc': RankHarc.dhc,
  'ZhpMlodzik': RankHarc.zhpMlodzik,
  'ZhpOchotniczka': RankHarc.zhpOchotniczka,
  'ZhpWywiadowca': RankHarc.zhpWywiadowca,
  'ZhpTropicielka': RankHarc.zhpTropicielka,
  'ZhpOdkrywca': RankHarc.zhpOdkrywca,
  'ZhpPionierka': RankHarc.zhpPionierka,

  'ZhpCwik': RankHarc.zhpCwik,
  'ZhpSamarytanka': RankHarc.zhpSamarytanka,
  'ZhpHOc': RankHarc.zhpHOc,
  'ZhpHOd': RankHarc.zhpHOd,
  'ZhpHRc': RankHarc.zhpHRc,
  'ZhpHRd': RankHarc.zhpHRd,

  'ZhrMlodzik': RankHarc.zhrMlodzik,
  'ZhrOchotniczka': RankHarc.zhrOchotniczka,
  'ZhrWywiadowca': RankHarc.zhrWywiadowca,
  'ZhrTropicielka': RankHarc.zhrTropicielka,
  'ZhrCwik': RankHarc.zhrCwik,
  'ZhrSamarytanka': RankHarc.zhrSamarytanka,
  'ZhrHOc': RankHarc.zhrHOc,
  'ZhrWedrowniczka': RankHarc.zhrWedrowniczka,
  'ZhrHRc': RankHarc.zhrHRc,
  'ZhrHRd': RankHarc.zhrHRd,
};

String rankHarcToStr(RankHarc rankHarc){
  switch(rankHarc){
    case RankHarc.dhd: return 'dhd';
    case RankHarc.dhc: return 'dhc';
    case RankHarc.zhpMlodzik: return 'zhpMlodzik';
    case RankHarc.zhpOchotniczka: return 'zhpOchotniczka';
    case RankHarc.zhpWywiadowca: return 'zhpWywiadowca';
    case RankHarc.zhpTropicielka: return 'zhpTropicielka';
    case RankHarc.zhpOdkrywca: return 'zhpOdkrywca';
    case RankHarc.zhpPionierka: return 'zhpPionierka';
    
    case RankHarc.zhpCwik: return 'zhpCwik';
    case RankHarc.zhpSamarytanka: return 'zhpSamarytanka';
    case RankHarc.zhpHOc: return 'zhpHOc';
    case RankHarc.zhpHOd: return 'zhpHOd';
    case RankHarc.zhpHRc: return 'zhpHRc';
    case RankHarc.zhpHRd: return 'zhpHRd';
    
    case RankHarc.zhrMlodzik: return 'zhrMlodzik';
    case RankHarc.zhrOchotniczka: return 'zhrOchotniczka';
    case RankHarc.zhrWywiadowca: return 'zhrWywiadowca';
    case RankHarc.zhrTropicielka: return 'zhrTropicielka';
    case RankHarc.zhrCwik: return 'zhrCwik';
    case RankHarc.zhrSamarytanka: return 'zhrSamarytanka';
    case RankHarc.zhrHOc: return 'zhrHOc';
    case RankHarc.zhrWedrowniczka: return 'zhrWedrowniczka';
    case RankHarc.zhrHRc: return 'zhrHRc';
    case RankHarc.zhrHRd: return 'zhrHRd';
  }
}

Map<String, RankHarc> strToRankHarc = {
  'dhd': RankHarc.dhd,
  'dhc': RankHarc.dhc,
  'zhpMlodzik': RankHarc.zhpMlodzik,
  'zhpOchotniczka': RankHarc.zhpOchotniczka,
  'zhpWywiadowca': RankHarc.zhpWywiadowca,
  'zhpTropicielka': RankHarc.zhpTropicielka,
  'zhpOdkrywca': RankHarc.zhpOdkrywca,
  'zhpPionierka': RankHarc.zhpPionierka,

  'zhpCwik': RankHarc.zhpCwik,
  'zhpSamarytanka': RankHarc.zhpSamarytanka,
  'zhpHOc': RankHarc.zhpHOc,
  'zhpHOd': RankHarc.zhpHOd,
  'zhpHRc': RankHarc.zhpHRc,
  'zhpHRd': RankHarc.zhpHRd,

  'zhrMlodzik': RankHarc.zhrMlodzik,
  'zhrOchotniczka': RankHarc.zhrOchotniczka,
  'zhrWywiadowca': RankHarc.zhrWywiadowca,
  'zhrTropicielka': RankHarc.zhrTropicielka,
  'zhrCwik': RankHarc.zhrCwik,
  'zhrSamarytanka': RankHarc.zhrSamarytanka,
  'zhrHOc': RankHarc.zhrHOc,
  'zhrWedrowniczka': RankHarc.zhrWedrowniczka,
  'zhrHRc': RankHarc.zhrHRc,
  'zhrHRd': RankHarc.zhrHRd,
};

const String rankZhpDhD = 'Druhna';
const String rankZhpDhDShort = 'dh.';
const String rankZhpDhC = 'Druh';
const String rankZhpDhCShort = 'dh';

const String rankZhpMlodzik = 'Młodzik';
const String rankZhpMlodzikShort = 'mł.';
const String rankZhpOchotniczka = 'Ochotniczka';
const String rankZhpOchotniczkaShort = 'och.';

const String rankZhpWywiadowca = 'Wywiadowca';
const String rankZhpWywiadowcaShort = 'wyw.';
const String rankZhpTropicielka = 'Tropicielka';
const String rankZhpTropicielkaShort = 'trop.';

const String rankZhpOdkrywca = 'Odkrywca';
const String rankZhpOdkrywcaShort = 'odk.';
const String rankZhpPionierka = 'Pionierka';
const String rankZhpPionierkaShort = 'pion.';

const String rankZhpCwik = 'Ćwik';
const String rankZhpCwikShort = 'ćw.';
const String rankZhpSamarytanka = 'Samarytanka';
const String rankZhpSamarytankaShort = 'sam.';

const String rankZhpHoC = 'Harcerz Orli';
const String rankZhpHoD = 'Harcerka Orla';
const String rankZhpHoShort = 'HO';

const String rankZhpHrC = 'Harcerz Rzeczypospolitej';
const String rankZhpHrD = 'Harcerka Rzeczypospolitej';
const String rankZhpHrShort = 'HR';

const String rankZhrMlodzik = 'Młodzik';
const String rankZhrMlodzikShort = 'mł.';
const String rankZhrOchotniczka = 'Ochotniczka';
const String rankZhrOchotniczkaShort = 'och.';

const String rankZhrWywiadowca = 'Wywiadowca';
const String rankZhrWywiadowcaShort = 'wyw.';
const String rankZhrTropicielka = 'Tropicielka';
const String rankZhrTropicielkaShort = 'trop.';

const String rankZhrCwik = 'Ćwik';
const String stopZhrCwikShort = 'ćw.';
const String rankZhrSamarytanka = 'Samarytanka';
const String rankZhrSamarytankaShort = 'sam.';

const String rankZhrHoC = 'Harcerz Orli';
const String rankZhrHoShort = 'HO';
const String rankZhrWedrowniczka = 'Wędrowniczka';
const String rankZhrWedrowniczkaShort = 'wędr.';

const String rankZhrHrC = 'Harcerz Rzeczypospolitej';
const String rankZhrHrD = 'Harcerka Rzeczypospolitej';
const String rankZhrHrShort = 'HR';

String rankHarcFullName(RankHarc stop, {bool withOrg = false}){
  switch(stop){
    case RankHarc.dhd: return rankZhpDhD + (withOrg?' (ZHP)':'');
    case RankHarc.dhc: return rankZhpDhC + (withOrg?' (ZHP)':'');
    case RankHarc.zhpMlodzik: return rankZhpMlodzik + (withOrg?' (ZHP)':'');
    case RankHarc.zhpOchotniczka: return rankZhpOchotniczka + (withOrg?' (ZHP)':'');
    case RankHarc.zhpWywiadowca: return rankZhpWywiadowca + (withOrg?' (ZHP)':'');
    case RankHarc.zhpTropicielka: return rankZhpTropicielka + (withOrg?' (ZHP)':'');
    case RankHarc.zhpOdkrywca: return rankZhpOdkrywca + (withOrg?' (ZHP)':'');
    case RankHarc.zhpPionierka: return rankZhpPionierka + (withOrg?' (ZHP)':'');
    case RankHarc.zhpCwik: return rankZhpCwik + (withOrg?' (ZHP)':'');
    case RankHarc.zhpSamarytanka: return rankZhpSamarytanka + (withOrg?' (ZHP)':'');
    case RankHarc.zhpHOd: return rankZhpHoD + (withOrg?' (ZHP)':'');
    case RankHarc.zhpHOc: return rankZhpHoC + (withOrg?' (ZHP)':'');
    case RankHarc.zhpHRd: return rankZhpHrD + (withOrg?' (ZHP)':'');
    case RankHarc.zhpHRc: return rankZhpHrC + (withOrg?' (ZHP)':'');

    case RankHarc.zhrMlodzik: return rankZhrMlodzik + (withOrg?' (ZHR)':'');
    case RankHarc.zhrOchotniczka: return rankZhrOchotniczka + (withOrg?' (ZHR)':'');
    case RankHarc.zhrWywiadowca: return rankZhrWywiadowca + (withOrg?' (ZHR)':'');
    case RankHarc.zhrTropicielka: return rankZhrTropicielka + (withOrg?' (ZHR)':'');
    case RankHarc.zhrCwik: return rankZhrCwik + (withOrg?' (ZHR)':'');
    case RankHarc.zhrSamarytanka: return rankZhrSamarytanka + (withOrg?' (ZHR)':'');
    case RankHarc.zhrHOc: return rankZhrHoC + (withOrg?' (ZHR)':'');
    case RankHarc.zhrWedrowniczka: return rankZhrWedrowniczka + (withOrg?' (ZHR)':'');
    case RankHarc.zhrHRc: return rankZhrHrC + (withOrg?' (ZHR)':'');
    case RankHarc.zhrHRd: return rankZhrHrD + (withOrg?' (ZHR)':'');
  }
}

String rankHarcShortName(RankHarc? stop){
  switch(stop){
    case RankHarc.dhd: return rankZhpDhDShort;
    case RankHarc.dhc: return rankZhpDhCShort;
    case RankHarc.zhpMlodzik: return rankZhpMlodzikShort;
    case RankHarc.zhpOchotniczka: return rankZhpOchotniczkaShort;
    case RankHarc.zhpWywiadowca: return rankZhpWywiadowcaShort;
    case RankHarc.zhpTropicielka: return rankZhpTropicielkaShort;
    case RankHarc.zhpOdkrywca: return rankZhpOdkrywcaShort;
    case RankHarc.zhpPionierka: return rankZhpPionierkaShort;
    case RankHarc.zhpCwik: return rankZhpCwikShort;
    case RankHarc.zhpSamarytanka: return rankZhpSamarytankaShort;
    case RankHarc.zhpHOd: return rankZhpHoShort;
    case RankHarc.zhpHOc: return rankZhpHoShort;
    case RankHarc.zhpHRd: return rankZhpHrShort;
    case RankHarc.zhpHRc: return rankZhpHrShort;

    case RankHarc.zhrMlodzik: return rankZhrMlodzikShort;
    case RankHarc.zhrOchotniczka: return rankZhrOchotniczkaShort;
    case RankHarc.zhrWywiadowca: return rankZhrWywiadowcaShort;
    case RankHarc.zhrTropicielka: return rankZhrTropicielkaShort;
    case RankHarc.zhrCwik: return stopZhrCwikShort;
    case RankHarc.zhrSamarytanka: return rankZhrSamarytankaShort;
    case RankHarc.zhrHOc: return rankZhrHoShort;
    case RankHarc.zhrWedrowniczka: return rankZhrWedrowniczkaShort;
    case RankHarc.zhrHRc: return rankZhrHrShort;
    case RankHarc.zhrHRd: return rankZhrHrShort;
    case null: return '';
  }
}
