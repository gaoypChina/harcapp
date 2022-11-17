enum MarkerType{
  ERROR,

  HARCOWKA,
  SZKOLA,
  KOSCIOL,
  SALA_PARAFIALNA,
  REMIZA,

  DUSZPASTERSTWO_AKADEMICKIE,

  SIEDZIBA_HUFCA_ZHP,
  SIEDZIBA_CHORAGWI_ZHP,
  SIEDZIBA_GLOWNEJ_KWATERY_ZHP,

  INNE,

}

List<MarkerType> get allUsableMarkerType{
  List<MarkerType> all = List.of(MarkerType.values);
  all.remove(MarkerType.ERROR);
  return all;
}

String markerTypeToStr(MarkerType type){

  switch(type){
    case MarkerType.HARCOWKA: return 'HARCOWKA';
    case MarkerType.SZKOLA: return 'SZKOLA';
    case MarkerType.KOSCIOL: return 'KOSCIOL';
    case MarkerType.SALA_PARAFIALNA: return 'SALA_PARAFIALNA';
    case MarkerType.REMIZA: return 'REMIZA';

    case MarkerType.DUSZPASTERSTWO_AKADEMICKIE: return 'DUSZPASTERSTWO_AKADEMICKIE';

    case MarkerType.SIEDZIBA_HUFCA_ZHP: return 'SIEDZIBA_HUFCA_ZHP';
    case MarkerType.SIEDZIBA_CHORAGWI_ZHP: return 'SIEDZIBA_CHORAGWI_ZHP';
    case MarkerType.SIEDZIBA_GLOWNEJ_KWATERY_ZHP: return 'SIEDZIBA_GLOWNEJ_KWATERY_ZHP';

    case MarkerType.INNE: return 'INNE';
    case MarkerType.ERROR: return 'ERROR';
  }

}

Map<String, MarkerType> strToMarkerType = {
  'HARCOWKA': MarkerType.HARCOWKA,
  'SZKOLA': MarkerType.SZKOLA,
  'KOSCIOL': MarkerType.KOSCIOL,
  'SALA_PARAFIALNA': MarkerType.SALA_PARAFIALNA,
  'REMIZA': MarkerType.REMIZA,

  'DUSZPASTERSTWO_AKADEMICKIE': MarkerType.DUSZPASTERSTWO_AKADEMICKIE,

  'SIEDZIBA_HUFCA_ZHP': MarkerType.SIEDZIBA_HUFCA_ZHP,
  'SIEDZIBA_CHORAGWI_ZHP': MarkerType.SIEDZIBA_CHORAGWI_ZHP,
  'SIEDZIBA_GLOWNEJ_KWATERY_ZHP': MarkerType.SIEDZIBA_GLOWNEJ_KWATERY_ZHP,

  'INNE': MarkerType.INNE,
};

String markerTypeToName(MarkerType markerType){

  switch(markerType) {
    case MarkerType.ERROR:
      return 'Błąd';

    case MarkerType.HARCOWKA:
      return 'Harcówka';
    case MarkerType.SZKOLA:
      return 'Szkoła';
    case MarkerType.KOSCIOL:
      return 'Kościół';
    case MarkerType.SALA_PARAFIALNA:
      return 'Sala parafialna';
    case MarkerType.REMIZA:
      return 'Remiza';

    case MarkerType.DUSZPASTERSTWO_AKADEMICKIE:
      return 'Duszpasterstwo akademickie';

    case MarkerType.SIEDZIBA_HUFCA_ZHP:
      return 'Siedziba hufca ZHP';
    case MarkerType.SIEDZIBA_CHORAGWI_ZHP:
      return 'Siedziba chorągwi ZHP';
    case MarkerType.SIEDZIBA_GLOWNEJ_KWATERY_ZHP:
      return 'Siedziba Głównej Kwatery ZHP';

    case MarkerType.INNE:
      return 'Inne';
  }

}

