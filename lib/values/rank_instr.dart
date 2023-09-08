enum RankInstr{ pwd, phm, hm }

String rankInstrToParam(RankInstr rankInstr) {
  switch(rankInstr){
    case RankInstr.pwd: return 'Pwd';
    case RankInstr.phm: return 'Phm';
    case RankInstr.hm: return 'Hm';
  }
}

Map<String, RankInstr> paramToRankInstr = {
  'Pwd': RankInstr.pwd,
  'Phm': RankInstr.phm,
  'Hm': RankInstr.hm,
};

String rankInstrToStr(RankInstr rankInstr) {
  switch(rankInstr){
    case RankInstr.pwd: return 'pwd';
    case RankInstr.phm: return 'phm';
    case RankInstr.hm: return 'hm';
  }
}

Map<String, RankInstr> strToRankInstr = {
  'pwd': RankInstr.pwd,
  'phm': RankInstr.phm,
  'hm': RankInstr.hm,
};

String rankInstrToName(RankInstr rankInstr) {
  switch(rankInstr){
    case RankInstr.pwd: return 'Przewodnik';
    case RankInstr.phm: return 'Podharcmistrz';
    case RankInstr.hm: return 'Harcmistrz';
  }
}