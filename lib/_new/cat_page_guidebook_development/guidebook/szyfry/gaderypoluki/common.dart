String splitStringIntoPairs(String text){
  String result = '';

  for(int i=0; i<text.length; i += 2) {
    if(text.length <= i) break;
    result += text[i];

    if(text.length <= i+1) break;
    result += text[i+1];

    result += ' ';
  }

  return result;
}