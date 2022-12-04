import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_searcher.dart';

class TabOfContController{

  late String phrase;
  late SongSearchOptions searchOptions;

  Function(SongSearchOptions? searchOptions)? onSearchOptionsChanged;

  List<Song> allSongs;

  late List<Song>? _currSongs;
  List<Song>? get currSongs => _currSongs;
  set currSongs(List<Song>? values) => _currSongs = values;

  TabOfContController(
      this.allSongs,
      { String initPhrase = '',
        SongSearchOptions? initSearchOptions,

        this.onSearchOptionsChanged
      }):
        phrase = initPhrase,
        searchOptions = initSearchOptions??SongSearchOptions(),

        _currSongs = allSongs;

}