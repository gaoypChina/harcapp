import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/common_contact_data.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_type.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_visibility.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:tuple/tuple.dart';

import '../api/_api.dart';
import '../cat_page_home/community/model/community_category.dart';

class MarkerData{

  final String key;
  String? name;
  CommonContactData? contact;
  double lat;
  double lng;
  MarkerType type;
  MarkerVisibility visibility;
  final UserData user;
  Map<CommunityCategory, int> communitiesBasicData;

  List<Tuple2<CommunityPreviewData, String?>>? communities;
  late bool anyDoubleCommunityCategories;

  MarkerData({
    required this.key,
    required this.name,
    required this.contact,
    required this.lat,
    required this.lng,
    required this.type,
    required this.visibility,
    required this.user,
    required this.communitiesBasicData,
  }){
    anyDoubleCommunityCategories = false;
    for(int counts in communitiesBasicData.values)
      if(counts > 1) {
        anyDoubleCommunityCategories = true;
        break;
      }
  }

  static MarkerData fromMap(Map map, {String? key}){

    Map<String, int> commBasicDataRaw = ((map['communitiesBasicData']??(throw InvalidResponseError('communitiesBasicData'))) as Map).cast<String, int>();
    Map<CommunityCategory, int> commBasicData = {};
    for(String commCatStr in commBasicDataRaw.keys){
      CommunityCategory? commCat = strToCommCat[commCatStr];
      if(commCat == null) continue;
      commBasicData[commCat] = commBasicDataRaw[commCatStr]!;
    }

    return MarkerData(
        key: key??map['_key']??(throw InvalidResponseError('_key')),
        name: map['name'],
        contact: map['contact'] == null?null:CommonContactData.fromMap(map['contact']),
        lat: map['lat']??(throw InvalidResponseError('lat')),
        lng: map['lng']??(throw InvalidResponseError('lng')),
        type: strToMarkerType[map['type']??(throw InvalidResponseError('type'))]??MarkerType.ERROR,
        visibility: strToMarkerVisibility[map['visibility']??(throw InvalidResponseError('visibility'))]??MarkerVisibility.ERROR,
        user: UserData.fromMap(map['creatorUser']??(throw InvalidResponseError('creatorUser'))),
        communitiesBasicData: commBasicData
    );

  }

  static MarkerData fromSimple({
    required double lat,
    required double lng,
    required MarkerType type,
    required MarkerVisibility visibility,
  }) => MarkerData(
    key: '',
    name: '',
    contact: null,
    lat: lat,
    lng: lng,
    type: type,
    visibility: visibility,
    user: const UserData(
        key: '',
        name: '',
        shadow: false,
        sex: Sex.male
    ),
    communitiesBasicData: {}
  );

  void update(MarkerData updatedMarker){

    name = updatedMarker.name;
    contact = updatedMarker.contact;

    lat = updatedMarker.lat;
    lng = updatedMarker.lng;
    type = updatedMarker.type;
    visibility = updatedMarker.visibility;
    communitiesBasicData = updatedMarker.communitiesBasicData;

    if(updatedMarker.communities != null)
      communities = updatedMarker.communities;

  }

}