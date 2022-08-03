import 'package:harcapp/_common_classes/searcher.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/values/people.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core_song/song_core.dart';

class SongSearchOptions extends SearchOptions{
  late List<String> checkedTags;
  late List<int> checkedRates;

  SongSearchOptions({List<String>? checkedTags, List<int>? checkedRates}){
    this.checkedTags = checkedTags??[];
    this.checkedRates = checkedRates??[];
  }

  @override
  bool get isEmpty => checkedTags.isEmpty &&
        checkedRates.isEmpty;

  @override
  void clear(){
    checkedTags = [];
    checkedRates = [];
  }

}

class SongSearcher extends Searcher<Song, int, SongSearchOptions?>{

  void Function(List<Song>, bool Function() stillValid) onCompleteListener;

  SongSearcher(this.onCompleteListener) : super(_selectSongs){

    super.addOnCompleteListener((List<int> result, bool Function() stillValid) {

      List<Song> songs = [];
      for(int pos in result) {
        if(!stillValid()) return;
        songs.add(allItems[pos]);
      }

      onCompleteListener(songs, stillValid);

    });

  }

}

bool _tagMatch(SongSearchOptions options, Song? song){
  final List<String> checkedTags = options.checkedTags;
  if(checkedTags.isEmpty) return true;

  for (String tag in song!.tags)
    if(checkedTags.contains(tag))
      return true;

  return false;
}

bool _rateMatch(SongSearchOptions options, Song? song){
  final List<int> checkedRates = options.checkedRates;
  return checkedRates.isEmpty || checkedRates.contains(song!.rate);
}

List<int>? _selectSongs(String phrase, List<Song> allItems, SongSearchOptions? options, bool Function() stillValid){

  String text = remSpecChars(remPolChars(phrase.trim()));

  List<int> resultsByMeta = [];
  List<int> resultsByText = [];
  List<int> resultsByAddPers = [];

  for(int i=0; i<allItems.length; i++) {

    if(!stillValid()) return null;

    Song? song = allItems[i];
    if (!_tagMatch(options!, song) || !_rateMatch(options, song))
      continue;

    bool titleMatch = remSpecChars(remPolChars(song.title)).contains(text);
    bool authorMatch = false;
    for(String author in remPolCharsList(song.authors))
      if(author.contains(text)){
        authorMatch = true;
        break;
      }

    bool composerMatch = false;
    for(String composer in remSpecCharsList(remPolCharsList(song.composers)))
      if(composer.contains(text)){
        composerMatch = true;
        break;
      }

    bool performerMatch = false;
    for(String performer in remSpecCharsList(remPolCharsList(song.performers)))
      if(performer.contains(text)){
        performerMatch = true;
        break;
      }

    bool hidTitleMatch = false;
    for(String hidTitle in song.hidTitles)
      if(remSpecChars(remPolChars(hidTitle)).contains(text)){
        hidTitleMatch = true;
        break;
      }


    if(titleMatch || authorMatch || composerMatch || performerMatch || hidTitleMatch)
      resultsByMeta.add(i);
    else if(remSpecChars(remPolChars(song.text)).contains(text))
      resultsByText.add(i);
    else
      for(AddPerson addPers in song.addPers){
        if(addPers.name != null && remSpecChars(remPolChars(addPers.name!)).contains(text)) {
          resultsByAddPers.add(i);
          break;
        }

        if(addPers.emailRef != null && allPeopleMap[addPers.emailRef] != null && remSpecChars(remPolChars(allPeopleMap[addPers.emailRef]!.name)).contains(text)) {
          resultsByAddPers.add(i);
          break;
        }

      }

  }
  return resultsByMeta + resultsByText + resultsByAddPers;

}