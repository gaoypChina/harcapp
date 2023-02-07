enum MarkerVisibility{
  PUBLIC,
  LOGGED_IN_ONLY,
  VERIFIED_ONLY,

  COMMUNITY_CIRCLE_MEMBERS_ONLY,
  ERROR,
}

List<MarkerVisibility> get allUsableMarkerVisbility{
  List<MarkerVisibility> all = List.of(MarkerVisibility.values);
  all.remove(MarkerVisibility.ERROR);
  return all;
}

String markerVisibilityToStr(MarkerVisibility visibility){

  switch(visibility){

    case MarkerVisibility.PUBLIC: return 'PUBLIC';
    case MarkerVisibility.LOGGED_IN_ONLY: return 'LOGGED_IN_ONLY';
    case MarkerVisibility.VERIFIED_ONLY: return 'VERIFIED_ONLY';
    case MarkerVisibility.COMMUNITY_CIRCLE_MEMBERS_ONLY: return 'COMMUNITY_CIRCLE_MEMBERS_ONLY';
    case MarkerVisibility.ERROR: return 'ERROR';
  }

}

Map<String, MarkerVisibility> strToMarkerVisibility = {
  'PUBLIC': MarkerVisibility.PUBLIC,
  'LOGGED_IN_ONLY': MarkerVisibility.LOGGED_IN_ONLY,
  'VERIFIED_ONLY': MarkerVisibility.VERIFIED_ONLY,
  'COMMUNITY_CIRCLE_MEMBERS_ONLY': MarkerVisibility.COMMUNITY_CIRCLE_MEMBERS_ONLY,
};

String markerVisibilityToName(MarkerVisibility markerVisibility){

  switch(markerVisibility) {
    case MarkerVisibility.PUBLIC:
      return 'Publiczne';
    case MarkerVisibility.LOGGED_IN_ONLY:
      return 'Tylko dla zalogowanych';
    case MarkerVisibility.VERIFIED_ONLY:
      return 'Tylko dla zweryfikowanych';
    case MarkerVisibility.COMMUNITY_CIRCLE_MEMBERS_ONLY:
      return 'Tylko dla członków kręgów';
    case MarkerVisibility.ERROR:
      return 'Błąd';
  }

}
