import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';


import '../cat_page_home/circles/circle_role.dart';
import '../cat_page_home/circles/model/announcement.dart';
import '../cat_page_home/circles/model/circle.dart';
import '../cat_page_home/circles/model/member.dart';
import '_api.dart';

class MemberBody{

  final String key;
  final CircleRole role;

  const MemberBody(this.key, this.role);

}

class MemberBodyNick extends MemberBody{

  final String? nick;

  const MemberBodyNick(String key, CircleRole role, this.nick): super(
      key, role
  );

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
    onSuccess: (Response response) async {
      List<Circle> circleList = [];
      for(Map map in response.data)
        circleList.add(Circle.fromResponse(map));

      onSuccess?.call(circleList);
    },
    onError: (err) async => onError?.call(err.response)
  );

  static Future<Response?> get({
    required String? circleKey,
    void Function(Circle circle)? onSuccess,
    void Function()? onError,
  }) async => await API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) => dio.get(
        '${API.SERVER_URL}api/circle/$circleKey',
    ),
    onSuccess: (Response response) async {
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
    reqMap['cover_image_url'] = coverImageUrl;
    reqMap['colors_key'] = colorsKey;

    return API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.post(
          '${API.SERVER_URL}api/circle',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }),
          data: jsonEncode(reqMap)
      ),
      onSuccess: (Response response) async{
        Circle circle = Circle.fromResponse(response.data);
        onSuccess?.call(circle);
      },
      onError: (_) async => onError?.call()
    );

  }

  static Future<Response?> delete({
    required String? circleKey,
    void Function()? onSuccess,
    void Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
        '${API.SERVER_URL}api/circle/$circleKey'
      ),
      onSuccess: (Response response) async => onSuccess?.call(),
      onError: (DioError err) async => onError?.call()
  );

  static Future<Response?> resetShareCode({
    required String compKey,
    void Function(String?)? onSuccess,
    void Function(Map?)? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.get(
        '${API.SERVER_URL}api/circle/$compKey/shareCode',
      ),
      onSuccess: (Response response) async => onSuccess?.call(response.data),
      onError: (DioError err) async => onError?.call(err.response!.data)
  );

  static Future<Response?> setShareCodeSearchable({
    required String compKey,
    required bool searchable,
    void Function(bool?)? onSuccess,
    void Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.post(
        '${API.SERVER_URL}api/circle/$compKey/shareCodeSearchable',
        data: FormData.fromMap({'searchable': searchable}),
      ),
      onSuccess: (Response response) async => onSuccess?.call(response.data['shareCodeSearchable']),
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
      onSuccess: (Response response) async {
        Circle comp = Circle.fromResponse(response.data);
        onSuccess?.call(comp);
      },
      onError: (DioError err) async => onError?.call()
  );

  static Future<Response?> update({
    required String? key,
    String? name,
    String? description,
    String? coverImageUrl,
    String? colorsKey,
    void Function(Circle circle)? onSuccess,
    void Function()? onError,
  }) async{

    Map<String, dynamic> reqMap = {};
    if(name != null) reqMap['name'] = name.trim();
    if(description != null) reqMap['description'] = description.trim();
    if(coverImageUrl != null) reqMap['cover_image_url'] = coverImageUrl;
    if(colorsKey != null) reqMap['colors_key'] = colorsKey;

    return API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.put(
        '${API.SERVER_URL}api/circle/$key',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
        data: jsonEncode(reqMap)
      ),
      onSuccess: (Response response) async {
        if(onSuccess==null) return;
        Circle circle = Circle.fromResponse(response.data);
        onSuccess(circle);
      },
      onError: (_) async => onError?.call()
    );

  }
  
  static Future<Response?> addUsers({
    required String? circleKey,
    required List<MemberBodyNick> users,
    void Function(List<Member>)? onSuccess,
    void Function()? onError,
  }) async{

    List<Map<String, dynamic>> body = [];
    for(MemberBodyNick user in users)
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
      onSuccess: (Response response) async {
        if(onSuccess == null) return;

        List<Member> members = [];
        Map _membersRespMap = response.data;
        for(MapEntry memEntry in _membersRespMap.entries)
          members.add(Member.fromMap(memEntry.value, key: memEntry.key));

        onSuccess(members);
      },
      onError: (err) async => onError?.call()
    );

  }

  static Future<Response?> updateUsers({
    required String? circleKey,
    required List<MemberBody> users,
    void Function(List<Member>)? onSuccess,
    void Function()? onError,
  }) async{

    List<Map<String, dynamic>> body = [];
    for(MemberBody user in users)
      body.add({
        'userKey': user.key,
        'role': circleRoleToStr[user.role],
      });

    return API.sendRequest(
        withToken: true,
        sendRequest: (Dio dio) => dio.put(
            '${API.SERVER_URL}api/circle/$circleKey/user',
            data: jsonEncode(body)
        ),
        onSuccess: (Response response) async {
          if(onSuccess == null) return;

          List<Member> particips = [];
          Map _participsRespMap = response.data;
          for(MapEntry participEntry in _participsRespMap.entries)
            particips.add(Member.fromMap(participEntry.value, key: participEntry.key));

          onSuccess(particips);
        },
        onError: (err) async => onError?.call()
    );

  }

  static Future<Response?> removeUsers({
    required String? circleKey,
    required List<String> userKeys,
    void Function(List<String> removedKeys)? onSuccess,
    void Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
          '${API.SERVER_URL}api/circle/$circleKey/user',
          data: jsonEncode(userKeys)
      ),
      onSuccess: (Response response) async {
        onSuccess?.call((response.data as List).cast<String>());
      },
      onError: (err) async => onError?.call()
  );

  static Future<Response?> leave({
    required String? circleKey,
    void Function()? onSuccess,
    void Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
        '${API.SERVER_URL}api/circle/$circleKey/leave',
      ),
      onSuccess: (Response response) async => onSuccess?.call(),
      onError: (err) async => onError?.call()
  );

  static Future<Response?> postAnnouncement({
    required String? circleKey,
    required String title,
    String? coverImageUrl,
    required String text,
    bool? pinned,
    void Function(Announcement)? onSuccess,
    void Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.post(
        '${API.SERVER_URL}api/circle/$circleKey/announcement',
        data: FormData.fromMap({
          'title': title,
          'cover_image_url': coverImageUrl,
          'text': text,
          'pinned': pinned,
        }),
      ),
      onSuccess: (Response response) async =>
          onSuccess?.call(Announcement.fromMap(response.data)),
      onError: (err) async => onError?.call()
  );

  static Future<Response?> updateAnnouncement({
    required String? annKey,
    String? title,
    String? coverImageUrl,
    String? text,
    bool? pinned,
    void Function(Announcement)? onSuccess,
    void Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.put(
        '${API.SERVER_URL}api/announcement/$annKey',
        data: FormData.fromMap({
          'title': title,
          'cover_image_url': coverImageUrl,
          'text': text,
          'pinned': pinned,
        }),
      ),
      onSuccess: (Response response) async =>
          onSuccess?.call(Announcement.fromMap(response.data)),
      onError: (err) async => onError?.call()
  );

  static Future<Response?> deleteAnnouncement({
    required String? annKey,
    void Function()? onSuccess,
    void Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
        '${API.SERVER_URL}api/announcement/$annKey',
      ),
      onSuccess: (Response response) async =>
          onSuccess?.call(),
      onError: (err) async => onError?.call()
  );
}