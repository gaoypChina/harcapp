import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:harcapp/_common_classes/common_contact_data.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_type.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_visibility.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:optional/optional_internal.dart';
import 'package:tuple/tuple.dart';

import '../cat_page_harc_map/marker_data.dart';
import '_api.dart';

class ApiHarcMap{

  static Future<Response?> getAllMarkers({
    bool publicOnly = false,
    FutureOr<void> Function(List<MarkerData>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function(Response? response)? onError,
  }) async => await API.sendRequest(
    withToken: !publicOnly,
    requestSender: (Dio dio) => dio.get(
        '${API.SERVER_URL}api/harcMap${publicOnly?'/public':''}',
    ),
    onSuccess: (Response response, DateTime now) async {
      List<MarkerData> markerDataList = [];
      for(Map map in response.data) {
        MarkerData markerRespBody = MarkerData.fromMap(map);
        markerDataList.add(markerRespBody);
      }

      onSuccess?.call(markerDataList);
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

    FutureOr<void> Function(MarkerData marker)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
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
        MarkerData markerData = MarkerData.fromMap(response.data);
        onSuccess?.call(markerData);
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

    FutureOr<void> Function(MarkerData marker)? onSuccess,
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
          MarkerData markerData = MarkerData.fromMap(response.data);
          onSuccess?.call(markerData);
        },
        onForceLoggedOut: onForceLoggedOut,
        onServerMaybeWakingUp: onServerMaybeWakingUp,
        onError: (_) async => onError?.call()
    );

  }

  static Future<Response?> getCommunitiesOfMarker({
    required String markerKey,

    FutureOr<void> Function(List<Tuple2<CommunityPreviewData, String?>> communities)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) async => dio.get(
          '${API.SERVER_URL}api/harcMap/$markerKey/communities',
      ),
      onSuccess: (Response response, DateTime now) async{
        List<Tuple2<CommunityPreviewData, String?>> communities = [];

        for(Map<String, dynamic> resp in response.data as List)
          communities.add(Tuple2(CommunityPreviewData.fromResponse(resp), resp["note"] as String?));
        onSuccess?.call(communities);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (_) async => onError?.call()
  );

}