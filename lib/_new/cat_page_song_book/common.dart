import 'dart:convert';

import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';



class SongLoaderListener{

  final Function()? onStart;
  final Function(String fileName)? onSongLoadError;
  final Function()? onEnd;

  const SongLoaderListener({this.onStart, this.onSongLoadError, this.onEnd});

}

class SongLoaderInput{

  final ShaPref shaPref;
  final String allSongsCode;
  final String ownSongsCode;

  const SongLoaderInput(
      this.shaPref,
      this.allSongsCode,
      this.ownSongsCode
    );

}
class SongLoaderOutput{

  final List<Song> allSongs;
  final Map<String, Song> allSongsMap;

  final List<Song> allConfidSongs;
  final Map<String, Song> allConfidSongsMap;

  final List<Song> allOwnSongs;
  final Map<String, Song> allOwnSongsMap;

  const SongLoaderOutput(

      this.allSongs,
      this.allSongsMap,

      this.allConfidSongs,
      this.allConfidSongsMap,

      this.allOwnSongs,
      this.allOwnSongsMap,
    );

}

Map? decodeJson(String code){
  return jsonDecode(code);
}

Future<Map?> getSongMap(String lclId) async{

  if(lclId.length>3 && lclId.substring(0, 3) == 'o!_') {
    String? jsonCode = await readStringFromAssets('assets/songs/all_songs.hrcpsng');
    Map allSongsMap = jsonDecode(jsonCode!);
    return allSongsMap['official'][lclId]['song'];
  }else if(lclId.length > 4 && lclId.substring(0, 4) == 'oc!_') {
    String? jsonCode = await readStringFromAssets('assets/songs/all_songs.hrcpsng');
    Map allSongsMap = jsonDecode(jsonCode!);
    return allSongsMap['conf'][lclId]['song'];
  }else {
    Map ownSongsMap = jsonDecode(readFileAsStringOrNull(getOwnSongFilePath)??'{}');
    return ownSongsMap[lclId];
  }

}

compressSong(){

}

decompressSong(){

}

String getLineNums(String text){
  String lineNum = '';

  List<String> lines = text.split('\n');
  int count = 0;
  for (int i = 0; i < lines.length; i++)
    if (lines[i]
        .replaceAll(RegExp(r"\s+\b|\b\s"), '').isEmpty)
      lineNum += '\n';
    else
      lineNum += '\n${++count}';

  if (lineNum.isNotEmpty) lineNum = lineNum.substring(1);

  return lineNum;
}