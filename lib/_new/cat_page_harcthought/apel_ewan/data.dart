import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/apel_ewan.dart';

import 'apel_ewan_persistant_folder.dart';


const String ogolneApelEwansSuffix = 'ogolne';
const String ogolneApelEwansName = 'Ogólne';

const String dekalogApelEwansSuffix = 'dekalog';
const String dekalogApelEwansName = 'Dekalog';

Map<String, String> suffixNameMap = {
  ogolneApelEwansSuffix: ogolneApelEwansName,
  dekalogApelEwansSuffix: dekalogApelEwansName,
};

ApelEwan lk_18_9_14 = const ApelEwan(
  dirName: 'Lk_18_9-14',
  siglum: 'Łk 18, 9-14',
  subgroupShortTitle: {
    dekalogApelEwansSuffix: 'I Przykazanie'
  },
  subgroupTitle: {
    ogolneApelEwansSuffix: 'Faryzeusze i celnicy',
    dekalogApelEwansSuffix: 'Nie będziesz miał bogów cudzych przede mną'
  }
);

ApelEwan wj_3_13_15 = const ApelEwan(
    dirName: 'Wj_3_13-15',
    siglum: 'Wj 3, 13-15',
    subgroupShortTitle: {
      dekalogApelEwansSuffix: 'II Przykazanie'
    },
    subgroupTitle: {
      //ogolneApelEwansSuffix: - ',
      dekalogApelEwansSuffix: 'Nie będziesz wzywał imienia Boga twego nadaremno'
    }
);

ApelEwan wj_20_8_11 = const ApelEwan(
    dirName: 'Wj_20_8-11',
    siglum: 'Wj 20, 8-11',
    subgroupShortTitle: {
      dekalogApelEwansSuffix: 'III Przykazanie'
    },
    subgroupTitle: {
      dekalogApelEwansSuffix: 'Pamiętaj, abyś dzień święty święcił'
    }
);

ApelEwan ef_6_1_4 = const ApelEwan(
    dirName: 'Ef_6_1-4',
    siglum: 'Ef 6, 1-4',
    subgroupShortTitle: {
      dekalogApelEwansSuffix: 'IV Przykazanie'
    },
    subgroupTitle: {
      dekalogApelEwansSuffix: 'Czcij ojca swego i matkę swoją'
    }
);

ApelEwan mt_5_21_26 = const ApelEwan(
    dirName: 'Mt_5_21-26',
    siglum: 'Mt 5, 21-26',
    subgroupShortTitle: {
      dekalogApelEwansSuffix: 'V Przykazanie'
    },
    subgroupTitle: {
      dekalogApelEwansSuffix: 'Nie zabijaj'
    }
);

ApelEwan mt_5_27_32 = const ApelEwan(
    dirName: 'Mt_5_27-32',
    siglum: 'Mt 5, 27-32',
    subgroupShortTitle: {
      dekalogApelEwansSuffix: 'VI Przykazanie'
    },
    subgroupTitle: {
      dekalogApelEwansSuffix: 'Nie cudzołóż'
    }
);

ApelEwan ii_tes_3_10_12 = const ApelEwan(
    dirName: '2_Tes_3_10-12',
    siglum: '2 Tes 3, 10-12',
    subgroupShortTitle: {
      dekalogApelEwansSuffix: 'VII Przykazanie'
    },
    subgroupTitle: {
      dekalogApelEwansSuffix: 'Nie kradnij'
    }
);

ApelEwan mt_5_33_37 = const ApelEwan(
    dirName: 'Mt_5_33-37',
    siglum: 'Mt 5, 33-37',
    subgroupShortTitle: {
      dekalogApelEwansSuffix: 'VIII Przykazanie'
    },
    subgroupTitle: {
      dekalogApelEwansSuffix: 'Nie mów fałszywego świadectwa przeciw bliźniemu swemu'
    }
);

ApelEwan rz_8_5_13 = const ApelEwan(
    dirName: 'Rz_8_5-13',
    siglum: 'Rz 8, 5-13',
    subgroupShortTitle: {
      dekalogApelEwansSuffix: 'IX Przykazanie'
    },
    subgroupTitle: {
      dekalogApelEwansSuffix: 'Nie pożądaj żony bliźniego swego'
    }
);

