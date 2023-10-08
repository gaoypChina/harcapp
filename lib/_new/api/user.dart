import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/common.dart';
import 'package:optional/optional_internal.dart';

import '../../_common_classes/org/org.dart';
import '../../values/rank_harc.dart';
import '../../values/rank_instr.dart';
import '../cat_page_home/community/model/community.dart';
import '_api.dart';

class ApiUser{

  static const int EMAIL_MAX_LENGTH = 100;
  static const int PASS_MIN_LENGTH = 8;
  static const int PASS_MAX_LENGTH = 32;
  static const int NAME_MAX_LENGTH = 54;
  static const int HUFIEC_MAX_LENGTH = Community.maxLenName;
  static const int DRUZYNA_MAX_LENGTH = Community.maxLenName;

  static Future<Response?> getShadowUsers({
    required int? pageSize,
    required String? lastUserName,
    required String? lastUserKey,

    FutureOr<void> Function(List<ShadowUserData> users)? onSuccess,
    FutureOr<void> Function()? onError,
  }) async => await API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.get(
        '${API.baseUrl}api/user/shadow',
        queryParameters: {
          if(pageSize != null) 'pageSize': pageSize,
          if(lastUserName != null) 'lastUserName': lastUserName,
          if(lastUserKey != null) 'lastUserKey': lastUserKey,
        }
      ),
      onSuccess: (Response response, DateTime now) async {
        List<ShadowUserData> users = [];
        for(Map data in response.data)
          users.add(ShadowUserData.fromRespMap(data));

        await onSuccess?.call(users);
      },
      onError: (DioException error) async => await onError?.call()
  );

  static String CREATE_SHADOW_REQ_NAME = 'name';
  static String CREATE_SHADOW_REQ_SEX = 'sex';
  static Future<Response?> createShadow(
      String? name,
      Sex? sex,
      { FutureOr<void> Function(ShadowUserData user)? onSuccess,
        FutureOr<void> Function()? onError,
      }) async => await API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.post(
        '${API.baseUrl}api/user/shadow',
        data: FormData.fromMap({
          CREATE_SHADOW_REQ_NAME: name,
          CREATE_SHADOW_REQ_SEX: sexToBool[sex!]
        })
      ),
      onSuccess: (Response response, DateTime now) async => await onSuccess?.call(ShadowUserData.fromRespMap(response.data)),
      onError: (DioException error) async => await onError?.call()
  );

  static String UPDATE_SHADOW_REQ_NAME = 'name';
  static String UPDATE_SHADOW_REQ_SEX = 'sex';
  static Future<Response?> updateShadow(
      ShadowUserData user,
      String? name,
      Sex? sex,
      { FutureOr<void> Function(ShadowUserData user)? onSuccess,
        FutureOr<void> Function()? onError,
      }) async => await API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.put(
          '${API.baseUrl}api/user/shadow/${user.key}',
          data: FormData.fromMap({
            UPDATE_SHADOW_REQ_NAME: name,
            UPDATE_SHADOW_REQ_SEX: sexToBool[sex!]
          })
      ),
      onSuccess: (Response response, DateTime now) async => await onSuccess?.call(ShadowUserData.fromRespMap(response.data)),
      onError: (DioException error) async => await onError?.call()
  );

  static String DELETE_SHADOW_REQ_KEY = 'key';
  static Future<Response?> deleteShadow(
      String key,
      { FutureOr<void> Function(bool? deleted)? onSuccess,
        FutureOr<void> Function()? onError,
      }) async => await API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.delete(
          '${API.baseUrl}api/user/shadow',
          data: FormData.fromMap({
            DELETE_SHADOW_REQ_KEY: key,
          })
      ),
      onSuccess: (Response response, DateTime now) async => await onSuccess?.call(response.data),
      onError: (DioException error) async => await onError?.call()
  );

  static Future<Response?> mergeShadow(
      String shadowKey,
      String toMergeNick,
      { FutureOr<void> Function(UserData)? onSuccess,
        FutureOr<void> Function()? onError,
      }) async => await API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.post(
          '${API.baseUrl}api/user/shadow/$shadowKey/merge/$toMergeNick'
      ),
      onSuccess: (Response response, DateTime now) async => await onSuccess?.call(
          UserData.fromRespMap(response.data)
      ),
      onError: (DioException error) async => await onError?.call()
  );

  static Future<Response?> searchByNick(
      String nick, 
      { searchShadow = false,
        searchReal = true,
        FutureOr<void> Function(bool noSuchUser)? onError,
        FutureOr<void> Function(UserDataNick user)? onSuccess,
      }) async => await API.sendRequest(
    withToken: true,
    requestSender: (Dio dio) => dio.get(
      '${API.baseUrl}api/user/search/$nick',
      queryParameters: {
        'searchShadow': searchShadow,
        'searchReal': searchReal,
      }
    ),
    onSuccess: (Response response, DateTime now) async => await onSuccess?.call(UserDataNick.fromRespMap(response.data)),
    onError: (DioException error) async {
      bool noSuchUserStatus = error.response?.statusCode == HttpStatus.notFound;
      bool noSuchUserBody = false;
      try{ noSuchUserBody = error.response?.data['error'] == 'no_such_user'; }
      catch(e){}

      await onError?.call(noSuchUserStatus && noSuchUserBody);
    }

  );

  static Future<Response?> delete(
      { String? validPass,
        String? validAzureToken,
        FutureOr<void> Function(String?)? onError,
        FutureOr<void> Function()? onSuccess,
      }) async => await API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.delete(
          '${API.baseUrl}api/user',
          data: FormData.fromMap({
            if(validPass != null) 'validPass': validPass,
            if(validAzureToken != null) 'validAzureToken': validAzureToken,
          })
      ),
      onSuccess: (Response response, DateTime now) async => await onSuccess?.call(),
      onError: (DioException error) async => await onError?.call(error.response!.data['error'])
  );

  static String UPDATE_REQ_EMAIL = 'email';
  static String UPDATE_REQ_JWT = 'token';
  static String UPDATE_REQ_NAME = 'name';
  static String UPDATE_REQ_PASSWORD = 'password';
  static String UPDATE_REQ_PASSWORD_REP = 'password_rep';
  static String UPDATE_REQ_SEX = 'sex';
  static String UPDATE_REQ_ORG = 'harcorg';
  static String UPDATE_REQ_HUFIEC = 'hufiec';
  static String UPDATE_REQ_DRUZYNA = 'druzyna';
  static String UPDATE_REQ_RANK_HARC = 'rankHarc';
  static String UPDATE_REQ_RANK_INSTR = 'rankInstr';
  static String UPDATE_REQ_VALID_PASS = 'validPass';
  static Future<Response?> update({
    String? email,
    String? password,
    String? passwordRep,
    String? name,
    Sex? sex,

    Optional<Org>? org,
    Optional<String>? hufiec,
    Optional<String>? druzyna,
    Optional<RankHarc>? rankHarc,
    Optional<RankInstr>? rankInstr,

    String? validPass,
    FutureOr<void> Function(
      String? email,
      String? jwt,
      String? name,
      Sex? sex,
      Optional<Org>? org,
      Optional<String>? hufiec,
      Optional<String>? druzyna,
      Optional<RankHarc>? rankHarc,
      Optional<RankInstr>? rankInstr,
    )? onSuccess,
    FutureOr<void> Function(Response? response)? onError,
  }) async {

    Map<String, dynamic> errMap = {};

    if(email != null && !regExpEmail.hasMatch(email))
      errMap[UPDATE_REQ_EMAIL] = INVALID_EMAIL_FORMAT;
    else if(email != null && email.length > EMAIL_MAX_LENGTH)
      errMap[UPDATE_REQ_EMAIL] = 'email_too_long';

    if(password != null && password.isNotEmpty){
      if(password.length < PASS_MIN_LENGTH)
        errMap[UPDATE_REQ_PASSWORD] = 'password_too_short';
      else if(password.length > PASS_MAX_LENGTH)
        errMap[UPDATE_REQ_PASSWORD] = 'password_too_long';
    }

    if(password != passwordRep)
      errMap[UPDATE_REQ_PASSWORD_REP] = 'passwords_must_match';

    if(name != null && name.isEmpty)
      errMap[UPDATE_REQ_NAME] = 'field_may_not_be_blank';
    else if(name != null && name.length > NAME_MAX_LENGTH)
      errMap[UPDATE_REQ_NAME] = 'name_too_long';

    //if(sex == null)
    //  errMap[UPDATE_REQ_SEX] = 'field_may_not_be_blank';

    //if(nickSearchable == null)
    //  errMap[UPDATE_REQ_NICK_SEARCHABLE] = 'field_may_not_be_blank';

    if(errMap.isNotEmpty) {
      Response errResp = API.createFakeErrResponse(errMap: errMap);
      await onError?.call(errResp);
      return errResp;
    }

    return await API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) async {
        Map<String, dynamic> map = {};
        if(email != null && email.isNotEmpty && AccountData.email != email) map[UPDATE_REQ_EMAIL] = email;
        if(password != null && password.isNotEmpty) map[UPDATE_REQ_PASSWORD] = password;
        if(name != null && name.isNotEmpty && AccountData.name != name) map[UPDATE_REQ_NAME] = name;
        if(sex != null && AccountData.sex != sex) map[UPDATE_REQ_SEX] = sex == Sex.male;

        if(org != null) map[UPDATE_REQ_ORG] = org.isEmpty?null:orgToParam(org.value);
        if(hufiec != null) map[UPDATE_REQ_HUFIEC] = hufiec.orElseNull;
        if(druzyna != null) map[UPDATE_REQ_DRUZYNA] = druzyna.orElseNull;
        if(rankHarc != null) map[UPDATE_REQ_RANK_HARC] = rankHarc.isEmpty?null:rankHarcToParam(rankHarc.value);
        if(rankInstr != null) map[UPDATE_REQ_RANK_INSTR] = rankInstr.isEmpty?null:rankInstrToStr(rankInstr.value);

        if(validPass!=null) map[UPDATE_REQ_VALID_PASS] = validPass;

        return await dio.post(
            '${API.baseUrl}api/user',
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            data: jsonEncode(map),
        );
      },
      onSuccess: (Response response, DateTime now) async {
        Map responseMap = response.data;
        String? refreshToken = responseMap['refreshToken'];
        if(refreshToken != null) AccountData.writeRefreshToken(refreshToken);
        Map data = response.data;
        await onSuccess?.call(
          data[UPDATE_REQ_EMAIL],
          data[UPDATE_REQ_JWT],
          data[UPDATE_REQ_NAME],
          strToSex[data[UPDATE_REQ_SEX]],
          
          data.containsKey(UPDATE_REQ_ORG)?
          Optional.of(paramToOrg[data[UPDATE_REQ_ORG]]!):
          null,

          data.containsKey(UPDATE_REQ_HUFIEC)?
          Optional.of(data[UPDATE_REQ_HUFIEC]!):
          null,

          data.containsKey(UPDATE_REQ_DRUZYNA)?
          Optional.of(data[UPDATE_REQ_DRUZYNA]!):
          null,

          data.containsKey(UPDATE_REQ_RANK_HARC)?
          Optional.of(paramToRankHarc[data[UPDATE_REQ_RANK_HARC]!]!):
          null,

          data.containsKey(UPDATE_REQ_RANK_INSTR)?
          Optional.of(paramToRankInstr[data[UPDATE_REQ_RANK_INSTR]!]!):
          null,
        );
      },
      onError: (err) async => onError?.call(err.response),
    );

  }


  static Future<Response?> resetNick({FutureOr<void> Function(String nick)? onSuccess, FutureOr<void> Function(Response? response)? onError}) async => await API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.get(
          '${API.baseUrl}api/user/nick'
      ),
      onSuccess: (Response response, DateTime now) async => await onSuccess?.call(response.data['nick']),
      onError: (DioException error) async => await onError!(error.response)
  );

  static Future<Response?> resetShadowNick(String shadowKey, {FutureOr<void> Function(String nick)? onSuccess, FutureOr<void> Function(Response? response)? onError}) async => await API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.get(
          '${API.baseUrl}api/user/shadow/$shadowKey/nick'
      ),
      onSuccess: (Response response, DateTime now) async => await onSuccess?.call(response.data['nick']),
      onError: (DioException error) async => await onError!(error.response)
  );

  static String UPDATE_REQ_NICK_SEARCHABLE = 'nickSearchable';
  static Future<Response?> nickSearchable({required searchable, FutureOr<void> Function(bool? searchable)? onSuccess, FutureOr<void> Function(Response? response)? onError}) async => await API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.post(
          '${API.baseUrl}api/user/nickSearchable',
          data: FormData.fromMap({UPDATE_REQ_NICK_SEARCHABLE: searchable})
      ),
      onSuccess: (Response response, DateTime now) async => await onSuccess?.call(response.data['nickSearchable']),
      onError: (DioException error) async => await onError!(error.response)
  );

  static Future<Response?> shadowNickSearchable(String shadowKey, {required searchable, FutureOr<void> Function(bool? searchable)? onSuccess, FutureOr<void> Function(Response? response)? onError}) async => await API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.post(
          '${API.baseUrl}api/user/shadow/$shadowKey/nickSearchable',
          data: FormData.fromMap({UPDATE_REQ_NICK_SEARCHABLE: searchable})
      ),
      onSuccess: (Response response, DateTime now) async => await onSuccess?.call(response.data['nickSearchable']),
      onError: (DioException error) async => await onError!(error.response)
  );

}