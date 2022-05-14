
import 'package:harcapp/_new/cat_page_song_book/song_management/old/song_basic_data.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/old/song_element_old.dart';
import 'package:harcapp_core_own_song/common.dart';
import 'package:harcapp_core_own_song/song_raw.dart';
import 'package:harcapp_core_song/song_core.dart';
import 'package:harcapp_core_song/song_element.dart';

SongRaw parseOldCode(String fileName, String code, {bool official = true}){
  bool hasRefren;
  SongElementOld refrenElementOld;
  SongElement? refrenElement;
  bool hasChords = false;
  List<SongElementOld?> songElementOldList = [];
  List<SongElement?> songElements = [];

  try {

    SongBasicData1 basicData = SongBasicData1.parse(fileName, code, official: official);

    List<String> parts = code.split('<');

// REFREN
    if(parts[1].isNotEmpty) {
      hasRefren = true;
      refrenElementOld = SongElementOld.decodeOld(parts[1]);
      if(refrenElementOld.getChords()!.isNotEmpty) hasChords = true;

      refrenElement = SongElement.from(refrenElementOld.getText()!, refrenElementOld.getChords()!, true);

    }else
      hasRefren = false;

//ZWROTKI
    String? firstElementChords;
    for(int i=2; i<parts.length; i++)
    {
      if (parts[i].isEmpty) {

//null oznacza refren
        songElementOldList.add(null);
        songElements.add(refrenElement);
        continue;
      }

      List<String> zwrotka_elements = parts[i].split('>');
      if(firstElementChords==null)
        firstElementChords = zwrotka_elements[0];

      if (zwrotka_elements[0] == '1')
        zwrotka_elements[0] = firstElementChords;

      if(zwrotka_elements[0].replaceAll('\n', '').isNotEmpty)
        hasChords = true;

      SongElementOld songElementOld = SongElementOld.decodeOld(parts[i], firstElementChords: firstElementChords);
      songElementOldList.add(songElementOld);
      songElements.add(SongElement.from(songElementOld.getText()!, songElementOld.getChords()!, false));

    }

    List<String> hidTitles = [];

    return SongRaw(
      fileName: fileName,
      title: basicData.title,
      hidTitles: hidTitles,
      authors: [basicData.author],
      composers: [],
      performers: [basicData.performer],
      addPers: [AddPerson(name: basicData.moderator, emailRef: null, userKeyRef: null)],
      youtubeLink: basicData.youtubeLink,

      tags: basicData.tags,

      releaseDate: null,
      showRelDateDay: false,
      showRelDateMonth: false,

      hasRefren: hasRefren,
      refrenPart: refrenElement == null? SongPart.empty():SongPart.from(refrenElement),

      songParts: songElements.map((e) => SongPart.from(e!)).toList(),

    );

  } on Exception {
    throw Exception();
  }
}
