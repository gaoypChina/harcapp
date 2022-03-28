
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/common.dart';
import 'package:harcapp/sync/init_sync_analyser.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';

import '../../logger.dart';
import '_api.dart';

class ApiRegLog{

  static Future<bool> applyCarefulLoginData(BuildContext context, String email, DateTime lastSyncTime, Response response) async {

    InitSyncOperation syncOpt = await InitSyncAnalyser.analyse(
        context: context,
        email: email,
        lastConfEmail: AccSecData.lastConfLoginEmail,
        lastSyncTimeServer: lastSyncTime,
        lastSyncTimeLocal: SynchronizerEngine.lastSyncTimeLocal,
        log: true
    );

    bool loggedIn = false;

    switch(syncOpt){
      case InitSyncOperation.noAction:
        logger.i('Login attempt with init sync result: noAction');
        await AccSecData.saveLoginData(email, response);
        loggedIn = true;
        break;
      case InitSyncOperation.post:
        logger.i('Login attempt with init sync result: post');
        await AccSecData.saveLoginData(email, response);
        loggedIn = true;
        await synchronizer.reloadSyncables();
        synchronizer.post();
        break;
      case InitSyncOperation.postReplace:
        logger.i('Login attempt with init sync result: postReplace');
        await AccSecData.saveLoginData(email, response);
        loggedIn = true;
        await synchronizer.reloadSyncables();
        synchronizer.post(dumpReplaceExisting: true);
        break;
      case InitSyncOperation.get:
        logger.i('Login attempt with init sync result: get');
        await AccSecData.saveLoginData(email, response);
        loggedIn = true;
        await synchronizer.reloadSyncables();
        synchronizer.get();
        break;
      case InitSyncOperation.getReplace:
        logger.i('Login attempt with init sync result: getReplace');
        await AccSecData.saveLoginData(email, response);
        loggedIn = true;
        await synchronizer.reloadSyncables();
        await factoryResetLocal(context);
        synchronizer.get();
        break;
      case InitSyncOperation.logout:
        logger.i('Login attempt with init sync result: logout');
        break;
      case InitSyncOperation.error:
        logger.e('Login attempt with init sync result: error');
        await AccSecData.saveLoginData(email, response);
        loggedIn = true;
        await synchronizer.reloadSyncables();
        synchronizer.post(dumpReplaceExisting: true);
        break;
    }

    return loggedIn;

  }

  static String LOGIN_REQ_EMAIL = 'email';
  static String LOGIN_REQ_PASSWORD = 'password';
  static Future<Response> _getLoginData(
      String email,
      String password,
      {void Function(Response response, String key, String jwt, String name, Sex sex, String nick, DateTime lastSyncTime, bool emailConf) onSuccess,
        void Function(Response response) onError
      }) async {

    Map<String, dynamic> errMap = {};

    if(email == null || email.isEmpty)
      errMap[ApiRegLog.LOGIN_REQ_EMAIL] = 'field_may_not_be_blank';
    else if(!regExpEmail.hasMatch(email))
      errMap[ApiRegLog.LOGIN_REQ_EMAIL] = INVALID_EMAIL_FORMAT;

    if(password == null || password.isEmpty)
      errMap[ApiRegLog.LOGIN_REQ_PASSWORD] = 'field_may_not_be_blank';

    if(errMap.isNotEmpty) {
      Response errResp = API.createFakeErrResponse(errMap: errMap);
      onError?.call(errResp);
      return errResp;
    }

    return await API.sendRequest(
        withToken: false,
        sendRequest: (Dio dio) => dio.post(
            API.SERVER_URL + 'api/user/authenticate',
            data: FormData.fromMap({LOGIN_REQ_EMAIL: email, LOGIN_REQ_PASSWORD: password})
        ),
        onSuccess: (Response response) async {
          String key = response.data['key'];
          String jwt = response.data['jwt'];
          String name = response.data['name'];
          String nick = response.data['nick'];
          Sex sex = strToSex[response.data['sex']];
          DateTime lastSyncTime = DateTime.tryParse(response.data['last_sync_time']??'');
          bool emailConf = response.data['email_confirmed'];

          onSuccess?.call(
            response,
            key,
            jwt,
            name,
            sex,
            nick,
            lastSyncTime,
            emailConf,
          );
        },
        onError: (err) async => await onError?.call(err.response)
    );
  }

