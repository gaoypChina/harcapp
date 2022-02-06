import 'dart:io';

import 'package:dio/dio.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/common.dart';

import '_api.dart';

class ApiUser{

  static const int EMAIL_MAX_LENGTH = 100;
  static const int PASS_MIN_LENGTH = 8;
  static const int PASS_MAX_LENGTH = 32;
  static const int NAME_MAX_LENGTH = 54;

  static Future<Response> searchByNick(
      String nick, 
      {void Function({bool noSuchUser}) onError,
        void Function(UserDataNick user) onSuccess,
      }) async => await API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) => dio.get(
      API.SERVER_URL + 'api/user/search/$nick',
    ),
    onSuccess: (Response response) async => await onSuccess?.call(UserDataNick.fromMap(response.data, nick)),
    onError: (DioError error) async {
      bool noSuchUserStatus = error.response?.statusCode == HttpStatus.notFound;
      bool noSuchUserBody =  DeepCollectionEquality().equals(error.response?.data, {'error': 'User not found'});

      await onError?.call(noSuchUser: noSuchUserStatus && noSuchUserBody);
    }

  );

  static Future<Response> delete(
      { String validPass,
        void Function(String) onError,
        void Function() onSuccess,
      }) async => await API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
          API.SERVER_URL + 'api/user',
          data: validPass==null?null:FormData.fromMap({'valid_pass': validPass})
      ),
      onSuccess: (Response response) async => await onSuccess?.call(),
      onError: (DioError error) async => await onError?.call(error.response.data['error'])
  );

  static String UPDATE_REQ_EMAIL = 'email';
  static String UPDATE_REQ_JWT = 'token';
  static String UPDATE_REQ_NAME = 'name';
  static String UPDATE_REQ_PASSWORD = 'password';
  static String UPDATE_REQ_PASSWORD_REP = 'password_rep';
  static String UPDATE_REQ_SEX = 'sex';
  static String UPDATE_REQ_VALID_PASS = 'valid_pass';
  static Future<Response> update({
    String email,
    String password,
    String passwordRep,
    String name,
    Sex sex,
    //bool nickSearchable,
    String validPass,
    void Function(String email, String jwt, String name, Sex sex) onSuccess,
    void Function(Response response) onError,
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
      onError?.call(errResp);
      return errResp;
    }

    return await API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) async {
        Map<String, dynamic> map = Map();
        if(email != null && email.isNotEmpty && AccSecData.email != email) map[UPDATE_REQ_EMAIL] = email;
        if(password != null && password.isNotEmpty) map[UPDATE_REQ_PASSWORD] = password;
        if(sex != null && AccSecData.sex != sex) map[UPDATE_REQ_SEX] = sex == Sex.male;
        if(name != null && name.isNotEmpty && AccSecData.name != name) map[UPDATE_REQ_NAME] = name;

        if(validPass!=null) map[UPDATE_REQ_VALID_PASS] = validPass;

        return await dio.post(
            API.SERVER_URL + 'api/user',
            data: FormData.fromMap(map)
        );
      },
      onSuccess: (Response response) async {
        onSuccess?.call(
          response.data[UPDATE_REQ_EMAIL],
          response.data[UPDATE_REQ_JWT],
          response.data[UPDATE_REQ_NAME],
          strToSex[response.data[UPDATE_REQ_SEX]],
        );
      },
      onError: (err) async => await onError?.call(err.response),
    );

  }


  static Future<Response> resetNick({void Function(String nick) onSuccess, Function(Response response) onError}) async => await API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.get(
          API.SERVER_URL + 'api/user/nick'
      ),
      onSuccess: (response) async => await onSuccess?.call(response.data['nick']),
      onError: (DioError error) async => await onError(error.response)
  );

  static String UPDATE_REQ_NICK_SEARCHABLE = 'nick_searchable';
  static Future<Response> nickSearchable({@required searchable, void Function(bool searchable) onSuccess, Function(Response response) onError}) async => await API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.post(
          API.SERVER_URL + 'api/user/nickSearchable',
          data: FormData.fromMap({UPDATE_REQ_NICK_SEARCHABLE: searchable})
      ),
      onSuccess: (response) async => await onSuccess?.call(response.data['nick_searchable']),
      onError: (DioError error) async => await onError(error.response)
  );

}