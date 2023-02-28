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
    dekalogApelEwansSuffix: 'I\nPrzykazanie'
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
      dekalogApelEwansSuffix: 'II\nPrzykazanie'
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
      dekalogApelEwansSuffix: 'III\nPrzykazanie'
    },
    subgroupTitle: {
      dekalogApelEwansSuffix: 'Pamiętaj, abyś dzień święty święcił'
    }
);

ApelEwan ef_6_1_4 = const ApelEwan(
    dirName: 'Ef_6_1-4',
    siglum: 'Ef 6, 1-4',
    subgroupShortTitle: {
      dekalogApelEwansSuffix: 'IV\nPrzykazanie'
    },
    subgroupTitle: {
      dekalogApelEwansSuffix: 'Czcij ojca swego i matkę swoją'
    }
);

ApelEwan mt_5_21_26 = const ApelEwan(
    dirName: 'Mt_5_21-26',
    siglum: 'Mt 5, 21-26',
    subgroupShortTitle: {
      dekalogApelEwansSuffix: 'V\nPrzykazanie'
    },
    subgroupTitle: {
      dekalogApelEwansSuffix: 'Nie zabijaj'
    }
);

ApelEwan mt_5_27_32 = const ApelEwan(
    dirName: 'Mt_5_27-32',
    siglum: 'Mt 5, 27-32',
    subgroupShortTitle: {
      dekalogApelEwansSuffix: 'VI\nPrzykazanie'
    },
    subgroupTitle: {
      dekalogApelEwansSuffix: 'Nie cudzołóż'
    }
);

ApelEwan ii_tes_3_10_12 = const ApelEwan(
    dirName: '2_Tes_3_10-12',
    siglum: '2 Tes 3, 10-12',
    subgroupShortTitle: {
      dekalogApelEwansSuffix: 'VII\nPrzykazanie'
    },
    subgroupTitle: {
      dekalogApelEwansSuffix: 'Nie kradnij'
    }
);

ApelEwan mt_5_33_37 = const ApelEwan(
    dirName: 'Mt_5_33-37',
    siglum: 'Mt 5, 33-37',
    subgroupShortTitle: {
      dekalogApelEwansSuffix: 'VIII\nPrzykazanie'
    },
    subgroupTitle: {
      dekalogApelEwansSuffix: 'Nie mów fałszywego świadectwa przeciw bliźniemu swemu'
    }
);

ApelEwan rz_8_5_13 = const ApelEwan(
    dirName: 'Rz_8_5-13',
    siglum: 'Rz 8, 5-13',
    subgroupShortTitle: {
      dekalogApelEwansSuffix: 'IX\nPrzykazanie'
    },
    subgroupTitle: {
      dekalogApelEwansSuffix: 'Nie pożądaj żony bliźniego swego'
    }
);

ApelEwan koh_5_9 = const ApelEwan(
    dirName: 'Koh_5_9',
    siglum: 'Koh 8, 9',
    subgroupShortTitle: {
      dekalogApelEwansSuffix: 'X\nPrzykazanie'
    },
    subgroupTitle: {
      dekalogApelEwansSuffix: 'Ani żadnej rzeczy, która jego jest'
    }
);

ApelEwanPersistentFolder dekalogFolder = ApelEwanPersistentFolder(
    id: '__dekalog__',
    apelEwans: [
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
    ],
    apelEwanNotes: {},
    name: 'Dekalog',
    colorsKey: CommonColorData.omegaColorsKey,
    iconKey: 'textBoxMultiple'
);

Map<String, ApelEwan> allApelEwanMap = {for (ApelEwan apelEwan in allApelEwans) apelEwan.siglum: apelEwan};