ApelEwan koh_5_9 = const ApelEwan(
    dirName: 'Koh_5_9',
    siglum: 'Koh 8, 9',
    subgroupShortTitle: {
      dekalogApelEwansSuffix: 'X Przykazanie'
    },
    subgroupTitle: {
      dekalogApelEwansSuffix: 'Ani żadnej rzeczy, która jego jest'
    }
);

List<ApelEwan> dekalogApelEwans = [
  lk_18_9_14,
  wj_3_13_15,
  wj_20_8_11,
  ef_6_1_4,
  mt_5_21_26,
  mt_5_27_32,
  ii_tes_3_10_12,
  mt_5_33_37,
  rz_8_5_13,
  koh_5_9
];

ApelEwanPersistentFolder dekalogFolder = ApelEwanPersistentFolder(
    id: '__dekalog__',
    generalApelEwans: dekalogApelEwans,
    notedApelEwans: {},
    name: 'Dekalog',
    colorsKey: CommonColorData.OMEGA_COLORS_KEY,
    iconKey: 'textBoxMultiple'
);

Map<String, ApelEwan> allApelEwanMap = {for (ApelEwan apelEwan in allApelEwans) apelEwan.siglum: apelEwan};

List<ApelEwan> allApelEwans = [

  mt_5_21_26,

  mt_5_27_32,

  mt_5_33_37,

  const ApelEwan(
      dirName: 'Mt_6_24-34',
      siglum: 'Mt 6, 24-34',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Ufność Panu'
      }
  ),

  const ApelEwan(
      dirName: 'Lk_1_39-45',
      siglum: 'Łk 1, 39-45',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Nawiedzenie'
      }
  ),

  const ApelEwan(
    dirName: 'Lk_9_1-6',
    siglum: 'Łk 9, 1-6',
    subgroupTitle: {
      ogolneApelEwansSuffix: 'Rozesłanie Dwunastu'
    }
  ),

  const ApelEwan(
    dirName: 'Lk_9_28b-36',
    siglum: 'Łk 9, 28b-36',
    subgroupTitle: {
      ogolneApelEwansSuffix: 'Przemienienie Jezusa'
    }
  ),

  const ApelEwan(
    dirName: 'Lk_15_1-32',
    siglum: 'Łk 15, 1-32',
    subgroupTitle: {
      ogolneApelEwansSuffix: 'Miłosierny ojciec'
    }
  ),

  const ApelEwan(
    dirName: 'Lk_16_19-31',
    siglum: 'Łk 16, 19-31',
    subgroupTitle: {
      ogolneApelEwansSuffix: 'Żebrak i bogacz'
    }
  ),

  const ApelEwan(
    dirName: 'Lk_17_5-10',
    siglum: 'Łk 17, 5-10',
    subgroupTitle: {
      ogolneApelEwansSuffix: 'Pokorna służba'
    }
  ),

  const ApelEwan(
    dirName: 'Lk_17_11-19',
    siglum: 'Łk 17, 11-19',
    subgroupTitle: {
      ogolneApelEwansSuffix: 'Prośby'
    }
  ),

  const ApelEwan(
    dirName: 'Lk_18_1-8',
    siglum: 'Łk 18, 1-8',
    subgroupTitle: {
      ogolneApelEwansSuffix: 'Miłość Boga'
    }
  ),

  lk_18_9_14,

  const ApelEwan(
    dirName: 'Lk_19_1-10',
    siglum: 'Łk 19, 1-10',
    subgroupTitle: {
      ogolneApelEwansSuffix: 'Zacheusz',
    }
  ),

  const ApelEwan(
    dirName: 'Lk_20_27-38',
    siglum: 'Łk 20, 27-38',
    subgroupTitle: {
      ogolneApelEwansSuffix: 'Zmartwychwstanie',
    }
  ),

  wj_3_13_15,
  wj_20_8_11,
  ef_6_1_4,
  ii_tes_3_10_12,
  rz_8_5_13,
  koh_5_9
];
