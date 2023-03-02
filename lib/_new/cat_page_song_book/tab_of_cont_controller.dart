import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_searcher.dart';

class TabOfContController{

  late String phrase;
  final SongSearchOptions searchOptions;

  List<Song> allSongs;

  late List<Song> currSongs;

  TabOfContController(
      this.allSongs,
      { String initPhrase = '',
        SongSearchOptions? initSearchOptions,
      }):
        phrase = initPhrase,
        searchOptions = initSearchOptions??SongSearchOptions(),

        currSongs = allSongs;

}