import 'package:harcapp/_common_classes/org/org.dart';

class DocumentData{
  final String titleShort;
  final String titleLong;
  final String description;
  final String assetPath;
  final Org org;

  const DocumentData(this.titleShort, this.titleLong, this.description, this.assetPath, this.org);
}

const List<DocumentData> ALL_DATA_DOKUMENTY = [
  DocumentData(
      'Statut ZHP',
      'Statut Związku Harcerstwa Polskiego',
      '22 września 2017 r.',
      'assets/documents/zhp_statut.pdf',
      Org.zhp
  ),
  DocumentData(
      'Statut ZHR',
      'Statut Związku Harcerstwa Rzeczypospolitej',
      '15 kwietnia 2018 r.',
      'assets/documents/zhr_statut_2018.pdf',
      Org.zhr_o
  ),

  DocumentData(
      'Książka sprawności',
      'Książka sprawwności (nowy system instrumentów metordycznych)',
      '25 stycznia 2021 r.',
      'assets/documents/zhp_sim_2022_sprawnosci.pdf',
      Org.zhp
  ),

  DocumentData(
      'Tropy Z',
      'Tropy Z (nowy system instrumentów metordycznych)',
      '25 stycznia 2021 r.',
      'assets/documents/zhp_sim_2022_tropy_z.pdf',
      Org.zhp
  ),

  DocumentData(
      'Tropy H',
      'Tropy H (nowy system instrumentów metordycznych)',
      '25 stycznia 2021 r.',
      'assets/documents/zhp_sim_2022_tropy_h.pdf',
      Org.zhp
  ),

  DocumentData(
      'Tropy HS',
      'Tropy HS (nowy system instrumentów metordycznych)',
      '25 stycznia 2021 r.',
      'assets/documents/zhp_sim_2022_tropy_hs.pdf',
      Org.zhp
  ),

  DocumentData(
      'Tropy W',
      'Tropy W (nowy system instrumentów metordycznych)',
      '25 stycznia 2021 r.',
      'assets/documents/zhp_sim_2022_tropy_w.pdf',
      Org.zhp
  ),

  DocumentData(
      'Wyzwania Z',
      'Wyzwania Z (nowy system instrumentów metordycznych)',
      '25 stycznia 2021 r.',
      'assets/documents/zhp_sim_2022_wyzwania_z.pdf',
      Org.zhp
  ),

  DocumentData(
      'Wyzwania H',
      'Wyzwania H (nowy system instrumentów metordycznych)',
      '25 stycznia 2021 r.',
      'assets/documents/zhp_sim_2022_wyzwania_h.pdf',
      Org.zhp
  ),

  DocumentData(
      'Wyzwania HS',
      'Wyzwania HS (nowy system instrumentów metordycznych)',
      '25 stycznia 2021 r.',
      'assets/documents/zhp_sim_2022_wyzwania_hs.pdf',
      Org.zhp
  ),

  DocumentData(
      'Wyzwania W',
      'Wyzwania W (nowy system instrumentów metordycznych)',
      '25 stycznia 2021 r.',
      'assets/documents/zhp_sim_2022_wyzwania_w.pdf',
      Org.zhp
  ),

  DocumentData(
      'Wzór rozkazu',
      'Wzrór rozkazu drużynowego ZHP',
      '',
      'assets/documents/zhp_wzor_rozkazu.pdf',
      Org.zhp
  ),
  DocumentData(
      'Regulamin mundurowy',
      'Regulamin mundurowy ZHP',
      '21 lutego 2017 r.',
      'assets/documents/zhp_regulamin_mundurowy.pdf',
      Org.zhp
  ),
  DocumentData(
      'Regulamin musztry',
      'Regulamin musztry i ceremoniału harcerskiego',
      '22 października 2019 r.',
      'assets/documents/zhp_regulamin_musztry.pdf',
      Org.zhp
  ),
  DocumentData(
      'System stopni instruktorskich',
      'System stopni instruktorskich ZHP',
      '2 października 2016 r.',
      'assets/documents/zhp_system_stopni_instruktorskich.pdf',
      Org.zhp
  ),
  DocumentData(
      'Instrukcja jednostek podstawowych',
      'Instrukcja tworzenia i działania gromady, drużyny, kręgu i klubu specjalnościowego',
      '20 sierpnia 2020 r.',
      'assets/documents/zhp_instrukcja_jednostek_podstawowych.pdf',
      Org.zhp
  ),
  DocumentData(
      'Instrukcja szczepu, związku drużyn',
      'Instrukcja tworzenia i działania szczepu i związku drużyn',
      '7 grudnia 2020 r.',
      'assets/documents/zhp_instrukcja_szczepu_zwiazku_druzyn.pdf',
      Org.zhp
  ),
  DocumentData(
      'Instrukcja hufca',
      'Instrukcja tworzenia i działania hufca ZHP',
      '25 czerwca 2020 r.',
      'assets/documents/zhp_instrukcja_hufca.pdf',
      Org.zhp
  ),
  DocumentData(
      'Instrukcja choragwi',
      'Instrukcja tworzenia i działania chorągwi ZHP',
      '20 czerwca 2017 r.',
      'assets/documents/zhp_instrukcja_choragwi.pdf',
      Org.zhp
  ),
  DocumentData(
      'Instrukcja HALiZ',
      'Instrukcja Harcerskiej Akcji Letniej i Zimowej',
      '6 grudnia 2020 r.',
      'assets/documents/zhp_instrukcja_haliz.pdf',
      Org.zhp
  ),
  DocumentData(
      'Instrukcja obozów i biwaków',
      'Instrukcja w sprawie organizacji obozów i biwaków',
      '25 marca 2016 r.',
      'assets/documents/zhr_instrukcja_obozow_biwakow.pdf',
      Org.zhr_o
  ),
  DocumentData(
      'Cele strategii ZHP',
      'Cele strategii ZHP na lata 2018-2025',
      '5 października 2017 r.',
      'assets/documents/zhp_strategia_2025_cele.pdf',
      Org.zhp
  ),
  DocumentData(
      'Ordynacja wyborcza ZHP',
      'Ordynacja wyborcza ZHP',
      '18 maja 2021 r.',
      'assets/documents/zhp_ordynacja_wyborcza.pdf',
      Org.zhp
  ),
  DocumentData(
      'Regulamin wyborczy ZHR',
      'Regulamin wyborczy ZHR',
      '10 marca 2016 r.',
      'assets/documents/zhr_regulamin_wyborczy.pdf',
      Org.zhr_o
  ),
  DocumentData(
      'Zasady wychowania harcerskiego w ZHR',
      'Podstawowe zasady wychowania harcerskiego w ZHR',
      '10 grudnia 2006 r.',
      'assets/documents/zhr_podst_zas_wych_harc.pdf',
      Org.zhr_o
  ),
  DocumentData(
      'Zasady wychowania religijnego w ZHR',
      'Zasady wychowania religijnego w ZHR',
      '20 czerwca 2009 r.',
      'assets/documents/zhr_zasady_wychowania_religijnego.pdf',
      Org.zhr_o
  ),
];