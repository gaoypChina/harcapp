import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common_contact_data.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_type.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../api/harc_map.dart';
import '../marker_visibility.dart';

const double wawelLat = 50.0537412;
const double wawelLng = 19.9349666;

class PositionProvider extends ChangeNotifier{

  late double lat;
  late double lng;

  PositionProvider({MarkerRespBody? initMarker}){
    lat = initMarker?.lat??wawelLat;
    lng = initMarker?.lng??wawelLng;

  }

  static PositionProvider of(BuildContext context) =>
      Provider.of<PositionProvider>(context, listen: false);

  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();

  void setPosition(LatLng pointer){
    lat = pointer.latitude;
    lng = pointer.longitude;
    notifyListeners();
  }

}

class NameProvider extends ChangeNotifier{

  static NameProvider of(BuildContext context) =>
      Provider.of<NameProvider>(context, listen: false);

  static void notify_(BuildContext context) => of(context).notify();

  late TextEditingController controller;
  String get name => controller.text;

  NameProvider({MarkerRespBody? initMarker}){
    controller = TextEditingController(text: initMarker?.name??'');
  }

  void notify() => notifyListeners();

}

class MarkerTypeProvider extends ChangeNotifier{

  static MarkerTypeProvider of(BuildContext context) =>
      Provider.of<MarkerTypeProvider>(context, listen: false);

  static void notify_(BuildContext context) => of(context).notify();

  late MarkerType _markerType;
  MarkerType get markerType => _markerType;
  set markerType(MarkerType value){
    _markerType = value;
    notifyListeners();
  }

  MarkerTypeProvider({MarkerRespBody? initMarker}){
    _markerType = initMarker?.type??MarkerType.HARCOWKA;
  }

  void notify() => notifyListeners();

}

class MarkerVisibilityProvider extends ChangeNotifier{

  static MarkerVisibilityProvider of(BuildContext context) =>
      Provider.of<MarkerVisibilityProvider>(context, listen: false);

  static void notify_(BuildContext context) => of(context).notify();

  late MarkerVisibility _markerVisibility;
  MarkerVisibility get markerVisibility => _markerVisibility;
  set markerVisibility(MarkerVisibility value){
    _markerVisibility = value;
    notifyListeners();
  }

  MarkerVisibilityProvider({MarkerRespBody? initMarker}){
    _markerVisibility = initMarker?.visibility??MarkerVisibility.PUBLIC;
  }

  void notify() => notifyListeners();

}

class ContactProvider extends ChangeNotifier{

  static ContactProvider of(BuildContext context) =>
      Provider.of<ContactProvider>(context, listen: false);

  static void notify_(BuildContext context) => of(context).notify();

  late CommonContactData contactData;

  ContactProvider({MarkerRespBody? initMarker}){
    contactData = initMarker?.contact??CommonContactData.empty();
  }

  void notify() => notifyListeners();

}

class BindedCommunitiesProvider extends ChangeNotifier{

  static BindedCommunitiesProvider of(BuildContext context) =>
      Provider.of<BindedCommunitiesProvider>(context, listen: false);

  static void notify_(BuildContext context) => of(context).notify();

  late Map<String, String> _initCommunities;

  late Map<String, String> _communitiesToAdd;
  late Map<String, String> _communitiesToEdit;
  late List<String> _communitiesToRemove;

  Map<String, String> get addedCommunities => _communitiesToAdd;
  Map<String, String> get editedCommunities{
    Map<String, String> result = {};
    for(String key in _communitiesToEdit.keys)
      if(_communitiesToEdit[key] != _initCommunities[key])
        result[key] = _communitiesToEdit[key]!;

    return result;
  }
  List<String> get removedCommunities => _communitiesToRemove;

  Map<String, String> get communities{
    Map<String, String> result = {};

    for(String commKey in _initCommunities.keys)
      if(!_communitiesToRemove.contains(commKey))
        result[commKey] = _communitiesToEdit[commKey]??_initCommunities[commKey]!;

    result.addAll(_communitiesToAdd);

    return result;
  }

  int get length =>
    _initCommunities.length + _communitiesToAdd.length - _communitiesToEdit.length;

  BindedCommunitiesProvider({MarkerRespBody? initMarker}){
    _initCommunities = {for(Tuple2<CommunityPreviewData, String?> c in (initMarker?.communities??[])) c.item1.key: c.item2??''};
    _communitiesToAdd = {};
    _communitiesToEdit = {};
    _communitiesToRemove = [];
  }

  bool add(String communityKey){
    if(_initCommunities.containsKey(communityKey))
      return false;

    if(_communitiesToAdd.containsKey(communityKey))
      return false;

    _communitiesToAdd[communityKey] = '';
    notifyListeners();
    return true;
  }

  void edit(String communityKey, communityNote){
    if(_communitiesToAdd.containsKey(communityKey))
      _communitiesToAdd[communityKey] = communityNote;
    else if(_initCommunities.containsKey(communityKey))
      _communitiesToEdit[communityKey] = communityNote;
  }

  void remove(String communityKey){
    if(_communitiesToAdd.containsKey(communityKey))
      _communitiesToAdd.remove(communityKey);
    else if(!_communitiesToRemove.contains(communityKey))
      _communitiesToRemove.add(communityKey);

    notifyListeners();
  }

  void notify() => notifyListeners();

}