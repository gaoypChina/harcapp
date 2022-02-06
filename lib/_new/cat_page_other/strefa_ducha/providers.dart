import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/cat_page_other/strefa_ducha/source.dart';

import '_main.dart';
import 'child_fragment.dart';
import 'image_loader.dart';

class ItemsProvider extends ChangeNotifier{

  //SourceItem noInternetItem = SourceItem.noInternet();

  //bool _noInternet;
  //bool get noInternet => _noInternet;

/*  set noInternet(bool value){
    //_noInternet = true;
    notifyListeners();
  }
*/
  //int favOnlineIdx;
  //int favOfflineIdx;
  int _allOnlineIdx;
  //int allOfflineIdx;

  bool _favoriteOnly;
  bool get favoriteOnly => _favoriteOnly;
  set favoriteOnly(bool value){
    _favoriteOnly = value;
    _items = itemsToDisplay;
    _notifier.value = index.toDouble();
    notifyListeners();
  }

  bool _offlineOnly;
  bool get offlineOnly => _offlineOnly;
  set offlineOnly(bool value){
    _offlineOnly = value;
    _items = itemsToDisplay;
    _notifier.value = index.toDouble();
    notifyListeners();
  }

  List<Source> _sources;
  List<Source> get sources => _sources;
  set sources(List<Source> value){
    _itemsOnline = null;
    _sources = value;
    _items = itemsToDisplay;
  }

  List<SourceItem> get _offlineItems{

    List<SourceItem> resultItems = [];
    List<Source> sources = ImageLoader.allLocalItems;
    for (Source source in sources)
      if (source.display) resultItems.addAll(source.items);

    return resultItems;
  }

  List<SourceItem> getFavoriteItems(List<SourceItem> allItems) {

    List<SourceItem> resultItems = [];
    List<String> itemsFavoriteCodes = shaPref.getStringList(ShaPref.SHA_PREF_DUCHOWE_FAVORITE_ITEMS, []);

    for(SourceItem item in allItems)
      if(itemsFavoriteCodes.contains(item.toString())) resultItems.add(item);

    return resultItems;
  }

  List<SourceItem> get itemsToDisplay{

    List<SourceItem> allItems;

    if(offlineOnly){
      allItems = _offlineItems;
      allItems.shuffle();
    }
    //else if(isDownloaderRunning) return null;
    else {
      if(_itemsOnline == null) {
        _itemsOnline = _allCheckedItems;
        _itemsOnline.shuffle();
      }
      allItems = _itemsOnline;
    }
    if(allItems == null) return [];

    List<SourceItem> resultItems;
    if(favoriteOnly) resultItems = getFavoriteItems(allItems);
    else resultItems = allItems;

    return resultItems;
  }

  List<SourceItem> get _allCheckedItems{
    List<SourceItem> checkedItems = [];
    for (Source source in _sources)
      if (source.display)
        checkedItems.addAll(source.items);

    return checkedItems;
  }

  void reloadItems({bool shuffle: true}){

    _itemsOnline = null;
    _items = itemsToDisplay;

    _allOnlineIdx = 0;
    notifier.value = .0;

    notifyListeners();
  }

  List<SourceItem> _itemsOnline;

  List<SourceItem> _items;
  ValueNotifier<double> _notifier;

  List<SourceItem> get items => _items;
  ValueNotifier get notifier => _notifier;

  ItemsProvider(){

    //favOnlineIdx = 0;
    //favOfflineIdx = 0;
    _allOnlineIdx = 0;
    //allOfflineIdx = 0;

    _favoriteOnly = false;
    _offlineOnly = false;

    _notifier = ValueNotifier<double>(0);
  }

  set index(int value){

    if(!favoriteOnly && !offlineOnly) _allOnlineIdx = value;

    /*
    if(favoriteOnly){
      if(offlineOnly) favOfflineIdx = value;
      else favOnlineIdx = value;
    }else{
      if(offlineOnly) allOfflineIdx = value;
      else allOnlineIdx = value;
    }
     */
  }

  int get index{
    if(favoriteOnly){
      if(offlineOnly) return 0;//favOfflineIdx;
      else return 0;//favOnlineIdx;
    }else{
      if(offlineOnly) return 0;//allOfflineIdx;
      else return _allOnlineIdx;
    }
  }

  /*
  void jump(){
      int index = this.index;
      //if(_controller.hasClients)
      //  _controller.jumpToPage(index);
    _notifier.value = index.toDouble();
  }
*/
  void notify() => notifyListeners();

}

class FadeImageProvider extends ChangeNotifier{

  ImageProvider _prevImage, _currImage, _nextImage;
  ImageProvider _prevImageOld, _currImageOld, _nextImageOld;

