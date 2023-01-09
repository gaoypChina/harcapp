import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:harcapp/_common_classes/common_contact_data.dart';
import 'package:harcapp/_new/cat_page_harc_map/model/marker_type.dart';
import 'package:harcapp/_new/cat_page_harc_map/model/marker_visibility.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:optional/optional_internal.dart';
import 'package:tuple/tuple.dart';

import '../cat_page_harc_map/model/marker_data.dart';
import '../cat_page_harc_map/model/marker_manager.dart';
import '../cat_page_harc_map/model/marker_role.dart';
import '_api.dart';

class MarkerManagerRespBody{

  final String key;
  final MarkerRole role;

  const MarkerManagerRespBody(this.key, this.role);

}

class MarkerManagerUpdateBody{

  final String key;
  final Optional<MarkerRole> role;

  const MarkerManagerUpdateBody(
      this.key,
      { this.role = const Optional.empty(),
      });

}

class MarkerManagerRespBodyNick extends MarkerManagerRespBody{

  final String nick;

  const MarkerManagerRespBodyNick(super.key, super.role, this.nick);

}

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
        MarkerData markerRespBody = MarkerData.fromRespMap(map);
        markerDataList.add(markerRespBody);
      }

      onSuccess?.call(markerDataList);
    },
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (err) async => onError?.call(err.response)
  );

  static Future<Response?> create({
    required String? name,
    required CommonContactData? contact,
    required double lat,
    required double lng,
    required MarkerType type,
    required MarkerVisibility visibility,
    required Map<String, String>? communityKeys, // {key: note}

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
            if(contact != null) 'contact': contact.toMap(),
            'lat': lat,
            'lng': lng,
            'type': markerTypeToStr(type),
            'visibility': markerVisibilityToStr(visibility),
            if(communityKeys != null) 'communities': communityKeys
          })
      ),
      onSuccess: (Response response, DateTime now) async{
        MarkerData markerData = MarkerData.fromRespMap(response.data);
        onSuccess?.call(markerData);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (_) async => onError?.call()
  );

  static Future<Response?> update({
    required String markerKey,
    Optional<String>? name,
    Optional<Tuple2<CommonContactData?, CommonContactData?>>? contact,
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
    if(name != null) reqMap['name'] = name.orElseNull?.trim();
    if(contact != null){
      CommonContactData? oldContact = contact.orElseNull?.item1;
      CommonContactData? newContact = contact.orElseNull?.item2;
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

    return await API.sendRequest(
        withToken: true,
        requestSender: (Dio dio) async => dio.put(
            '${API.SERVER_URL}api/harcMap/$markerKey',
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            data: jsonEncode(reqMap)
        ),
        onSuccess: (Response response, DateTime now) async{
          MarkerData markerData = MarkerData.fromRespMap(response.data);
          onSuccess?.call(markerData);
        },
        onForceLoggedOut: onForceLoggedOut,
        onServerMaybeWakingUp: onServerMaybeWakingUp,
        onError: (_) async => onError?.call()
    );

  }

  static Future<Response?> delete({
    required String markerKey,

    FutureOr<void> Function()? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async {

    return await API.sendRequest(
        withToken: true,
        requestSender: (Dio dio) async => dio.delete(
            '${API.SERVER_URL}api/harcMap/$markerKey',
        ),
        onSuccess: (Response response, DateTime now) => onSuccess?.call(),
        onForceLoggedOut: onForceLoggedOut,
        onServerMaybeWakingUp: onServerMaybeWakingUp,
        onError: (_) async => onError?.call()
    );

  }

  static Future<Response?> getManagers({
    required String markerKey,
    required int? pageSize,
    required MarkerRole? lastRole,
    required String? lastUserName,
    required String? lastUserKey,
    FutureOr<void> Function(List<MarkerManager>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async{

    return API.sendRequest(
        withToken: true,
        requestSender: (Dio dio) => dio.get(
            '${API.SERVER_URL}api/harcMap/$markerKey/manager',
            queryParameters: {
              if(pageSize != null) 'pageSize': pageSize,
              if(lastRole != null) 'lastRole': markerRoleToStr[lastRole],
              if(lastUserName != null) 'lastUserName': lastUserName,
              if(lastUserKey != null) 'lastUserKey': lastUserKey,
            }
        ),
        onSuccess: (Response response, DateTime now) async {
          if(onSuccess == null) return;

          List<MarkerManager> managers = [];
          Map membersRespMap = response.data;
          for(MapEntry memEntry in membersRespMap.entries)
            managers.add(MarkerManager.fromRespMap(memEntry.value, key: memEntry.key));

          onSuccess(managers);
        },
        onForceLoggedOut: onForceLoggedOut,
        onServerMaybeWakingUp: onServerMaybeWakingUp,
        onError: (err) async => onError?.call()
    );

  }

  static Future<Response?> addManagers({
    required String markerKey,
    required List<MarkerManagerRespBodyNick> users,
    FutureOr<void> Function(List<MarkerManager>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async{

    List<Map<String, dynamic>> body = [];
    for(MarkerManagerRespBodyNick user in users)
      body.add({
        'userNick': user.nick,
        'role': markerRoleToStr[user.role],
      });

    return API.sendRequest(
        withToken: true,
        requestSender: (Dio dio) => dio.post(
            '${API.SERVER_URL}api/harcMap/$markerKey/manager',
            data: jsonEncode(body)
        ),
        onSuccess: (Response response, DateTime now) async {
          if(onSuccess == null) return;

          List<MarkerManager> managers = [];
          Map membersRespMap = response.data;
          for(MapEntry memEntry in membersRespMap.entries)
            managers.add(MarkerManager.fromRespMap(memEntry.value, key: memEntry.key));

          onSuccess(managers);
        },
        onForceLoggedOut: onForceLoggedOut,
        onServerMaybeWakingUp: onServerMaybeWakingUp,
        onError: (err) async => onError?.call()
    );

  }

  static Future<Response?> updateManagers({
    required String markerKey,
    required List<MarkerManagerUpdateBody> users,
    FutureOr<void> Function(List<MarkerManager>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async{

    List<Map<String, dynamic>> body = [];
    for(MarkerManagerUpdateBody managerBody in users)
      body.add({
        'userKey': managerBody.key,
        if(managerBody.role.isPresent) 'role': markerRoleToStr[managerBody.role.value],
      });

    return API.sendRequest(
        withToken: true,
        requestSender: (Dio dio) => dio.put(
            '${API.SERVER_URL}api/harcMap/$markerKey/manager',
            data: jsonEncode(body)
        ),
        onSuccess: (Response response, DateTime now) async {
          if(onSuccess == null) return;

          List<MarkerManager> managers = [];
          Map managersRespMap = response.data;
          for(MapEntry managerEntry in managersRespMap.entries)
            managers.add(MarkerManager.fromRespMap(managerEntry.value, key: managerEntry.key));

          onSuccess(managers);
        },
        onForceLoggedOut: onForceLoggedOut,
        onServerMaybeWakingUp: onServerMaybeWakingUp,
        onError: (err) async => onError?.call()
    );

  }

  static Future<Response?> removeManagers({
    required String markerKey,
    required List<String> userKeys,
    FutureOr<void> Function(List<String> removedKeys)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.delete(
          '${API.SERVER_URL}api/harcMap/$markerKey/manager',
          data: jsonEncode(userKeys)
      ),
      onSuccess: (Response response, DateTime now) =>
          onSuccess?.call((response.data as List).cast<String>()),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

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
          communities.add(Tuple2(CommunityPreviewData.fromRespMap(resp), resp["note"] as String?));
        onSuccess?.call(communities);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (_) async => onError?.call()
  );

}