import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_searcher.dart';

class TabOfContController{

  late String phrase;
  final SongSearchOptions searchOptions;

  List<Song> allSongs;

  late List<Song> _currSongs;
  late int songsHashCode;

  List<Song> get currSongs => _currSongs;
  set currSongs(List<Song> value){
    _currSongs = value;
    songsHashCode = allSongs.join('\$').hashCode;
  }


  TabOfContController(
      this.allSongs,
      { String initPhrase = '',
        SongSearchOptions? initSearchOptions,
      }):
        phrase = initPhrase,
        searchOptions = initSearchOptions??SongSearchOptions(),

        _currSongs = allSongs,
        songsHashCode = allSongs.join('\$').hashCode;

}