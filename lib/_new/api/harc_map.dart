import 'dart:async';

import 'package:dio/dio.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/common_contact_data.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_type.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';

import '../cat_page_home/community/model/community_category.dart';
import '_api.dart';

class MarkerRespBody{

  final String key;
  final String name;
  final CommonContactData? contact;
  double lat;
  double lng;
  MarkerType type;
  final UserData user;
  final List<CommunityPreviewData> communities;

  late Map<CommunityCategory, int> communityCategories;
  late bool anyDoubleCommunityCategories;

  MarkerRespBody({
    required this.key,
    required this.name,
    required this.contact,
    required this.lat,
    required this.lng,
    required this.type,
    required this.user,
    required this.communities,
  }){
    Map<CommunityCategory, int> commCats = {};
    anyDoubleCommunityCategories = false;
    for(CommunityBasicData commCat in communities)
      if(commCats.containsKey(commCat.category)) {
        commCats[commCat.category] = commCats[commCat.category]! + 1;
        anyDoubleCommunityCategories = true;
      } else
        commCats[commCat.category] = 1;

      communityCategories = commCats;
  }

  static MarkerRespBody fromMap(Map map, {String? key}) => MarkerRespBody(
    key: key??map['_key']??(throw InvalidResponseError('_key')),
    name: map['name']??(throw InvalidResponseError('name')),
    contact: map['contact'] == null?null:CommonContactData.fromMap(map['contact']),
    lat: map['lat']??(throw InvalidResponseError('lat')),
    lng: map['lng']??(throw InvalidResponseError('lng')),
    type: strToMarkerType[map['type']??(throw InvalidResponseError('type'))]??MarkerType.ERROR,
    user: UserData.fromMap(map['creatorUser']??(throw InvalidResponseError('creatorUser'))),
    communities: ((map['communities'] as List?)??[]).map(
            (resp) => CommunityPreviewData.fromResponse(resp)
    ).toList(),
  );

  static MarkerRespBody fromSimple({
    required double lat,
    required double lng,
    required MarkerType type,
  }) => MarkerRespBody(
    key: '',
    name: '',
    contact: null,
    lat: lat,
    lng: lng,
    type: type,
    user: UserData(
      key: '',
      name: '',
      shadow: false,
      sex: Sex.male
    ),
    communities: [],
  );

}

class ApiHarcMap{

  static Future<Response?> getAllMarkers({
    bool publicOnly = false,
    FutureOr<void> Function(List<MarkerRespBody>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function(Response? response)? onError,
  }) async => await API.sendRequest(
    withToken: !publicOnly,
    requestSender: (Dio dio) => dio.get(
        '${API.SERVER_URL}api/harcMap${publicOnly?'/public':''}',
    ),
    onSuccess: (Response response, DateTime now) async {
      List<MarkerRespBody> markerRespBodyList = [];
      for(Map map in response.data) {
        MarkerRespBody markerRespBody = MarkerRespBody.fromMap(map);
        markerRespBodyList.add(markerRespBody);
      }

      onSuccess?.call(markerRespBodyList);
    },
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (err) async => onError?.call(err.response)
  );

  static Future<Response?> createMarker({
    required String name,
    required double lat,
    required double lng,
    required MarkerType type,

    FutureOr<void> Function(MarkerRespBody marker)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<bool> Function()? onImageDBWakingUp,
    FutureOr<void> Function()? onError,
  }) async {

    return API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) async => dio.post(
          '${API.SERVER_URL}api/harcMap',
          data: FormData.fromMap({
            'name': name,
            'lat': lat,
            'lng': lng,
            'type': markerTypeToStr[type],
          })
      ),
      onSuccess: (Response response, DateTime now) async{
        MarkerRespBody markerRespBody = MarkerRespBody.fromMap(response.data);
        onSuccess?.call(markerRespBody);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onImageDBWakingUp: onImageDBWakingUp,
      onError: (_) async => onError?.call()
    );

  }

}