  static Future<Response> _getMicrosoftLoginData(
      String azureToken,
      {void Function(Response response, String email, String key, String jwt, String name, Sex sex, String nick, DateTime lastSyncTime, bool emailConf) onSuccess,
        void Function(Response response) onError
      }
  ) async => await API.sendRequest(
      withToken: false,
      sendRequest: (Dio dio) => dio.post(
          API.SERVER_URL + 'api/user/authenticate_microsoft',
          data: FormData.fromMap({'azureToken': azureToken})
      ),
      onSuccess: (Response response) async {
        String email = response.data['email']; //sprawdzić, czy to działa.
        String key = response.data['key'];
        String jwt = response.data['jwt'];
        String name = response.data['name'];
        String nick = response.data['nick'];
        Sex sex = strToSex[response.data['sex']];
        DateTime lastSyncTime = DateTime.tryParse(response.data['last_sync_time']??'');
        bool emailConf = response.data['email_confirmed'];

        onSuccess?.call(
          response,
          email,
          key,
          jwt,
          name,
          sex,
          nick,
          lastSyncTime,
          emailConf,
        );
      },
      onError: (err) async => await onError?.call(err.response)
  );

  static Future<Response> carefullyLogin({
    @required BuildContext context,
    @required String email,
    @required String password,
    void Function(Response response, bool emailConf, bool loggedIn) onSuccess,
    void Function(Response response) onError,
  }) => ApiRegLog._getLoginData(
      email,
      password,
      onSuccess: (response, key, jwt, name, sex, nick, lastSyncTime, emailConf) async {

        if(!emailConf) {
          await AccSecData.writeJwt(jwt);
          await AccSecData.writeName(name);
          await AccSecData.writeEmail(email);
          await onSuccess?.call(response, emailConf, true);
          return;
        }

        bool loggedIn = await applyCarefulLoginData(context, email, lastSyncTime, response);

        await onSuccess?.call(response, emailConf, loggedIn);

      },
      onError: onError
  );

  static Future<Response> carefullyMicrosoftLogin({
    @required BuildContext context,
    @required String azureToken,
    void Function(Response response, bool emailConf, bool loggedIn) onSuccess,
    void Function(Response response) onError,
  }) => ApiRegLog._getMicrosoftLoginData(
      azureToken,
      onSuccess: (response, email, key, jwt, name, sex, nick, lastSyncTime, emailConf) async {

        bool loggedIn = await applyCarefulLoginData(context, email, lastSyncTime, response);
        await onSuccess?.call(response, emailConf, loggedIn);

      },
      onError: onError
  );

