import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:optional/optional_internal.dart';

import '../cat_page_home/community/circle/circle_role.dart';
import '../cat_page_home/community/circle/model/announcement.dart';
import '../cat_page_home/community/circle/model/announcement_attendace.dart';
import '../cat_page_home/community/circle/model/announcement_attendance_resp.dart';
import '../cat_page_home/community/circle/model/announcement_attendance_resp_mode.dart';
import '../cat_page_home/community/circle/model/circle.dart';
import '../cat_page_home/community/circle/model/member.dart';
import '../cat_page_home/community/common/community_cover_image_data.dart';
import '../cat_page_home/community/model/community.dart';
import '_api.dart';

class MemberRespBody{

  final String key;
  final CircleRole role;
  final String? patrol;

  const MemberRespBody(this.key, this.role, this.patrol);

}

class MemberUpdateBody{

  final String key;
  final CircleRole? role;
  final Optional<String>? patrol;

  const MemberUpdateBody(
      this.key,
      { this.role,
        this.patrol
      });

}

class MemberRespBodyNick extends MemberRespBody{

  final String nick;

  const MemberRespBodyNick(super.key, super.role, super.patrol, this.nick);

}

class ApiCircle{

  static Future<Response?> getAll({
    FutureOr<void> Function(List<Circle>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function(Response? response)? onError,
  }) async => await API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) => dio.get(
        '${API.SERVER_URL}api/circle',
    ),
    onSuccess: (Response response, DateTime now) async {
      List<Circle> circleList = [];
      for(Map map in response.data) {
        Community community = Community.fromResponse(map['community']);
        Circle circle = Circle.fromResponse(map['circle'], community);
        circleList.add(circle);
      }

      onSuccess?.call(circleList);
    },
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (err) async => onError?.call(err.response)
  );

  static Future<Response?> get({
    required String circleKey,
    required CommunityBasicData community,
    FutureOr<void> Function(Circle circle)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function(int?)? onError,
  }) async => await API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) => dio.get(
        '${API.SERVER_URL}api/circle/$circleKey',
    ),
    onSuccess: (Response response, DateTime now) async {
      Circle circle = Circle.fromResponse(response.data, community);
      onSuccess?.call(circle);
    },
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (error) async => onError?.call(error.response?.statusCode),
  );

  static Future<Response?> create({
    required String description,
    required CommunityCoverImageData coverImage,
    required String? colorsKey,
    required CommunityBasicData community,

    FutureOr<void> Function(Circle circle)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<bool> Function()? onImageDBWakingUp,
    FutureOr<void> Function()? onError,
  }) async {

    return API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) async => dio.post(
          '${API.SERVER_URL}api/circle',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }),
          data: jsonEncode({
            'communityKey': community.key,
            'description': description.trim(),
            'coverImage': await coverImage.toReqMap(),
            'colorsKey': colorsKey
          })
      ),
      onSuccess: (Response response, DateTime now) async{
        Circle circle = Circle.fromResponse(response.data, community);
        onSuccess?.call(circle);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onImageDBWakingUp: onImageDBWakingUp,
      onError: (_) async => onError?.call()
    );

  }

  static Future<Response?> delete({
    required String circleKey,
    FutureOr<void> Function()? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
        '${API.SERVER_URL}api/circle/$circleKey'
      ),
      onSuccess: (Response response, DateTime now) async => onSuccess?.call(),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (DioError err) async => onError?.call()
  );

  static Future<Response?> resetShareCode({
    required String circleKey,
    FutureOr<void> Function(String)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function(dynamic)? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.get(
        '${API.SERVER_URL}api/circle/$circleKey/shareCode',
      ),
      onSuccess: (Response response, DateTime now) async => onSuccess?.call(response.data),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (DioError err) async => onError?.call(err.response!.data)
  );

  static Future<Response?> setShareCodeSearchable({
    required String compKey,
    required bool searchable,
    FutureOr<void> Function(bool)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.post(
        '${API.SERVER_URL}api/circle/$compKey/shareCodeSearchable',
        data: FormData.fromMap({'searchable': searchable}),
      ),
      onSuccess: (Response response, DateTime now) async => onSuccess?.call(response.data['shareCodeSearchable']),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (DioError err) async => onError?.call()
  );

  static Future<Response?> joinByShareCode({
    required String searchCode,
    FutureOr<void> Function(Circle, bool)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.get(
        '${API.SERVER_URL}api/circle/joinByShareCode/$searchCode',
      ),
      onSuccess: (Response response, DateTime now) async {
        Community? community = Community.allMap![response.data['community']['_key']];
        Circle circle;
        bool newCommunityAdded;
        if(community == null) {
          newCommunityAdded = true;
          community = Community.fromResponse(response.data['community']);
          circle = Circle.fromResponse(response.data['circle'], community);
          Community.addToAll(community, mapCircle: false);
          community.setCircle(circle);
        }else{
          newCommunityAdded = false;
          circle = Circle.fromResponse(response.data['circle'], community);
          community.setCircle(circle);
        }

        onSuccess?.call(circle, newCommunityAdded);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (DioError err) async => onError?.call()
  );

  static Future<Response?> update({
    required String circleKey,
    required CommunityBasicData community,
    Optional<String>? description,
    CommunityCoverImageData? coverImage,
    String? colorsKey,
    FutureOr<void> Function(Circle circle)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<bool> Function()? onImageDBWakingUp,
    FutureOr<void> Function()? onError,
  }) async{

    Map<String, dynamic> reqMap = {};
    if(description != null) reqMap['description'] = description.orElseNull?.trim();

    if(coverImage != null)
      reqMap['coverImage'] = await coverImage.toReqMap();

    if(colorsKey != null) reqMap['colorsKey'] = colorsKey;

    return API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.put(
        '${API.SERVER_URL}api/circle/$circleKey',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
        data: jsonEncode(reqMap)
      ),
      onSuccess: (Response response, DateTime now) async {
        if(onSuccess==null) return;
        Circle circle = Circle.fromResponse(response.data, community);
        onSuccess(circle);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onImageDBWakingUp: onImageDBWakingUp,
      onError: (_) async => onError?.call()
    );

  }
  
  static Future<Response?> addMembers({
    required String circleKey,
    required List<MemberRespBodyNick> users,
    FutureOr<void> Function(List<Member>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async{

    List<Map<String, dynamic>> body = [];
    for(MemberRespBodyNick user in users)
      body.add({
        'userNick': user.nick,
        'role': circleRoleToStr[user.role],
      });

    return API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.post(
          '${API.SERVER_URL}api/circle/$circleKey/member',
          data: jsonEncode(body)
      ),
      onSuccess: (Response response, DateTime now) async {
        if(onSuccess == null) return;

        List<Member> members = [];
        Map membersRespMap = response.data;
        for(MapEntry memEntry in membersRespMap.entries)
          members.add(Member.fromMap(memEntry.value, key: memEntry.key));

        onSuccess(members);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
    );

  }

  static Future<Response?> updateMembers({
    required String circleKey,
    required List<MemberUpdateBody> users,
    FutureOr<void> Function(List<Member>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async{

    List<Map<String, dynamic>> body = [];
    for(MemberUpdateBody memBody in users)
      body.add({
        'userKey': memBody.key,
        if(memBody.role != null) 'role': circleRoleToStr[memBody.role],
        if(memBody.patrol != null) 'patrol': memBody.patrol!.orElseNull
      });

    return API.sendRequest(
        withToken: true,
        sendRequest: (Dio dio) => dio.put(
            '${API.SERVER_URL}api/circle/$circleKey/member',
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            data: jsonEncode(body)
        ),
        onSuccess: (Response response, DateTime now) async {
          if(onSuccess == null) return;

          List<Member> particips = [];
          Map participsRespMap = response.data;
          for(MapEntry participEntry in participsRespMap.entries)
            particips.add(Member.fromMap(participEntry.value, key: participEntry.key));

          onSuccess(particips);
        },
        onForceLoggedOut: onForceLoggedOut,
        onServerMaybeWakingUp: onServerMaybeWakingUp,
        onError: (err) async => onError?.call()
    );

  }

  static Future<Response?> removeMembers({
    required String circleKey,
    required List<String> userKeys,
    FutureOr<void> Function(List<String> removedKeys)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
          '${API.SERVER_URL}api/circle/$circleKey/member',
          data: jsonEncode(userKeys)
      ),
      onSuccess: (Response response, DateTime now) =>
          onSuccess?.call((response.data as List).cast<String>()),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

  static Future<Response?> leave({
    required String circleKey,
    FutureOr<void> Function()? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
        '${API.SERVER_URL}api/circle/$circleKey/leave',
      ),
      onSuccess: (Response response, DateTime now) async => onSuccess?.call(),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

  static Future<Response?> getCircleAnnouncements({
    required String circleKey,
    int? page,
    int? pageSize,
    bool pinnedOnly = false,
    bool awaitingOnly = false,

    FutureOr<void> Function(List<Announcement>, bool pinnedOnly, bool awaitingOnly)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.get(
          '${API.SERVER_URL}api/circle/$circleKey/announcement',
          queryParameters: {
            if(page != null) 'page': page,
            if(pageSize != null) 'pageSize': pageSize,
            'pinnedOnly': pinnedOnly,
            'awaitingOnly': awaitingOnly
          }
      ),
      onSuccess: (Response response, DateTime now) async {

        List<Announcement> result = [];
        for(String key in (response.data as Map).keys)
          result.add(Announcement.fromMap(response.data[key], Community.allCircleMap![circleKey]!, key: key));

        onSuccess?.call(result, pinnedOnly, awaitingOnly);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

  static Future<Response?> publishAnnouncement({
    required String circleKey,
    String? title,
    DateTime? startTime,
    DateTime? endTime,
    String? place,
    String? urlToPreview,
    CommunityCoverImageData? coverImage,
    required String text,
    required AnnouncementAttendanceRespMode respMode,

    FutureOr<void> Function(Announcement)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<bool> Function()? onImageDBWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) async => await dio.post(
        '${API.SERVER_URL}api/circle/$circleKey/announcement',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
        data: jsonEncode({
          'title': title,
          if(startTime != null) 'startTimeStr': startTime.toIso8601String(),
          if(endTime != null) 'endTimeStr': endTime.toIso8601String(),
          if(place != null) 'place': place,
          if(urlToPreview != null) 'urlToPreview': urlToPreview,
          if(coverImage != null)
            'coverImage': await coverImage.toReqMap(),

          'text': text,
          'attendanceRespMode': announcementAttendanceRespModeToStr[respMode],
        })
      ),
      onSuccess: (Response response, DateTime now) async =>
          onSuccess?.call(Announcement.fromMap(response.data, Community.allCircleMap![circleKey]!)),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onImageDBWakingUp: onImageDBWakingUp,
      onError: (err) async => onError?.call()
  );

  static Future<Response?> updateAnnouncement({
    required Announcement announcement,
    Optional<String>? title,
    Optional<DateTime>? startTime,
    Optional<DateTime>? endTime,
    Optional<String>? place,
    Optional<String>? urlToPreview,
    Optional<CommunityCoverImageData>? coverImage,
    String? text,
    AnnouncementAttendanceRespMode? respMode,

    FutureOr<void> Function(Announcement)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<bool> Function()? onImageDBWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) async => dio.put(
        '${API.SERVER_URL}api/announcement/${announcement.key}',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
        data: jsonEncode({

          if(title != null) 'title': title.orElseNull,

          if(startTime != null) "startTimeStr": startTime.orElseNull,

          if(endTime != null) "endTimeStr": endTime.orElseNull,

          if(place != null) 'place': place.orElseNull,

          if(urlToPreview != null) 'urlToPreview': urlToPreview.orElseNull,

          if(coverImage != null) 'coverImage': await coverImage.orElseNull?.toReqMap(),

          if(text != null) 'text': text,

          if(respMode != null) 'attendanceRespMode': announcementAttendanceRespModeToStr[respMode]

        })
      ),
      onSuccess: (Response response, DateTime now) async =>
          onSuccess?.call(Announcement.fromMap(response.data, announcement.circle)),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onImageDBWakingUp: onImageDBWakingUp,
      onError: (err) async => onError?.call()
  );

  static Future<Response?> pinAnnouncement({
    required String annKey,
    required bool pin,
    FutureOr<void> Function(bool)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.put(
        '${API.SERVER_URL}api/announcement/$annKey/pin',
        data: FormData.fromMap({
          'pin': pin,
        }),
      ),
      onSuccess: (Response response, DateTime now) async =>
          onSuccess?.call(response.data),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

  static Future<Response?> deleteAnnouncement({
    required String annKey,
    FutureOr<void> Function()? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
        '${API.SERVER_URL}api/announcement/$annKey',
      ),
      onSuccess: (Response response, DateTime now) async =>
          onSuccess?.call(),
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onForceLoggedOut: onForceLoggedOut,
      onError: (err) async => onError?.call()
  );

  static Future<Response?> updateAnnouncementAttendanceResponse({
    required String annKey,
    String? memberKey,
    required AnnouncementAttendance response,
    String? responseReason,
    DateTime? postponeResponseTime,
    FutureOr<void> Function(AnnouncementAttendanceResp, DateTime)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.put(
        '${API.SERVER_URL}api/announcement/$annKey/response',
        data: FormData.fromMap({
          'memberKey': memberKey,
          'response': announcementAttendanceToStr[response],
          'responseReason': responseReason,
          'postponeResponseTime': postponeResponseTime?.toIso8601String(),
        }),
      ),
      onSuccess: (Response response, DateTime now) async =>
          onSuccess?.call(AnnouncementAttendanceResp.fromResponse(response.data), now),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

  static Future<Response?> waiveResponse({
    required String annKey,
    required String memberKey,
    required bool waive,
    FutureOr<void> Function(bool, DateTime)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.put(
        '${API.SERVER_URL}api/announcement/$annKey/waiveResponse',
        data: FormData.fromMap({
          'memberKey': memberKey,
          'waive': waive,
        }),
      ),
      onSuccess: (Response response, DateTime now) async =>
          onSuccess?.call(response.data, now),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

  static Future<Response?> bindIndivComp({
    required String circleKey,
    required String indivCompKey,
    FutureOr<void> Function()? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.put(
        '${API.SERVER_URL}api/circle/$circleKey/bindComp',
        data: FormData.fromMap({
          'compKey': indivCompKey,
        }),
      ),
      onSuccess: (Response response, DateTime now) async => onSuccess?.call(),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

  static Future<Response?> deleteIndivCompBind({
    required String circleKey,
    required String indivCompKey,
    FutureOr<void> Function()? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
        '${API.SERVER_URL}api/circle/$circleKey/bindComp',
        data: FormData.fromMap({
          'compKey': indivCompKey,
        }),
      ),
      onSuccess: (Response response, DateTime now) async => onSuccess?.call(),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

}