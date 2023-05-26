import 'dart:convert';

import 'common.dart';

class Okrzyk{

  static const String SEPARATOR = '~';

  final String title;
  final List<SoundElement> soundElements;
  final bool official;

  const Okrzyk(this.title, this.soundElements, {this.official = true});

  static Okrzyk decode(String code, bool official){

    List<SoundElement> soundElements = [];
    List<String> elements = code.split(SEPARATOR);
    for(int i=1; i<elements.length; i++)
      soundElements.add(SoundElement.decode(elements[i]));

    return Okrzyk(elements[0], soundElements, official: official);
  }

  static Okrzyk from(String codeBase64){
    String code = const Utf8Decoder().convert(const Base64Codec().decode(codeBase64).toList());
    return Okrzyk.decode(code, false);
  }

  String encode(){
    return const Base64Codec().encode(const Utf8Encoder().convert(toString()).toList());
  }

  @override
  String toString() {
    String result = title;
    for(SoundElement element in soundElements)
      result += SEPARATOR + element.toString();

    return result;
  }
}