List<ApelEwan> allApelEwans = [

  const ApelEwan(
      dirName: 'Mt_1_18-24',
      siglum: 'Mt 1, 18-24',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Narodzenie Jezusa'
      }
  ),

  const ApelEwan(
      dirName: 'Mt_4_18-22',
      siglum: 'Mt 4, 18-22',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Powołanie pierwszych uczniów'
      }
  ),

  const ApelEwan(
      dirName: 'Mt_5_13-16',
      siglum: 'Mt 5, 13-16',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Jesteście solą ziemi'
      }
  ),

  const ApelEwan(
      dirName: 'Mt_5_17-19',
      siglum: 'Mt 5, 17-19',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Jezus a Prawo'
      }
  ),

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
      dirName: 'Mt_13_44-52',
      siglum: 'Mt 13, 44-52',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Przypowieść o skarbie i perle'
      }
  ),

  const ApelEwan(
      dirName: 'Mk_6_1-6',
      siglum: 'Mk 6, 1-6',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Jezus w Nazarecie'
      }
  ),

  const ApelEwan(
      dirName: 'Mk_8_1-10',
      siglum: 'Mk 8, 1-10',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Drugie rozmnożenie chleba'
      }
  ),

  const ApelEwan(
      dirName: 'Mk_10_13-16',
      siglum: 'Mk 10, 13-16',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Jezus błogosławi dzieci'
      }
  ),

  const ApelEwan(
      dirName: 'Mk_10_35-45',
      siglum: 'Mk 10, 35-45',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Przełożeństwo służbą'
      }
  ),

  const ApelEwan(
      dirName: 'Mk_11_25-30',
      siglum: 'Mk 11, 25-30',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Wiara i modlitwa'
      }
  ),

  const ApelEwan(
      dirName: 'Mk_12_38-44',
      siglum: 'Mk 12, 38-44',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Wdowi grosz'
      }
  ),

  const ApelEwan(
      dirName: 'Mk_13_24-32',
      siglum: 'Mk 13, 24-32',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Przyjście Chrystusa'
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
      dirName: 'Lk_3_1-6',
      siglum: 'Łk 3, 1-6',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Jan Chrzciciel',
      }
  ),

  const ApelEwan(
      dirName: 'Lk_3_10-18',
      siglum: 'Łk 3, 10-18',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Wskazania i świadectwo o Mesjaszu',
      }
  ),

  const ApelEwan(
      dirName: 'Lk_4_1-13',
      siglum: 'Łk 4, 1-13',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Kuszenie na pustyni',
      }
  ),

  const ApelEwan(
      dirName: 'Lk_5_1-11',
      siglum: 'Łk 5, 1-11',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Nauczanie z łodzi',
      }
  ),

  const ApelEwan(
      dirName: 'Lk_6_39-45',
      siglum: 'Łk 6, 39-45',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Drzewo i owoce',
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
      dirName: 'Lk_13_1-9',
      siglum: 'Łk 13, 1-9',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Nieurodzajne drzewo figowe',
      }
  ),

  const ApelEwan(
    dirName: 'Lk_15_1-10',
    siglum: 'Łk 15, 1-10',
    subgroupTitle: {
      ogolneApelEwansSuffix: 'Zagubiona owca'
    }
  ),

  const ApelEwan(
      dirName: 'Lk_15_11-32',
      siglum: 'Łk 15, 11-32',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Syn marnotrawny'
      }
  ),

  const ApelEwan(
      dirName: 'Lk_16_9-15',
      siglum: 'Łk 16, 9-15',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Dobry użytek z pieniądza'
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
      dirName: 'Lk_18_35-43',
      siglum: 'Łk 18, 35-43',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Niewidomy pod Jerychem'
      }
  ),

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
    subgroupShortTitle: {
      ogolneApelEwansSuffix: 'Zmartwych-\nwstanie',
    },
    subgroupTitle: {
      ogolneApelEwansSuffix: 'Zmartwychwstanie',
    }
  ),

  const ApelEwan(
      dirName: 'Lk_21_25-36',
      siglum: 'Łk 21, 25-36',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Przyjście Syna Człowieczego'
      }
  ),

  const ApelEwan(
      dirName: 'Lk_23_35-43',
      siglum: 'Łk 23, 35-43',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Dwóch łotrów'
      }
  ),

  const ApelEwan(
      dirName: 'J_3_22-30',
      siglum: 'J 3, 22-30',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Jezus i Jan Chrzciciel',
      }
  ),

  const ApelEwan(
      dirName: 'J_6_55-69',
      siglum: 'J 6, 55-69',
      subgroupShortTitle: {
        ogolneApelEwansSuffix: 'Mowa eucharysty-\nczna',
      },
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Mowa eucharystyczna',
      }
  ),

  const ApelEwan(
      dirName: 'J_7_37-39',
      siglum: 'J 7, 37-39',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Źródło wody żywej',
      }
  ),

  const ApelEwan(
      dirName: 'J_8_1-11',
      siglum: 'J 8, 1-11',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Kobieta cudzołożna',
      }
  ),

  const ApelEwan(
      dirName: 'J_10_27-30',
      siglum: 'J 10, 27-30',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Ja i ojciec jedno jesteśmy',
      }
  ),

  const ApelEwan(
      dirName: 'J_13_31-35',
      siglum: 'J 13, 31-35',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Miłujcie się wzajemnie',
      }
  ),

  const ApelEwan(
      dirName: 'J_14_23-29',
      siglum: 'J 14, 23-29',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Miłość objawiona',
      }
  ),

  const ApelEwan(
      dirName: 'J_15_1-8',
      siglum: 'J 15, 1-8',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Zjednoczenie z Chrystusem',
      }
  ),

  const ApelEwan(
      dirName: 'J_16_12-15',
      siglum: 'J 16, 12-15',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Sąd Ducha Świętego',
      }
  ),

  const ApelEwan(
      dirName: 'J_18_33b-37',
      siglum: 'J 18, 33b-37',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Jezus przed Piłatem',
      }
  ),

  const ApelEwan(
      dirName: 'J_20_19-31',
      siglum: 'J 20, 19-31',
      subgroupTitle: {
        ogolneApelEwansSuffix: 'Zmartwychwstały ukazuje się Apostołom',
      }
  ),

  wj_3_13_15,
  wj_20_8_11,
  ef_6_1_4,
  ii_tes_3_10_12,
  rz_8_5_13,
  koh_5_9
];

ApelEwanPersistentFolder omegaFolder = ApelEwanPersistentFolder(
    id: '__omega__',
    apelEwans: allApelEwans,
    apelEwanNotes: {},
    name: 'Wszystkie',
    colorsKey: CommonColorData.defColorsKey,
    iconKey: 'bookCross'
);