  static Future<Response> logout({
    void Function() onSuccess,
    void Function() onError,
  }) async => API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) async => await dio.get(API.SERVER_URL + 'api/user/logout'),
    onSuccess: (Response response) async => await onSuccess?.call(),
    onUnauthorized: () async {
      await onSuccess?.call();
      return true;
    },
    onError: (err) async {
      await onError?.call();
    },
  );

  static String REGISTER_REQ_EMAIL = 'email';
  static String REGISTER_REQ_PASSWORD = 'password';
  static String REGISTER_REQ_PASSWORD_REP = 'password_rep';
  static String REGISTER_REQ_NAME = 'name';
  static String REGISTER_REQ_SEX = 'sex';
  static String REGISTER_REQ_POLICY = 'policy_v1';
  static String REGISTER_REQ_GDPR = 'gdpr_v1';

  static Future<Response> register(
      String email,
      String name,
      Sex sex,
      bool regulaminAccept,
      bool gdprAccept,
      String password,
      String passwordRep,
      {void Function(Response response, String key, String jwt, String email, String name, String nick, Sex sex) onSuccess,
        void Function(Response response) onError,
  }) async {

    Map<String, dynamic> errMap = {};

    if(email == null || email.isEmpty)
      errMap[ApiRegLog.REGISTER_REQ_EMAIL] = 'field_may_not_be_blank';
    else if(!regExpEmail.hasMatch(email))
      errMap[ApiRegLog.REGISTER_REQ_EMAIL] = INVALID_EMAIL_FORMAT;

    if(name == null || name.isEmpty)
      errMap[ApiRegLog.REGISTER_REQ_NAME] = 'field_may_not_be_blank';

    if(sex == null)
      errMap[ApiRegLog.REGISTER_REQ_SEX] = 'field_may_not_be_blank';

    if(regulaminAccept == null)
      errMap[ApiRegLog.REGISTER_REQ_POLICY] = 'field_may_not_be_blank';
    else if(regulaminAccept == false)
      errMap[ApiRegLog.REGISTER_REQ_POLICY] = 'policy_not_accepted';

    if(gdprAccept == null)
      errMap[ApiRegLog.REGISTER_REQ_GDPR] = 'field_may_not_be_blank';
    else if(gdprAccept == false)
      errMap[ApiRegLog.REGISTER_REQ_GDPR] = 'gdpr_not_accepted';

    if(password == null || password.isEmpty)
      errMap[ApiRegLog.REGISTER_REQ_PASSWORD] = 'field_may_not_be_blank';
    else if(password.length < 8)
      errMap[ApiRegLog.REGISTER_REQ_PASSWORD] = 'password_too_short';

    if(passwordRep == null || passwordRep.isEmpty)
      errMap[ApiRegLog.REGISTER_REQ_PASSWORD_REP] = 'field_may_not_be_blank';
    else if(password != passwordRep)
      errMap[ApiRegLog.REGISTER_REQ_PASSWORD_REP] = 'passwords_must_match';

    if(errMap.isNotEmpty) {
      Response errResp = API.createFakeErrResponse(errMap: errMap);
      onError?.call(errResp);
      return errResp;
    }

    return await API.sendRequest(
        sendRequest: (Dio dio) => dio.post(
            API.SERVER_URL + 'api/user/register',
            data: FormData.fromMap({
              REGISTER_REQ_EMAIL: email,
              REGISTER_REQ_NAME: name,
              REGISTER_REQ_SEX: sexToBool[sex],
              REGISTER_REQ_POLICY: regulaminAccept,
              REGISTER_REQ_GDPR: gdprAccept,
              REGISTER_REQ_PASSWORD: password,
            })
        ),
        onSuccess: (Response response) async {
          String key = response.data['key'];
          String jwt = response.data['jwt'];
          String email = response.data['email'];
          String name = response.data['name'];
          String nick = response.data['nick'];
          Sex sex = boolToSex[response.data['sex']];

          await AccSecData.saveLoginData(email, response);

          onSuccess?.call(
            response,
            key,
            jwt,
            email,
            name,
            nick,
            sex,
          );
        },
        onError: (err) async => await onError?.call(err.response)
    );
  }

  static String REGISTER_MICROSOFT_REQ_AZURE_TOKEN = 'azureToken';
  static String REGISTER_MICROSOFT_REQ_SEX = 'sex';
  static String REGISTER_MICROSOFT_REQ_POLICY = 'policy_v1';
  static String REGISTER_MICROSOFT_REQ_GDPR = 'gdpr_v1';

  static Future<Response> registerMicrosoft(
      String azureToken,
      Sex sex,
      bool regulaminAccept,
      bool gdprAccept,
      {void Function(Response response, String key, String jwt, String email, String name, String nick, Sex sex) onSuccess,
        void Function(Response response) onError,
      }) async {

    Map<String, dynamic> errMap = {};

    if(sex == null)
      errMap[REGISTER_MICROSOFT_REQ_SEX] = 'field_may_not_be_blank';

    if(sex == null)
      errMap[REGISTER_MICROSOFT_REQ_SEX] = 'field_may_not_be_blank';

    if(regulaminAccept == null)
      errMap[REGISTER_MICROSOFT_REQ_POLICY] = 'field_may_not_be_blank';
    else if(regulaminAccept == false)
      errMap[REGISTER_MICROSOFT_REQ_POLICY] = 'policy_not_accepted';

    if(gdprAccept == null)
      errMap[REGISTER_MICROSOFT_REQ_GDPR] = 'field_may_not_be_blank';
    else if(gdprAccept == false)
      errMap[REGISTER_MICROSOFT_REQ_GDPR] = 'gdpr_not_accepted';

    if(errMap.isNotEmpty) {
      Response errResp = API.createFakeErrResponse(errMap: errMap);
      onError?.call(errResp);
      return errResp;
    }

    return await API.sendRequest(
        sendRequest: (Dio dio) => dio.post(
            API.SERVER_URL + 'api/user/register_microsoft',
            data: FormData.fromMap({
              REGISTER_MICROSOFT_REQ_AZURE_TOKEN: azureToken,
              REGISTER_MICROSOFT_REQ_SEX: sexToBool[sex],
              REGISTER_MICROSOFT_REQ_POLICY: regulaminAccept,
              REGISTER_MICROSOFT_REQ_GDPR: gdprAccept,
            })
        ),
        onSuccess: (Response response) async {
          String key = response.data['key'];
          String jwt = response.data['jwt'];
          String email = response.data['email'];
          String name = response.data['name'];
          String nick = response.data['nick'];
          Sex sex = boolToSex[response.data['sex']];

          await AccSecData.saveLoginData(email, response);

          onSuccess?.call(
            response,
            key,
            jwt,
            email,
            name,
            nick,
            sex,
          );
        },
        onError: (err) async => await onError?.call(err.response)
    );
  }

  static Future<Response> mergeMicrosoft(
      String azureToken,
      {void Function(Response response) onSuccess,
       void Function(Response response) onError,
      }) async {

    return await API.sendRequest(
        withToken: true,
        sendRequest: (Dio dio) async => dio.post(
          API.SERVER_URL + 'api/user/merge_microsoft',
          data: FormData.fromMap({
            'azureToken': azureToken,
          }),
        ),
        onSuccess: (Response response) async {
          await AccSecData.saveLoginData(AccSecData.email, response);
          await onSuccess?.call(response);
        },
        onError: (err) async => await onError?.call(err.response)
    );

  }

  static String SEND_PASS_RESET_KEY_EMAIL = 'email';
  static Future<Response> sendResetPassReq(
      String email,
      {void Function() onSuccess,
        void Function(Response response) onError,
      }) async {

    Map<String, dynamic> errMap = {};

    if(!regExpEmail.hasMatch(email))
      errMap[ApiRegLog.RESET_PASSWORD_REQ_EMAIL] = INVALID_EMAIL_FORMAT;

    if(errMap.isNotEmpty) {
      Response errResp = API.createFakeErrResponse(errMap: errMap);
      onError?.call(errResp);
      return errResp;
    }

    return await API.sendRequest(
        sendRequest: (Dio dio) async => dio.post(
          API.SERVER_URL + 'api/user/send_pass_reset_key',
          data: FormData.fromMap({
            SEND_PASS_RESET_KEY_EMAIL: email,
          }),
        ),
        onSuccess: (Response response) async => await onSuccess?.call(),
        onError: (err) async => await onError?.call(err.response)
    );

  }


  static String RESET_PASSWORD_REQ_EMAIL = 'email';
  static String RESET_PASSWORD_REQ_PASS_RESET_KEY = 'pass_reset_key';
  static String RESET_PASSWORD_REQ_NEW_PASS = 'new_pass';
  static String RESET_PASSWORD_REQ_NEW_PASS_REP = 'new_pass_rep';

  static Future<Response> resetPass({
    @required String email,
    @required String resetPassKey,
    @required String newPass,
    @required String newPassRep,
    void Function() onSuccess,
    void Function(Response response) onError,
  }) async {

    Map<String, dynamic> errMap = {};

    if(resetPassKey == null || resetPassKey.isEmpty)
      errMap[ApiRegLog.RESET_PASSWORD_REQ_PASS_RESET_KEY] = 'field_may_not_be_blank';

    if(newPass == null || newPass.isEmpty)
      errMap[ApiRegLog.RESET_PASSWORD_REQ_NEW_PASS] = 'field_may_not_be_blank';
    else if(newPass.length < 8)
      errMap[ApiRegLog.RESET_PASSWORD_REQ_NEW_PASS] = 'password_too_short';


    if(newPassRep == null || newPassRep.isEmpty)
      errMap[ApiRegLog.RESET_PASSWORD_REQ_NEW_PASS_REP] = 'field_may_not_be_blank';
    else if(newPass != newPassRep)
      errMap[ApiRegLog.RESET_PASSWORD_REQ_NEW_PASS_REP] = 'passwords_must_match';


    if(errMap.isNotEmpty) {
      Response errResp = API.createFakeErrResponse(errMap: errMap);
      onError?.call(errResp);
      return errResp;
    }

    return await API.sendRequest(
      sendRequest: (Dio dio) async => await dio.post(
          API.SERVER_URL + 'api/user/reset_pass',
          data: FormData.fromMap({
            RESET_PASSWORD_REQ_EMAIL:email,
            RESET_PASSWORD_REQ_PASS_RESET_KEY:resetPassKey,
            RESET_PASSWORD_REQ_NEW_PASS:newPass,
          })
      ),
      onSuccess: (Response response) async => await onSuccess?.call(),
      onError: (err) async => await onError?.call(err.response)
    );

  }


  static const String VALIDATE_PASSWORD_PASSWORD = 'password';
  static Future<Response> validatePassword(String password, {Function onSuccess, Function(String error) onError}) async => await API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.post(
          API.SERVER_URL + 'api/account/validate_password',
          data: FormData.fromMap({
            VALIDATE_PASSWORD_PASSWORD: password,
          })
      ),
      onSuccess: (response) async => await onSuccess?.call(),
      onError: (DioError error) async {
        String response;

        try{
          response = error?.response?.data['response'];
          if(response == null)
            response = error?.response?.data['password'][0];
        } catch(Error){}

        await onError?.call(response);
      }
  );


  static Future<Response> resendActivationToken({void Function() onSuccess, void Function() onError}) async => await API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) async => dio.get(API.SERVER_URL + 'api/user/resend_email_conf_key'),
      onSuccess: (response) async => onSuccess?.call(),
      onError: (_) async => onError?.call()
  );


  static String CONF_EMAIL_CONF_KEY = 'conf_key';
  static Future<Response> carefullyConfEmail(
      BuildContext context,
      String confKey,
      {void Function(bool loggedIn) onSuccess,
        void Function(Response response) onError,
      }) async {

    Map<String, dynamic> errMap = {};

    if(confKey == null || confKey.isEmpty)
      errMap[CONF_EMAIL_CONF_KEY] = 'field_may_not_be_blank';

    if(errMap.isNotEmpty) {
      Response errResp = API.createFakeErrResponse(errMap: errMap);
      onError?.call(errResp);
      return errResp;
    }

    return await API.sendRequest(
        withToken: true,
        sendRequest: (Dio dio) async => dio.post(
            API.SERVER_URL + 'api/user/confirm_email',
            data: FormData.fromMap({CONF_EMAIL_CONF_KEY: confKey})
        ),
        onSuccess: (Response response) async {

          String email = response.data['email'];
          DateTime lastSyncTime = DateTime.tryParse(response.data['last_sync_time']??'');

          bool loggedIn = await applyCarefulLoginData(context, email, lastSyncTime, response);

          await onSuccess?.call(loggedIn);
        },
        onError: (err) async => await onError?.call(err.response)
    );
  }

  static Future<Response> isEmailConf({
    String token,
    void Function({@required bool confirmed}) onSuccess,
    void Function({@required Response response}) onError
  }) async =>
      await API.sendRequest(
          withToken: true,
          //token: token,
          sendRequest: (Dio dio) async => await dio.get(API.SERVER_URL + 'api/user/is_email_confirmed'),
          onSuccess: (Response response) async => await onSuccess?.call(confirmed: response.data),
          onError: (err) async => await onError?.call()
      );

}