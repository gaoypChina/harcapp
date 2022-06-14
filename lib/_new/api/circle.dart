import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/announcement_attendace.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/announcement_attendance_resp.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/announcement_attendance_resp_mode.dart';
import 'package:optional/optional_internal.dart';

import '../cat_page_home/circles/circle_role.dart';
import '../cat_page_home/circles/model/announcement.dart';
import '../cat_page_home/circles/model/circle.dart';
import '../cat_page_home/circles/model/member.dart';
import '_api.dart';

class MemberRespBody{

  final String key;
  final CircleRole role;
  final String? patrol;

  const MemberRespBody(this.key, this.role, this.patrol);

}

class MemberUpdateBody{

  final String key;
  final Optional<CircleRole> role;
  final Optional<String?> patrol;

  const MemberUpdateBody(
      this.key,
      { this.role = const Optional.empty(),
        this.patrol = const Optional.empty()
      });

}

class MemberRespBodyNick extends MemberRespBody{

  final String nick;

  const MemberRespBodyNick(super.key, super.role, super.patrol, this.nick);

}

class ApiCircle{

  static Future<Response?> getAll({
    void Function(List<Circle>)? onSuccess,
    Future<bool> Function()? notAuthorized,
    void Function(Response? response)? onError,
  }) async => await API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) => dio.get(
        '${API.SERVER_URL}api/circle',
    ),
    onSuccess: (Response response, DateTime now) async {
      List<Circle> circleList = [];
      for(Map map in response.data)
        circleList.add(Circle.fromResponse(map));

      onSuccess?.call(circleList);
    },
    onError: (err) async => onError?.call(err.response)
  );

  static Future<Response?> get({
    required String circleKey,
    void Function(Circle circle)? onSuccess,
    void Function()? onError,
  }) async => await API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) => dio.get(
        '${API.SERVER_URL}api/circle/$circleKey',
    ),
    onSuccess: (Response response, DateTime now) async {
      Circle circle = Circle.fromResponse(response.data);
      onSuccess?.call(circle);
    },
    onError: (_) async => onError!(),
  );

  static Future<Response?> create({
    required String name,
    required String description,
    required String? coverImageUrl,
    required String? colorsKey,

    void Function(Circle circle)? onSuccess,
    void Function()? onError,
  }) async {

    Map<String, dynamic> reqMap = {};
    reqMap['name'] = name.trim();
    reqMap['description'] = description.trim();
    reqMap['coverImageUrl'] = coverImageUrl;
    reqMap['colorsKey'] = colorsKey;

    return API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.post(
          '${API.SERVER_URL}api/circle',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }),
          data: jsonEncode(reqMap)
      ),
      onSuccess: (Response response, DateTime now) async{
        Circle circle = Circle.fromResponse(response.data);
        onSuccess?.call(circle);
      },
      onError: (_) async => onError?.call()
    );

  }

  static Future<Response?> delete({
    required String circleKey,
    void Function()? onSuccess,
    void Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
        '${API.SERVER_URL}api/circle/$circleKey'
      ),
      onSuccess: (Response response, DateTime now) async => onSuccess?.call(),
      onError: (DioError err) async => onError?.call()
  );

  static Future<Response?> resetShareCode({
    required String compKey,
    void Function(String)? onSuccess,
    void Function(Map?)? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.get(
        '${API.SERVER_URL}api/circle/$compKey/shareCode',
      ),
      onSuccess: (Response response, DateTime now) async => onSuccess?.call(response.data),
      onError: (DioError err) async => onError?.call(err.response!.data)
  );

  static Future<Response?> setShareCodeSearchable({
    required String compKey,
    required bool searchable,
    void Function(bool)? onSuccess,
    void Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.post(
        '${API.SERVER_URL}api/circle/$compKey/shareCodeSearchable',
        data: FormData.fromMap({'searchable': searchable}),
      ),
      onSuccess: (Response response, DateTime now) async => onSuccess?.call(response.data['shareCodeSearchable']),
      onError: (DioError err) async => onError?.call()
  );

  static Future<Response?> joinByShareCode({
    required String searchCode,
    void Function(Circle)? onSuccess,
    void Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.get(
        '${API.SERVER_URL}api/circle/joinByShareCode/$searchCode',
      ),
      onSuccess: (Response response, DateTime now) async {
        Circle comp = Circle.fromResponse(response.data);
        onSuccess?.call(comp);
      },
      onError: (DioError err) async => onError?.call()
  );

  static Future<Response?> update({
    required String circleKey,
    Optional<String> name = const Optional.empty(),
    Optional<String> description = const Optional.empty(),
    Optional<String> coverImageUrl = const Optional.empty(),
    Optional<String> colorsKey = const Optional.empty(),
    void Function(Circle circle)? onSuccess,
    void Function()? onError,
  }) async{

    Map<String, dynamic> reqMap = {};
    if(name.isPresent) reqMap['name'] = name.value.trim();
    if(description.isPresent) reqMap['description'] = description.value.trim();
    if(coverImageUrl.isPresent) reqMap['coverImageUrl'] = coverImageUrl.value;
    if(colorsKey.isPresent) reqMap['colorsKey'] = colorsKey.value;

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
        Circle circle = Circle.fromResponse(response.data);
        onSuccess(circle);
      },
      onError: (_) async => onError?.call()
    );

  }
  
  static Future<Response?> addUsers({
    required String circleKey,
    required List<MemberRespBodyNick> users,
    void Function(List<Member>)? onSuccess,
    void Function()? onError,
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
          '${API.SERVER_URL}api/circle/$circleKey/user',
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
      onError: (err) async => onError?.call()
    );

  }

  static Future<Response?> updateUsers({
    required String circleKey,
    required List<MemberUpdateBody> users,
    void Function(List<Member>)? onSuccess,
    void Function()? onError,
  }) async{

    List<Map<String, dynamic>> body = [];
    for(MemberUpdateBody memBody in users)
      body.add({
        'userKey': memBody.key,
        if(memBody.role.isPresent) 'role': circleRoleToStr[memBody.role.value],
        if(memBody.patrol.isPresent) 'patrol': memBody.patrol.value
      });

    return API.sendRequest(
        withToken: true,
        sendRequest: (Dio dio) => dio.put(
            '${API.SERVER_URL}api/circle/$circleKey/user',
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
        onError: (err) async => onError?.call()
    );

  }

  static Future<Response?> removeUsers({
    required String circleKey,
    required List<String> userKeys,
    void Function(List<String> removedKeys)? onSuccess,
    void Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
          '${API.SERVER_URL}api/circle/$circleKey/user',
          data: jsonEncode(userKeys)
      ),
      onSuccess: (Response response, DateTime now) async {
        onSuccess?.call((response.data as List).cast<String>());
      },
      onError: (err) async => onError?.call()
  );

  static Future<Response?> leave({
    required String circleKey,
    void Function()? onSuccess,
    void Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
        '${API.SERVER_URL}api/circle/$circleKey/leave',
      ),
      onSuccess: (Response response, DateTime now) async => onSuccess?.call(),
      onError: (err) async => onError?.call()
  );

  static Future<Response?> getCircleAnnouncements({
    required String circleKey,
    int? page,
    int? pageSize,
    bool pinnedOnly = false,
    bool awaitingOnly = false,

    void Function(List<Announcement>, bool pinnedOnly, bool awaitingOnly)? onSuccess,
    void Function()? onError,
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
          result.add(Announcement.fromMap(response.data[key], Circle.allMap![circleKey]!, key: key));

        onSuccess?.call(result, pinnedOnly, awaitingOnly);
      },
      onError: (err) async => onError?.call()
  );

  static Future<Response?> getFeedAnnouncements({
    int? page,
    int? pageSize,

    void Function(List<Announcement>)? onSuccess,
    void Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.get(
        '${API.SERVER_URL}api/announcement',
        queryParameters: {
          if(page != null) 'page': page,
          if(pageSize != null) 'pageSize': pageSize,
        }
      ),
      onSuccess: (Response response, DateTime now) {

        List<Announcement> result = [];
        for(String key in (response.data as Map).keys)
          result.add(Announcement.fromMap(
              response.data[key], 
              Circle.allMap![response.data[key]['circleKey']??(throw InvalidResponseError('circleKey'))]!,
              key: key)
          );

        onSuccess?.call(result);

      },
      onError: (err) => onError?.call()
  );

  static Future<Response?> postAnnouncement({
    required String circleKey,
    required String title,
    DateTime? startTime,
    DateTime? endTime,
    String? place,
    String? urlToPreview,
    String? coverImageUrl,
    required String text,
    required AnnouncementAttendanceRespMode respMode,

    void Function(Announcement)? onSuccess,
    void Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.post(
        '${API.SERVER_URL}api/circle/$circleKey/announcement',
        data: FormData.fromMap({
          'title': title,
          if(startTime != null) 'startTimeStr': startTime.toIso8601String(),
          if(endTime != null) 'endTimeStr': endTime.toIso8601String(),
          if(place != null) 'place': place,
          if(urlToPreview != null) 'urlToPreview': urlToPreview,
          if(coverImageUrl != null) 'coverImageUrl': coverImageUrl,
          'text': text,
          'attendanceRespMode': announcementAttendanceRespModeToStr[respMode],
        }),
      ),
      onSuccess: (Response response, DateTime now) async =>
          onSuccess?.call(Announcement.fromMap(response.data, Circle.allMap![circleKey]!)),
      onError: (err) async => onError?.call()
  );

  static Future<Response?> updateAnnouncement({
    required Announcement announcement,
    Optional<String?> title = const Optional.empty(),
    Optional<DateTime?> startTime = const Optional.empty(),
    Optional<DateTime?> endTime = const Optional.empty(),
    Optional<String?> place = const Optional.empty(),
    Optional<String?> urlToPreview = const Optional.empty(),
    Optional<String?> coverImageUrl = const Optional.empty(),
    Optional<String?> text = const Optional.empty(),
    Optional<AnnouncementAttendanceRespMode> respMode = const Optional.empty(),

    void Function(Announcement)? onSuccess,
    void Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.put(
        '${API.SERVER_URL}api/announcement/${announcement.key}',
        data: FormData.fromMap({

          if(title.isPresent) 'title': title.value,

          if(startTime.isPresent) "startTimeStr": startTime.value == null?
          null:
          startTime.value!.toIso8601String(),

          if(endTime.isPresent) "endTimeStr": endTime.value == null?
          null:
          endTime.value!.toIso8601String(),

          if(place.isPresent) 'place': place.value,

          if(urlToPreview.isPresent) 'urlToPreview': urlToPreview.value,

          if(coverImageUrl.isPresent) 'coverImageUrl': coverImageUrl.value,

          if(text.isPresent) 'text': text.value,

          if(respMode.isPresent) 'attendanceRespMode': announcementAttendanceRespModeToStr[respMode.value]

        }),
      ),
      onSuccess: (Response response, DateTime now) async =>
          onSuccess?.call(Announcement.fromMap(response.data, announcement.circle!)),
      onError: (err) async => onError?.call()
  );

  static Future<Response?> pinAnnouncement({
    required String annKey,
    required bool pin,
    void Function(bool)? onSuccess,
    void Function()? onError,
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
      onError: (err) async => onError?.call()
  );

  static Future<Response?> deleteAnnouncement({
    required String annKey,
    void Function()? onSuccess,
    void Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
        '${API.SERVER_URL}api/announcement/$annKey',
      ),
      onSuccess: (Response response, DateTime now) async =>
          onSuccess?.call(),
      onError: (err) async => onError?.call()
  );

  static Future<Response?> updateAnnouncementAttendanceResponse({
    required String annKey,
    String? memberKey,
    required AnnouncementAttendance response,
    String? responseReason,
    DateTime? postponeResponseTime,
    void Function(AnnouncementAttendanceResp, DateTime)? onSuccess,
    void Function()? onError,
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
      onError: (err) async => onError?.call()
  );

  static Future<Response?> waiveResponse({
    required String annKey,
    required String memberKey,
    required bool waive,
    void Function(bool, DateTime)? onSuccess,
    void Function()? onError,
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
      onError: (err) async => onError?.call()
  );

}