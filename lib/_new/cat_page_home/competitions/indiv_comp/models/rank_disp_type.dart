
enum RankDispType{
  OMNI_EXACT,
  EXACT,
  RANGE,
  RANGE_PERC
}

Map<RankDispType, String> rankDispTypeToStr = {
  RankDispType.OMNI_EXACT: 'OMNI_EXACT',
  RankDispType.EXACT: 'EXACT',
  RankDispType.RANGE: 'RANGE',
  RankDispType.RANGE_PERC: 'RANGE_PERC',
};

Map<String, RankDispType> strToRankDispType = {
  'OMNI_EXACT': RankDispType.OMNI_EXACT,
  'EXACT': RankDispType.EXACT,
  'RANGE': RankDispType.RANGE,
  'RANGE_PERC': RankDispType.RANGE_PERC,
};