  ImageProvider _newNext, _newPrev;

  int _currIdx;

  FadeImageProvider(){
    _currIdx = 0;
  }

  ImageProvider get prevImage => _prevImage??_prevImageOld;
  set prevImage(ImageProvider value){
    _prevImage = value;
    notifyListeners();
  }

  ImageProvider get currImage => _currImage??_currImageOld;
  set currImage(ImageProvider value){
    _currImage = value;
    notifyListeners();
  }

  ImageProvider get nextImage => _nextImage??_nextImageOld;
  set nextImage(ImageProvider value){
    _nextImage = value;
    notifyListeners();
  }

  newImage(ImageProvider image, int idx, {bool notify: true}){

    //print('newImage $idx start');
    //debug();
    if(_prevImage == null && idx==currIdx-SpiritPage.pageViewExtent) {
      //print('prev !!!');
      _prevImage = image;
      _prevImageOld = image;
      if(notify) notifyListeners();
    }else if(_currImage == null && idx==currIdx){
      //print('curr !!!');
      _currImage = image;
      _currImageOld = image;
      if(notify) notifyListeners();
    }else if(_nextImage == null && idx==currIdx+SpiritPage.pageViewExtent){
      //print('next !!!');
      _nextImage = image;
      _nextImageOld = image;
      if(notify) notifyListeners();
    }else if(idx > _currIdx){
      _newNext = image;
    }else if(idx < _currIdx){
      _newPrev = image;
    }
    //debug();
    //print('newImage end\n\n');
  }

  int get currIdx => _currIdx;
  set currIdx(int idx){
    _currIdx = idx;
    notifyListeners();
  }

  void moveOneBack(){
    //print('moveOneBack ${_currIdx-1} start');
    //debug();
    _newNext = _nextImage;
    _nextImage = _currImage;
    _nextImageOld = _currImage;
    _currImage = _prevImage;
    _currImageOld = _prevImage;

    if(_newPrev != null){
      _prevImage = _newPrev;
      _prevImageOld = _newPrev;
      _newPrev = null;
    }else{
      _prevImage = null;
    }
    _currIdx--;
    notifyListeners();
    //debug();
    //print('moveOneBack end\n\n');
  }

  void moveOneForw(){
    //print('moveOneForw ${_currIdx+1} start');
    //debug();
    _newPrev = _prevImage;
    _prevImage = _currImage;
    _prevImageOld = _currImage;
    _currImage = _nextImage;
    _currImageOld = _nextImage;

    if(_newNext != null) {
      _nextImage = _newNext;
      _nextImageOld = _newNext;
      _newNext = null;
    }else{
      _nextImage = null;
    }
    _currIdx++;
    notifyListeners();
    //debug();
    //print('moveOneForw end\n\n');
  }

  void clear({currIdx}){
    _prevImage = null;
    _currImage = null;
    _nextImage = null;
    _newPrev = null;
    _newNext = null;
    if(currIdx != null) _currIdx = currIdx;
    notifyListeners();
  }

  debug(){
    print(
        '_newPrev == null: ${_newPrev == null}, '
        '_newNext == null: ${_newNext == null}, '
            '_prevImage == null: ${_prevImage == null}, '
            '_currImage == null: ${_currImage == null}, '
            '_nextImage == null: ${_nextImage == null}, '
            '_currIdx: $_currIdx, '
    );
  }
}

class LockProvider extends ChangeNotifier{

  bool _locked;

  bool get locked => _locked;
  set locked(bool value){
    _locked = value;
    notifyListeners();
  }

  LockProvider(){
    _locked = false;
  }
}

class FavoriteProvider extends ChangeNotifier{

  bool _value;

  bool get value => _value;
  set value(bool value){
    _value = value;
    notifyListeners();
  }

  FavoriteProvider(this._value);

}

class PinProvider extends ChangeNotifier{
  
  SourceItem get item => SourceItem.pinned;

  set item(SourceItem value){

    if(value == null)
      SourceItem.removePin();
    else
      SourceItem.pin(value);
    
    notifyListeners();
  }

}


class DisplayedItemsProvider1 extends ChangeNotifier{

  List<ChildFragmentState> _list;

  DisplayedItemsProvider1(){
    _list = [];
  }

  List<ChildFragmentState> get list => _list;

  void add(ChildFragmentState state){
    _list.add(state);
  }

  void remove(ChildFragmentState state){
    _list.remove(state);
  }

  void dispose(){
    super.dispose();
    for(ChildFragmentState songWidget in _list) {
      songWidget.dispose();
    }
  }

  void notify(){
    for(ChildFragmentState songWidget in _list) {
      songWidget.notify();
    }
  }

  void clear(){
    _list.clear();
  }
}
