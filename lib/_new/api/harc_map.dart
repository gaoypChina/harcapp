import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/common_contact_data.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_type.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_visibility.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:optional/optional_internal.dart';
import 'package:tuple/tuple.dart';

import '../cat_page_home/community/model/community_category.dart';
import '_api.dart';

class MarkerRespBody{

  final String key;
  String name;
  CommonContactData? contact;
  double lat;
  double lng;
  MarkerType type;
  MarkerVisibility visibility;
  final UserData user;
  List<Tuple2<CommunityPreviewData, String?>> communities;

  late Map<CommunityCategory, int> communityCategories;
  late bool anyDoubleCommunityCategories;

  MarkerRespBody({
    required this.key,
    required this.name,
    required this.contact,
    required this.lat,
    required this.lng,
    required this.type,
    required this.visibility,
    required this.user,
    required this.communities,
  }){
    Map<CommunityCategory, int> commCats = {};
    anyDoubleCommunityCategories = false;
    for(Tuple2<CommunityPreviewData, String?> comm in communities)
      if(commCats.containsKey(comm.item1.category)) {
        commCats[comm.item1.category] = commCats[comm.item1.category]! + 1;
        anyDoubleCommunityCategories = true;
      } else
        commCats[comm.item1.category] = 1;

      communityCategories = commCats;
  }

  static MarkerRespBody fromMap(Map map, {String? key}) => MarkerRespBody(
    key: key??map['_key']??(throw InvalidResponseError('_key')),
    name: map['name']??(throw InvalidResponseError('name')),
    contact: map['contact'] == null?null:CommonContactData.fromMap(map['contact']),
    lat: map['lat']??(throw InvalidResponseError('lat')),
    lng: map['lng']??(throw InvalidResponseError('lng')),
    type: strToMarkerType[map['type']??(throw InvalidResponseError('type'))]??MarkerType.ERROR,
    visibility: strToMarkerVisibility[map['visibility']??(throw InvalidResponseError('visibility'))]??MarkerVisibility.ERROR,
    user: UserData.fromMap(map['creatorUser']??(throw InvalidResponseError('creatorUser'))),
    communities: ((map['communities'] as List?)??[]).map(
            (resp) => Tuple2(CommunityPreviewData.fromResponse(resp), resp["note"] as String?)
    ).toList(),
  );

  static MarkerRespBody fromSimple({
    required double lat,
    required double lng,
    required MarkerType type,
    required MarkerVisibility visibility,
  }) => MarkerRespBody(
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
    communities: [],
  );

  void update(MarkerRespBody updatedMarker){

    name = updatedMarker.name;
    contact = updatedMarker.contact;

    lat = updatedMarker.lat;
    lng = updatedMarker.lng;
    type = updatedMarker.type;
    visibility = updatedMarker.visibility;

    communities = updatedMarker.communities;

    communityCategories = updatedMarker.communityCategories;
    anyDoubleCommunityCategories = updatedMarker.anyDoubleCommunityCategories;

  }

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
    required CommonContactData? contact,
    required double lat,
    required double lng,
    required MarkerType type,
    required MarkerVisibility visibility,
    required Map<String, String> communityKeys, // {key: note}

    FutureOr<void> Function(MarkerRespBody marker)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async => await API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) async => dio.post(
          '${API.SERVER_URL}api/harcMap',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }),
          data: jsonEncode({
            'name': name,
            'contact': contact?.toMap(),
            'lat': lat,
            'lng': lng,
            'type': markerTypeToStr(type),
            'visibility': markerVisibilityToStr(visibility),
            'communities': communityKeys
          })
      ),
      onSuccess: (Response response, DateTime now) async{
        MarkerRespBody markerRespBody = MarkerRespBody.fromMap(response.data);
        onSuccess?.call(markerRespBody);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (_) async => onError?.call()
  );

  static Future<Response?> updateMarker({
    required String markerKey,
    String? name,
    Optional<Tuple2<CommonContactData?, CommonContactData?>> contact = const Optional.empty(),
    double? lat,
    double? lng,
    MarkerType? type,
    MarkerVisibility? visibility,

    Map<String, String> addCommunity = const {},
    Map<String, String> editCommunity = const {},
    List<String> removeCommunity = const [],

    FutureOr<void> Function(MarkerRespBody marker)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async {

    Map<String, dynamic> reqMap = {};
    if(name != null) reqMap['name'] = name.trim();
    if(contact.isPresent){
      CommonContactData? oldContact = contact.value.item1;
      CommonContactData? newContact = contact.value.item2;
      reqMap['contact'] = newContact?.toUpdateMap(oldContact);
    }
    if(lat != null) reqMap['lat'] = lat;
    if(lng != null) reqMap['lng'] = lng;
    if(type != null) reqMap['type'] = markerTypeToStr(type);
    if(visibility != null) reqMap['visibility'] = markerVisibilityToStr(visibility);

    Map<String, dynamic> communities = {};
    if(addCommunity.isNotEmpty) communities['addByKey'] = addCommunity;
    if(editCommunity.isNotEmpty) communities['editByKey'] = editCommunity;
    if(removeCommunity.isNotEmpty) communities['removeByKey'] = removeCommunity;
    if(communities.isNotEmpty) reqMap['communities'] = communities;

    await API.sendRequest(
        withToken: true,
        requestSender: (Dio dio) async => dio.put(
            '${API.SERVER_URL}api/harcMap/$markerKey',
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            data: jsonEncode(reqMap)
        ),
        onSuccess: (Response response, DateTime now) async{
          MarkerRespBody markerRespBody = MarkerRespBody.fromMap(response.data);
          onSuccess?.call(markerRespBody);
        },
        onForceLoggedOut: onForceLoggedOut,
        onServerMaybeWakingUp: onServerMaybeWakingUp,
        onError: (_) async => onError?.call()
    );

  }

}