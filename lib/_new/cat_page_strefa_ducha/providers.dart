import 'package:flutter/cupertino.dart';
import 'package:harcapp/_new/cat_page_strefa_ducha/source.dart';
import 'package:provider/provider.dart';

import '_main.dart';

class FadeImageProvider extends ChangeNotifier{

  ImageProvider? _prevImage, _currImage, _nextImage;
  ImageProvider? _prevImageOld, _currImageOld, _nextImageOld;

  ImageProvider? _newNext, _newPrev;

  int _currIdx;

  FadeImageProvider(): _currIdx = 0;

  ImageProvider? get prevImage => _prevImage??_prevImageOld;
  set prevImage(ImageProvider? value){
    _prevImage = value;
    notifyListeners();
  }

  ImageProvider? get currImage => _currImage??_currImageOld;
  set currImage(ImageProvider? value){
    _currImage = value;
    notifyListeners();
  }

  ImageProvider? get nextImage => _nextImage??_nextImageOld;
  set nextImage(ImageProvider? value){
    _nextImage = value;
    notifyListeners();
  }

  newImage(ImageProvider image, int idx, {bool notify = true, bool reload = false}){

    //print('newImage $idx start');
    //debug();
    if((reload || _prevImage == null) && idx==currIdx-CatPageStrefaDucha.pageViewExtent) {
      //print('prev !!!');
      _prevImage = image;
      _prevImageOld = image;
      if(notify) notifyListeners();
    }else if((reload || _currImage == null) && idx==currIdx){
      //print('curr !!!');
      _currImage = image;
      _currImageOld = image;
      if(notify) notifyListeners();
    }else if((reload || _nextImage == null) && idx==currIdx+CatPageStrefaDucha.pageViewExtent){
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

  static LockProvider of(BuildContext context) => Provider.of<LockProvider>(context, listen: false);

  late bool _locked;

  bool get locked => _locked;
  set locked(bool value){
    _locked = value;
    notifyListeners();
  }

  LockProvider(){
    _locked = false;
  }
}

class FavoriteListProvider extends ChangeNotifier{

  void notify() => notifyListeners();

}

class PinProvider extends ChangeNotifier{
  
  SourceItem? get item => SourceItem.pinned;

  set item(SourceItem? value){
    SourceItem.pinned = value;
    notifyListeners();
  }

}
