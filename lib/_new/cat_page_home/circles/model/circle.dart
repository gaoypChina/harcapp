import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:provider/provider.dart';

import '../../../api/_api.dart';
import '../circle_cover_image_data.dart';
import 'announcement.dart';
import 'member.dart';

class CircleProvider extends ChangeNotifier{
  void notify() => notifyListeners();
}

class CircleListProvider extends ChangeNotifier{
  void notify() => notifyListeners();
}

class Circle{

  static List<Circle> _all;
  static Map<String, Circle> _allMap;

  static List<Circle> get all => _all;
  static Map<String, Circle> get allMap => _allMap;

  static silentInit(List<Circle> circles){
    if(_all == null){
      _all = [];
      _allMap = {};
    }

    _all.clear();
    _allMap.clear();

    _all.addAll(circles);
    _allMap = {for (Circle circle in circles) circle.key: circle};

  }

  static init(BuildContext context, List<Circle> circles){

    silentInit(circles);

    Provider.of<CircleProvider>(context, listen: false).notify();
    Provider.of<CircleListProvider>(context, listen: false).notify();
  }


  static addToAll(BuildContext context, Circle circle){
    if(_all == null){
      _all = [];
      _allMap = {};
    }
    _all.add(circle);
    _allMap[circle.key] = circle;

    Provider.of<CircleProvider>(context, listen: false).notify();
    Provider.of<CircleListProvider>(context, listen: false).notify();
  }

  static updateInAll(BuildContext context, Circle circle){
    Circle oldCircle = _allMap[circle.key];
    if(oldCircle == null){
      addToAll(context, circle);
      return;
    }

    int index = _all.indexOf(oldCircle);
    _all.removeAt(index);
    _all.insert(index, circle);
    _allMap[circle.key] = circle;

    Provider.of<CircleProvider>(context, listen: false).notify();
    Provider.of<CircleListProvider>(context, listen: false).notify();
  }

  static removeFromAll(BuildContext context, Circle circle){
    if(_all == null)
      return;

    _all.remove(circle);
    _allMap.remove(circle.key);

    Provider.of<CircleProvider>(context, listen: false).notify();
    Provider.of<CircleListProvider>(context, listen: false).notify();
  }

  static clear(){
    if(_all == null)
      return;
    _all.clear();
    _allMap.clear();
  }

  final String key;
  String name;
  String description;
  CircleCoverImageData coverImage;
  final String shareCode;
  final bool shareCodeSearchable;
  String colorsKey;

  final List<Member> members;
  final List<Announcement> announcements;

  Circle({
    this.key,
    this.name,
    this.description,
    this.coverImage,
    this.shareCode,
    this.shareCodeSearchable,
    this.colorsKey,

    this.members,
    this.announcements,
  });

  static Circle fromResponse(Map resp){

    List<Member> members = [];
    Map memResps = resp['members']??(throw InvalidResponseError('_key'));
    for(String userKey in memResps.keys){
      Map memResp = memResps[userKey];
      Member memData = Member.fromMap(memResp, key: userKey);
      members.add(memData);
    }

    List<Announcement> announcements = [];
    Map annResps = resp['announcements']??(throw InvalidResponseError('_key'));
    for(String annKey in annResps.keys){
      Map annRespData = annResps[annKey];
      Announcement ann = Announcement.fromMap(annRespData, key: annKey);
      announcements.add(ann);
    }

    return Circle(
      key: resp['_key']??(throw InvalidResponseError('_key')),
      name: resp['name']??(throw InvalidResponseError('name')),
      description: resp['description'],
      coverImage: CircleCoverImageData.from(resp['cover_image_url']),
      colorsKey: resp['colors_key']??(throw InvalidResponseError('colors_key')),
      shareCode: resp["share_code"],
      shareCodeSearchable: resp["share_code_searchable"],
      members: members,
      announcements: announcements,
    );
  }

}