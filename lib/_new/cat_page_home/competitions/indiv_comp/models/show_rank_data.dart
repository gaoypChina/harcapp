class ShowRankData{

  ShowSpecificRankData? specificData;
  ShowRangeRankData? rangeData;

  ShowRankData(this.specificData, this.rangeData);

  num get sortIndex{
    if(specificData == null)
      return rangeData?.rangeTop??0;
    else
      return specificData?.showRank??0;
  }
  
  static ShowRankData fromShowRank(int value) => ShowRankData(
    ShowSpecificRankData(value, 1),
    null
  );

  static ShowRankData fromRankRange(double top, double bottom) => ShowRankData(
      null,
      ShowRangeRankData(top, bottom)
  );

  static ShowRankData from(Map respMap) => ShowRankData(
      respMap['rank']==null?
      null:
      ShowSpecificRankData(respMap['rank'], respMap['rankPopularity']),

      respMap['rankRange']==null?
      null:
      ShowRangeRankData(respMap['rankRange'][0], respMap['rankRange'][1])
  );
}

class ShowSpecificRankData{

  int showRank;
  int popularity;

  ShowSpecificRankData(this.showRank, this.popularity);

}

class ShowRangeRankData{

  double rangeTop;
  double rangeBottom;

  ShowRangeRankData(this.rangeTop, this.rangeBottom);

}