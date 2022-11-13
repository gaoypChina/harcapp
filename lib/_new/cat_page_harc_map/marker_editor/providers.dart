import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common_contact_data.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_type.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../api/harc_map.dart';

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

  late String name;

  NameProvider({MarkerRespBody? initMarker}){
    name = initMarker?.name??'';
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
    markerType = initMarker?.type??MarkerType.HARCOWKA;
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

  late Map<String, String> communityKeys;

  BindedCommunitiesProvider({MarkerRespBody? initMarker}){
    communityKeys = {for(Tuple2<CommunityPreviewData, String?> c in (initMarker?.communities??[])) c.item1.key: ''};
  }

  void add(String communityKey){
    communityKeys[communityKey] = '';
    notifyListeners();
  }

  void remove(String communityKey){
    communityKeys.remove(communityKey);
    notifyListeners();
  }

  void notify() => notifyListeners();

}