
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'song_management/album.dart';

/*
class DisplayedSongsProvider extends ChangeNotifier{

  List<SongWidgetState> _list;
  Map<int, SongWidgetState> _map;

  DisplayedSongsProvider(){
    _list = [];
    _map = {};
  }

  List<SongWidgetState> get list => _list;
  Map<int, SongWidgetState> get map => _map;

  add(SongWidgetState state){
    _list.add(state);
    _map[state.index] = state;
  }

  remove(SongWidgetState state){
    _list.remove(state);
    _map.remove(state.index);
  }

  notify(){
    for(SongWidgetState songWidget in _list)
      songWidget.notify();
  }

  clear() => _list.clear();

}
*/

class AlbumProvider extends ChangeNotifier{

  static AlbumProvider of(BuildContext context) => Provider.of<AlbumProvider>(context, listen: false);

  Album get current => Album.current;
  set current(Album album){
    Album.current = album;
    notifyListeners();
  }

  List<Album> get all => Album.all;
  List<Album>? get allOwn => Album.allOwn;

  add(Album album){
    Album.addToAll(album);
    notifyListeners();
  }

  removeFromAll(Album album){
    Album.removeFromAll(album);
    notifyListeners();
  }

  insertToAll(int index, Album album){
    Album.insertToAll(index, album);
    notifyListeners();
  }
}

