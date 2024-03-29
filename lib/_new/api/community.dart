import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:harcapp/_common_classes/common_contact_data.dart';
import 'package:harcapp/_new/api/forum.dart';
import 'package:harcapp/_new/cat_page_home/community/circle/model/announcement.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community_role.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/model/post.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community_manager.dart';
import 'package:optional/optional_internal.dart';
import 'package:tuple/tuple.dart';

import '../cat_page_home/community/community_publishable.dart';
import '../cat_page_home/community/model/community.dart';
import '../cat_page_home/community/model/community_category.dart';
import '_api.dart';

class CommunityManagerBody{

  final String key;
  final CommunityRole role;

  const CommunityManagerBody(this.key, this.role);

}

class CommunityManagerUpdateBody{

  final String key;
  final Optional<CommunityRole> role;

  const CommunityManagerUpdateBody(
      this.key,
      { this.role = const Optional.empty(),
      });

}

class CommunityManagerBodyNick extends CommunityManagerBody{

  final String nick;

  const CommunityManagerBodyNick(super.key, super.role, this.nick);

}

class ApiCommunity{

  static Future<Response?> search({
    required String phrase,
    required ForumSearchSort sort,
    int? page,
    int? pageSize,

    FutureOr<void> Function(List<CommunityPreviewData> communities)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async => await API.sendRequest(
    withToken: true,
    requestSender: (Dio dio) => dio.get(
      '${API.baseUrl}api/community/search',
      queryParameters: {
        "phrase": phrase,
        "sort": sort==ForumSearchSort.likes?
        'LIKES':
        'FOLLOWS',
        if(page != null) 'page': page,
        if(pageSize != null) 'pageSize': pageSize,
      }
    ),
    onSuccess: (Response response, DateTime now) async {

      List<CommunityPreviewData> result = [];
      for(Map map in response.data)
        result.add(CommunityPreviewData.fromRespMap(map));

      await onSuccess?.call(result);
    },
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (error) async => await onError?.call(),
  );

  static Future<Response?> getAll({
    FutureOr<void> Function(List<Community>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function(Response? response)? onError,
  }) async => await API.sendRequest(
    withToken: true,
    requestSender: (Dio dio) => dio.get(
        '${API.baseUrl}api/community',
    ),
    onSuccess: (Response response, DateTime now) async {
      List<Community> communityList = [];
      for(Map map in response.data)
        communityList.add(Community.fromRespMap(map));

      await onSuccess?.call(communityList);
    },
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (err) async => await onError?.call(err.response)
  );

  static Future<Response?> get({
    required String communityKey,
    FutureOr<void> Function(Community circle)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function(int?)? onError,
  }) async => await API.sendRequest(
    withToken: true,
    requestSender: (Dio dio) => dio.get(
        '${API.baseUrl}api/community/$communityKey',
    ),
    onSuccess: (Response response, DateTime now) async {
      Community community = Community.fromRespMap(response.data);
      await onSuccess?.call(community);
    },
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (error) async => await onError?.call(error.response?.statusCode),
  );

  static Future<Response?> create({
    required String name,
    required String iconKey,
    required CommunityCategory category,
    required CommonContactData? contact,

    FutureOr<void> Function(Community community)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async {

    Map<String, dynamic> reqMap = {};
    reqMap['name'] = name.trim();
    reqMap['iconKey'] = iconKey;
    reqMap['category'] = commCatToString(category);
    reqMap['contact'] = contact?.toMap();

    return API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.post(
          '${API.baseUrl}api/community',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }),
          data: jsonEncode(reqMap)
      ),
      onSuccess: (Response response, DateTime now) async{
        Community community = Community.fromRespMap(response.data);
        await onSuccess?.call(community);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (_) async => await onError?.call()
    );

  }

  static Future<Response?> update({
    required String circleKey,
    String? name,
    String? iconKey,
    CommunityCategory? category,
    Optional<Tuple2<CommonContactData?, CommonContactData?>> contact = const Optional.empty(),

    FutureOr<void> Function(Community community)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async{

    Map<String, dynamic> reqMap = {};
    if(name != null) reqMap['name'] = name.trim();
    if(iconKey != null) reqMap['iconKey'] = iconKey;
    if(category != null) reqMap['category'] = commCatToString(category);
    if(contact.isPresent){
      CommonContactData? oldContact = contact.value.item1;
      CommonContactData? newContact = contact.value.item2;
      reqMap['contact'] = newContact?.toUpdateMap(oldContact);
    }

    return API.sendRequest(
        withToken: true,
        requestSender: (Dio dio) => dio.put(
            '${API.baseUrl}api/community/$circleKey',
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            data: jsonEncode(reqMap)
        ),
        onSuccess: (Response response, DateTime now) async {
          if(onSuccess==null) return;
          Community community = Community.fromRespMap(response.data);
          onSuccess(community);
        },
        onForceLoggedOut: onForceLoggedOut,
        onServerMaybeWakingUp: onServerMaybeWakingUp,
        onError: (_) async => onError?.call()
    );

  }

  static Future<Response?> delete({
    required String communityKey,
    FutureOr<void> Function()? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.delete(
        '${API.baseUrl}api/community/$communityKey'
      ),
      onSuccess: (Response response, DateTime now) async => await onSuccess?.call(),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (DioError err) async => await onError?.call()
  );

  static Future<Response?> getManagers({
    required String communityKey,
    required int? pageSize,
    required CommunityRole? lastRole,
    required String? lastUserName,
    required String? lastUserKey,
    FutureOr<void> Function(List<CommunityManager>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.get(
          '${API.baseUrl}api/community/$communityKey/manager',
          queryParameters: {
            if(pageSize != null) 'pageSize': pageSize,
            if(lastRole != null) 'lastRole': communityRoleToStr[lastRole],
            if(lastUserName != null) 'lastUserName': lastUserName,
            if(lastUserKey != null) 'lastUserKey': lastUserKey,
          }
      ),
      onSuccess: (Response response, DateTime now) async {
        if(onSuccess == null) return;

        List<CommunityManager> managers = [];
        Map membersRespMap = response.data;
        for(MapEntry memEntry in membersRespMap.entries)
          managers.add(CommunityManager.fromRespMap(memEntry.value, key: memEntry.key));

        onSuccess(managers);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

  static Future<Response?> addManagers({
    required String communityKey,
    required List<CommunityManagerBodyNick> users,
    FutureOr<void> Function(List<CommunityManager>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async{

    List<Map<String, dynamic>> body = [];
    for(CommunityManagerBodyNick user in users)
      body.add({
        'userNick': user.nick,
        'role': communityRoleToStr[user.role],
      });

    return API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.post(
          '${API.baseUrl}api/community/$communityKey/manager',
          data: jsonEncode(body)
      ),
      onSuccess: (Response response, DateTime now) async {
        if(onSuccess == null) return;

        List<CommunityManager> addedManagers = [];
        Map managersRespMap = response.data;
        for(MapEntry managEntry in managersRespMap.entries)
          addedManagers.add(CommunityManager.fromRespMap(managEntry.value, key: managEntry.key));

        onSuccess(addedManagers);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
    );

  }

  static Future<Response?> updateManagers({
    required String communityKey,
    required List<CommunityManagerUpdateBody> users,
    FutureOr<void> Function(List<CommunityManager>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async{

    List<Map<String, dynamic>> body = [];
    for(CommunityManagerUpdateBody managerBody in users)
      body.add({
        'userKey': managerBody.key,
        if(managerBody.role.isPresent) 'role': communityRoleToStr[managerBody.role.value],
      });

    return API.sendRequest(
        withToken: true,
        requestSender: (Dio dio) => dio.put(
            '${API.baseUrl}api/community/$communityKey/manager',
            data: jsonEncode(body)
        ),
        onSuccess: (Response response, DateTime now) async {
          if(onSuccess == null) return;

          List<CommunityManager> updatedManagers = [];
          Map managersRespMap = response.data;
          for(MapEntry managerEntry in managersRespMap.entries)
            updatedManagers.add(CommunityManager.fromRespMap(managerEntry.value, key: managerEntry.key));

          onSuccess(updatedManagers);
        },
        onForceLoggedOut: onForceLoggedOut,
        onServerMaybeWakingUp: onServerMaybeWakingUp,
        onError: (err) async => onError?.call()
    );

  }

  static Future<Response?> removeManagers({
    required String communityKey,
    required List<String> userKeys,
    FutureOr<void> Function(List<String> removedKeys)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.delete(
          '${API.baseUrl}api/community/$communityKey/manager',
          data: jsonEncode(userKeys)
      ),
      onSuccess: (Response response, DateTime now) async =>
          await onSuccess?.call((response.data as List).cast<String>()),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => await onError?.call()
  );

  static Future<Response?> leave({
    required String communityKey,
    FutureOr<void> Function()? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.delete(
        '${API.baseUrl}api/community/$communityKey/leave',
      ),
      onSuccess: (Response response, DateTime now) async => await onSuccess?.call(),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => await onError?.call()
  );

  static Future<Response?> getFeed({
    int? page,
    int? pageSize,

    FutureOr<void> Function(List<CommunityPublishable>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.get(
          '${API.baseUrl}api/community/feed',
          queryParameters: {
            if(page != null) 'page': page,
            if(pageSize != null) 'pageSize': pageSize,
          }
      ),
      onSuccess: (Response response, DateTime now) async {

        List<CommunityPublishable> feed = [];
        for(Map map in response.data) {
          if(map.containsKey('circleKey'))
            feed.add(Announcement.fromRespMap(map, Community.allCircleMap![map['circleKey']]!, key: map['_key']));
          else
            feed.add(Post.fromRespMap(map, Community.allForumMap![map['forumKey']]!, key: map['_key']));
        }

        await onSuccess?.call(feed);

      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) => onError?.call()
  );

}