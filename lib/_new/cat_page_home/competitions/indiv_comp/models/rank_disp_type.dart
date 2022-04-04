
enum RankDispType{
  EXACT,
  RANGE,
  RANGE_PERC
}

Map<RankDispType, String> rankDispTypeToStr = {
  RankDispType.EXACT: 'EXACT',
  RankDispType.RANGE: 'RANGE',
  RankDispType.RANGE_PERC: 'RANGE_PERC',
};

Map<String, RankDispType> strToRankDispType = {
  'EXACT': RankDispType.EXACT,
  'RANGE': RankDispType.RANGE,
  'RANGE_PERC': RankDispType.RANGE_PERC,
};