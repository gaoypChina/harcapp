import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_image_data.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/forum_role.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/model/forum.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/model/forum_manager.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/model/post.dart';
import 'package:optional/optional_internal.dart';

import '../cat_page_home/community/model/community.dart';
import '_api.dart';

class ForumManagerRespBody{

  final String key;
  final ForumRole role;

  const ForumManagerRespBody(this.key, this.role);

}

class ForumManagerUpdateBody{

  final String key;
  final ForumRole? role;

  const ForumManagerUpdateBody(
      this.key,
      { this.role });

}

class ForumManagerRespBodyNick extends ForumManagerRespBody{

  final String nick;

  const ForumManagerRespBodyNick(super.key, super.role, this.nick);

}

enum ForumSearchSort{
  likes,
  follows
}

class ApiForum{

  static Future<Response?> getAll({
    FutureOr<void> Function(List<Forum>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function(Response? response)? onError,
  }) async => await API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) => dio.get(
        '${API.SERVER_URL}api/forum',
    ),
    onSuccess: (Response response, DateTime now) async {
      List<Forum> forumList = [];
      for(Map map in response.data) {
        Community community = Community.fromResponse(map['community']);
        Forum forum = Forum.fromResponse(map['forum'], community);
        forumList.add(forum);
      }

      onSuccess?.call(forumList);
    },
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (err) async => onError?.call(err.response)
  );

  static Future<Response?> get({
    required String forumKey,
    required CommunityBasicData community,
    FutureOr<void> Function(Forum forum)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function(int?)? onError,
  }) async => await API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) => dio.get(
        '${API.SERVER_URL}api/forum/$forumKey',
    ),
    onSuccess: (Response response, DateTime now) async {
      Forum forum = Forum.fromResponse(response.data, community);
      onSuccess?.call(forum);
    },
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (error) async => onError?.call(error.response?.statusCode),
  );

  static Future<Response?> create({
    required String? description,
    required CommunityCoverImageData coverImage,
    required String colorsKey,
    required CommunityBasicData community,

    FutureOr<void> Function(Forum forum)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async {

    return API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) async => dio.post(
          '${API.SERVER_URL}api/forum',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }),
          data: jsonEncode({
            'communityKey': community.key,
            'description': description?.trim(),
            'coverImage': await coverImage.toReqMap(),
            'colorsKey': colorsKey
          })
      ),
      onSuccess: (Response response, DateTime now) async{
        Forum forum = Forum.fromResponse(response.data, community);
        onSuccess?.call(forum);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (_) async => onError?.call()
    );

  }

  static Future<Response?> delete({
    required String forumKey,
    FutureOr<void> Function()? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
        '${API.SERVER_URL}api/forum/$forumKey'
      ),
      onSuccess: (Response response, DateTime now) async => onSuccess?.call(),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (DioError err) async => onError?.call()
  );

  static Future<Response?> update({
    required String forumKey,
    required CommunityBasicData community,
    Optional<String>? description,
    CommunityCoverImageData? coverImage,
    String? colorsKey,
    FutureOr<void> Function(Forum forum)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async{

    Map<String, dynamic> reqMap = {};
    if(description != null) reqMap['description'] = description.orElseNull?.trim();
    if(coverImage != null) reqMap['coverImage'] = await coverImage.toReqMap();
    if(colorsKey != null) reqMap['colorsKey'] = colorsKey;

    return API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.put(
        '${API.SERVER_URL}api/forum/$forumKey',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
        data: jsonEncode(reqMap)
      ),
      onSuccess: (Response response, DateTime now) async {
        if(onSuccess==null) return;
        Forum forum = Forum.fromResponse(response.data, community);
        onSuccess(forum);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (_) async => onError?.call()
    );

  }

  static Future<Response?> likeForum({
    required String forumKey,
    required bool like,
    FutureOr<void> Function(bool like)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.put(
          '${API.SERVER_URL}api/forum/$forumKey/like',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }),
          data: FormData.fromMap({'like': like})
      ),
      onSuccess: (Response response, DateTime now) async {
        if(onSuccess==null) return;
        onSuccess(response.data);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (_) async => onError?.call()
  );

  static Future<Response?> followForum({
    required String forumKey,
    required bool follow,
    FutureOr<void> Function(bool follow)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async{

    return API.sendRequest(
        withToken: true,
        sendRequest: (Dio dio) => dio.put(
            '${API.SERVER_URL}api/forum/$forumKey/follow',
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            data: FormData.fromMap({'follow': follow})
        ),
        onSuccess: (Response response, DateTime now) async {
          if(onSuccess==null) return;
          onSuccess(response.data);
        },
        onForceLoggedOut: onForceLoggedOut,
        onServerMaybeWakingUp: onServerMaybeWakingUp,
        onError: (_) async => onError?.call()
    );

  }

  static Future<Response?> addManagers({
    required String forumKey,
    required List<ForumManagerRespBodyNick> users,
    FutureOr<void> Function(List<ForumManager>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async{

    List<Map<String, dynamic>> body = [];
    for(ForumManagerRespBodyNick user in users)
      body.add({
        'userNick': user.nick,
        'role': forumRoleToStr[user.role],
      });

    return API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.post(
          '${API.SERVER_URL}api/forum/$forumKey/manager',
          data: jsonEncode(body)
      ),
      onSuccess: (Response response, DateTime now) async {
        if(onSuccess == null) return;

        List<ForumManager> managers = [];
        Map managersRespMap = response.data;
        for(MapEntry managerEntry in managersRespMap.entries)
          managers.add(ForumManager.fromMap(managerEntry.value, key: managerEntry.key));

        onSuccess(managers);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
    );

  }

  static Future<Response?> updateManagers({
    required String forumKey,
    required List<ForumManagerUpdateBody> users,
    FutureOr<void> Function(List<ForumManager>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async{

    List<Map<String, dynamic>> body = [];
    for(ForumManagerUpdateBody managerBody in users)
      body.add({
        'userKey': managerBody.key,
        if(managerBody.role != null) 'role': forumRoleToStr[managerBody.role],
      });

    return API.sendRequest(
        withToken: true,
        sendRequest: (Dio dio) => dio.put(
            '${API.SERVER_URL}api/forum/$forumKey/manager',
            data: jsonEncode(body)
        ),
        onSuccess: (Response response, DateTime now) async {
          if(onSuccess == null) return;

          List<ForumManager> managers = [];
          Map managersRespMap = response.data;
          for(MapEntry participEntry in managersRespMap.entries)
            managers.add(ForumManager.fromMap(participEntry.value, key: participEntry.key));

          onSuccess(managers);
        },
        onForceLoggedOut: onForceLoggedOut,
        onServerMaybeWakingUp: onServerMaybeWakingUp,
        onError: (err) async => onError?.call()
    );

  }

  static Future<Response?> removeManagers({
    required String forumKey,
    required List<String> userKeys,
    FutureOr<void> Function(List<String> removedKeys)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
          '${API.SERVER_URL}api/forum/$forumKey/manager',
          data: jsonEncode(userKeys)
      ),
      onSuccess: (Response response, DateTime now) =>
          onSuccess?.call((response.data as List).cast<String>()),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

  static Future<Response?> getForumPosts({
    required String forumKey,
    int? page,
    int? pageSize,

    FutureOr<void> Function(List<Post>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.get(
          '${API.SERVER_URL}api/forum/$forumKey/post',
          queryParameters: {
            if(page != null) 'page': page,
            if(pageSize != null) 'pageSize': pageSize,
          }
      ),
      onSuccess: (Response response, DateTime now) async {

        List<Post> result = [];
        for(String key in (response.data as Map).keys)
          result.add(Post.fromMap(response.data[key], Community.allForumMap![forumKey]!, key: key));

        onSuccess?.call(result);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

  static Future<Response?> publishPost({
    required String forumKey,
    required String title,
    String? urlToPreview,
    CommunityCoverImageData? coverImage,
    required String text,

    FutureOr<void> Function(Post)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) async => dio.post(
        '${API.SERVER_URL}api/forum/$forumKey/post',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
        data: jsonEncode({
          'title': title,
          if(urlToPreview != null) 'urlToPreview': urlToPreview,
          if(coverImage != null)
            'coverImage': await coverImage.toReqMap(),
          'text': text,
        }),
      ),
      onSuccess: (Response response, DateTime now) async =>
          onSuccess?.call(Post.fromMap(response.data, Community.allForumMap![forumKey]!)),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

  static Future<Response?> updatePost({
    required Post post,
    Optional<String>? title,
    Optional<String>? urlToPreview,
    Optional<CommunityCoverImageData>? coverImage,
    String? text,

    FutureOr<void> Function(Post)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) async => dio.put(
        '${API.SERVER_URL}api/post/${post.key}',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
        data: jsonEncode({

          if(title != null) 'title': title.orElseNull,

          if(urlToPreview != null) 'urlToPreview': urlToPreview.orElseNull,

          if(coverImage != null)
            'coverImage': await coverImage.orElseNull?.toReqMap(),

          if(text != null) 'text': text,

        })
      ),
      onSuccess: (Response response, DateTime now) async =>
          onSuccess?.call(Post.fromMap(response.data, post.forum)),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

  static Future<Response?> deletePost({
    required String postKey,
    FutureOr<void> Function()? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
        '${API.SERVER_URL}api/post/$postKey',
      ),
      onSuccess: (Response response, DateTime now) async =>
          onSuccess?.call(),
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onForceLoggedOut: onForceLoggedOut,
      onError: (err) async => onError?.call()
  );

}