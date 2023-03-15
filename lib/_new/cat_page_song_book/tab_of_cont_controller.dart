import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_searcher.dart';

class TabOfContController{

  late String phrase;
  final SongSearchOptions searchOptions;

  List<Song> allSongs;

  late List<Song> _searchedSongs;
  late int songsHashCode;

  List<Song> get searchedSongs => _searchedSongs;
  set searchedSongs(List<Song> value){
    _searchedSongs = value;
    songsHashCode = _searchedSongs.join('\$').hashCode;
  }

  void clear(){
    phrase = '';
    _searchedSongs = allSongs;
  }

  TabOfContController(
      this.allSongs,
      { String initPhrase = '',
        SongSearchOptions? initSearchOptions,
      }):
        phrase = initPhrase,
        searchOptions = initSearchOptions??SongSearchOptions(),

        _searchedSongs = allSongs,
        songsHashCode = allSongs.join('\$').hashCode;

}