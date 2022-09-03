import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:provider/provider.dart';

import 'common/community_cover_image_data.dart';
import 'model/community.dart';

class CommunityPublishableListProvider extends ChangeNotifier{
  static CommunityPublishableListProvider of(BuildContext context) => Provider.of<CommunityPublishableListProvider>(context, listen: false);
  static notify_(BuildContext context) => of(context).notify();
  void notify() => notifyListeners();
}

abstract class CommunityPublishable{

  static const int feedPageSize = 10;

  static List<CommunityPublishable>? _all;
  static Map<String, CommunityPublishable>? _allMap;

  static List<CommunityPublishable>? get all => _all;
  static Map<String, CommunityPublishable>? get allMap => _allMap;

  static forget(){
    _all = null;
    _allMap = null;
  }

  static silentInit(List<CommunityPublishable> publishables){
    if(_all == null){
      _all = [];
      _allMap = {};
    }

    _all!.clear();
    _allMap!.clear();

    _all!.addAll(publishables);
    _allMap = {for (CommunityPublishable p in publishables) p.key: p};

  }

  static init(List<CommunityPublishable> publishables, {BuildContext? context}){

    silentInit(publishables);

    if(context == null) return;
    Provider.of<CommunityPublishableListProvider>(context, listen: false).notify();
  }

  static addToAll(BuildContext context, CommunityPublishable ann){
    if(_all == null){
      _all = [];
      _allMap = {};
    }
    _all!.add(ann);
    _allMap![ann.key] = ann;

    Provider.of<CommunityPublishableListProvider>(context, listen: false).notify();

  }

  static addListToAll(List<CommunityPublishable> publishables, {BuildContext? context}){
    if(_all == null){
      _all = [];
      _allMap = {};
    }
    for(CommunityPublishable p in publishables) {
      _all!.add(p);
      _allMap![p.key] = p;
    }

    if(context == null) return;

    Provider.of<CommunityPublishableListProvider>(context, listen: false).notify();

  }

  static updateInAll(BuildContext context, CommunityPublishable publishable){
    CommunityPublishable? oldPublishable = _allMap![publishable.key];
    if(oldPublishable == null){
      addToAll(context, publishable);
      return;
    }

    int index = _all!.indexOf(oldPublishable);
    _all!.removeAt(index);
    _all!.insert(index, publishable);
    _allMap![publishable.key] = publishable;

    Provider.of<CommunityPublishableListProvider>(context, listen: false).notify();

  }

  static void removeFromAll(BuildContext context, CommunityPublishable publishable){
    if(_all == null)
      return;

    _all!.remove(publishable);
    _allMap!.remove(publishable.key);

    Provider.of<CommunityPublishableListProvider>(context, listen: false).notify();

  }

  static clear(){
    if(_all == null)
      return;
    _all!.clear();
    _allMap!.clear();
  }

  final String key;
  String? title;
  bool get hasTitle => title != null && title!.isNotEmpty;
  DateTime publishTime;
  DateTime? lastUpdateTime;
  String? urlToPreview;
  UserData? author;
  CommunityCoverImageData? coverImage;
  String text;

  CommunityBasicData get community;

  CommunityPublishable({
    required this.key,
    required this.title,
    required this.publishTime,
    required this.urlToPreview,
    required this.author,
    this.lastUpdateTime,
    this.coverImage,
    required this.text
  });

}