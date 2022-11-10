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

List<CommunityCategory> allCommunityCategories = [
  CommunityCategory.gromada,
  CommunityCategory.gromadaZuchowaZHP,
  CommunityCategory.gromadaZuchowZHR,
  CommunityCategory.gromadaZuchenekZHR,

  CommunityCategory.radaGromady,
  CommunityCategory.szostka,

  CommunityCategory.druzyna,
  CommunityCategory.druzynaHarcerskaZHP,
  CommunityCategory.druzynaHarcerzyStarszychZHP,
  CommunityCategory.druzynaWedrowniczaZHP,
  CommunityCategory.druzynaHarcerzyZHR,
  CommunityCategory.druzynaHarcerekZHR,
  CommunityCategory.druzynaWedrownikowZHR,
  CommunityCategory.druzynaWedrowniczekZHR,

  CommunityCategory.radaDruzyny,
  CommunityCategory.zastep,
  CommunityCategory.patrol,

  CommunityCategory.szczep,
  CommunityCategory.radaSzczepu,
  CommunityCategory.komisjaStopniHarcerskich,

  CommunityCategory.zwiazekDruzyn,
  CommunityCategory.radaZwiazkuDruzyn,

  CommunityCategory.hufiec,
  CommunityCategory.komendaHufca,
  CommunityCategory.namiestnictwo,
  CommunityCategory.komisjaStopniInstruktorskich,
  CommunityCategory.toIOwo
];

const Map<CommunityCategory, String> commCatToName = {
  CommunityCategory.error: 'Błąd!',

  CommunityCategory.gromada: 'Gromada',
  CommunityCategory.gromadaZuchowaZHP: 'Gromada zuchowa ZHP',
  CommunityCategory.gromadaZuchowZHR: 'Gromada zuchów ZHR',
  CommunityCategory.gromadaZuchenekZHR: 'Gromada zuchenek ZHR',

  CommunityCategory.radaGromady: 'Rada Gromady',
  CommunityCategory.szostka: 'Szóstka',

  CommunityCategory.druzyna: 'Drużyna',
  CommunityCategory.druzynaHarcerskaZHP: 'Drużyna harcerska ZHP',
  CommunityCategory.druzynaHarcerzyStarszychZHP: 'Drużyna harcerzy starszych ZHP',
  CommunityCategory.druzynaWedrowniczaZHP: 'Drużyna harcerzy wędrownicza ZHP',
  CommunityCategory.druzynaHarcerzyZHR: 'Drużyna harcerzy ZHR',
  CommunityCategory.druzynaHarcerekZHR: 'Drużyna harcerek ZHR',
  CommunityCategory.druzynaWedrownikowZHR: 'Drużyna wedrownikow ZHR',
  CommunityCategory.druzynaWedrowniczekZHR: 'Drużyna wedrownikow ZHR',

  CommunityCategory.radaDruzyny: 'Rada Drużyny',
  CommunityCategory.zastep: 'Zastęp',
  CommunityCategory.patrol: 'Patrol',

  CommunityCategory.szczep: 'Szczep',
  CommunityCategory.radaSzczepu: 'Rada Szczepu',
  CommunityCategory.komisjaStopniHarcerskich: 'Komisja Stopni Harcerskich',

  CommunityCategory.zwiazekDruzyn: 'Związek Drużyn',
  CommunityCategory.radaZwiazkuDruzyn: 'Rada Związku Drużyn',

  CommunityCategory.hufiec: 'Hufiec',
  CommunityCategory.komendaHufca: 'Komenda Hufca',
  CommunityCategory.namiestnictwo: 'Namiestnictwo',
  CommunityCategory.komisjaStopniInstruktorskich: 'Komisja Stopni Instruktorskich',
  CommunityCategory.toIOwo: 'To i owo',
};

const Map<CommunityCategory, String> commCatToString = {
  CommunityCategory.error: 'err',

  CommunityCategory.gromada: 'gromada',
  CommunityCategory.radaGromady: 'radaGromady',
  CommunityCategory.szostka: 'szostka',

  CommunityCategory.druzyna: 'druzyna',
  CommunityCategory.radaDruzyny: 'radaDruzyny',
  CommunityCategory.zastep: 'zastep',
  CommunityCategory.patrol: 'patrol',

  CommunityCategory.szczep: 'szczep',
  CommunityCategory.radaSzczepu: 'radaSzczepu',
  CommunityCategory.komisjaStopniHarcerskich: 'komisjaStopniHarcerskich',

  CommunityCategory.zwiazekDruzyn: 'zwiazekDruzyn',
  CommunityCategory.radaZwiazkuDruzyn: 'radaZwiazkuDruzyn',

  CommunityCategory.hufiec: 'hufiec',
  CommunityCategory.komendaHufca: 'komendaHufca',
  CommunityCategory.namiestnictwo: 'namiestnictwo',
  CommunityCategory.komisjaStopniInstruktorskich: 'komisjaStopniInstruktorskich',
  CommunityCategory.toIOwo: 'toIOwo',
};

const Map<String, CommunityCategory> strToCommCat = {
  'gromada': CommunityCategory.gromada,
  'radaGromady': CommunityCategory.radaGromady,
  'szostka': CommunityCategory.szostka,

  'druzyna': CommunityCategory.druzyna,
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