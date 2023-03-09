
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
  static notify_(BuildContext context) => of(context).notify();

  BaseAlbum get current => BaseAlbum.current;
  set current(BaseAlbum album){
    BaseAlbum.current = album;
    notifyListeners();
  }

  List<BaseAlbum> get all => BaseAlbum.all;
  List<OwnAlbum>? get allOwn => OwnAlbum.all;

  add(OwnAlbum album){
    OwnAlbum.addToAll(album);
    notifyListeners();
  }

  removeFromAll(OwnAlbum album){
    OwnAlbum.removeFromAll(album);
    notifyListeners();
  }

  insertToAll(int index, OwnAlbum album){
    OwnAlbum.insertToAll(index, album);
    notifyListeners();
  }

  void notify() => notifyListeners();
}

class RandomButtonProvider extends ChangeNotifier {

  static RandomButtonProvider of(BuildContext context) => Provider.of<RandomButtonProvider>(context, listen: false);

  static notify_(BuildContext context) => of(context).notify();

  late bool _showButtonOnMain;
  late int _lastTapId;
  bool get showButtonOnMain => _showButtonOnMain;

  Future<void> registerTap() async {
    _showButtonOnMain = true;
    _lastTapId++;
    int lastTapId = _lastTapId;
    notify();
    await Future.delayed(const Duration(seconds: 4));
    if(_lastTapId == lastTapId){
      _showButtonOnMain = false;
      _lastTapId = 0;
      notify();
    }

  }

  static Future<void> registerTap_(BuildContext context) => of(context).registerTap();

  RandomButtonProvider(){
    _showButtonOnMain = false;
    _lastTapId = 0;
  }

  void notify() => notifyListeners();


}