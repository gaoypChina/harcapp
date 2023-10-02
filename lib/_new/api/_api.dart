import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_common_classes/time_settings.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/memory.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/off_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp/values/server.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import '../../sync/syncable.dart';


const int jwtInvalidHttpStatus = HttpStatus.forbidden;

class InvalidResponseError extends Error{

  String paramName;

  InvalidResponseError(this.paramName);

  @override
  String toString() => 'InvalidResponseError. Missing param: $paramName.';

}

RefreshTokenHandler refreshTokenHandler = RefreshTokenHandler();
class RefreshTokenHandler extends SingleComputer<DioException, SingleComputerListener<DioException>>{

  @override
  String get computerName => 'RefreshTokenHandler';

  @override
  Future<void> perform() async {

    debugPrint('Jwt expired. Attempting a token refresh...');

    Response response;
    try {
      response = await Dio().get(
          '${API.baseUrl}api/refreshToken/${AccountData.refreshToken}',
          queryParameters: {
            'jwt': AccountData.jwt
          }
      );

      await AccountData.writeJwt(response.data['jwt']);
      await AccountData.writeRefreshToken(response.data['refreshToken']);

    } on DioException catch (e){
      await callKnownError(e);
    }

  }

}

class API{

  static String baseUrl = '${testBackendUrl??backendUrl}/';

  static void saveErrorMessage(DioException e) async => saveStringAsFileToFolder(
      getApiErrorFolderLocalPath,
      '# Date: ${DateTime.now().toIso8601String()}'
          '\n# System time used: ${await TimeSettings.isTimeAutomatic}'
          '\n# Status code: ${e.response?.statusCode}'
          '\n# Status message: ${e.response?.statusMessage}'
          '\n# Error:\n${e.message}'
          '\n'
          '\n# Error response data:\n${e.response?.data}'
  );

  static Response createFakeErrResponse({String? error, Map<String, dynamic>? errMap}) => Response(
    statusCode: HttpStatus.badRequest,
    requestOptions: RequestOptions(path: ''), // is it okay to have empty path?
    data: {
      'error': error??'',
      'errors': errMap,
    },
  );

  static Future<Response?> sendRequest ({
    bool withToken = false,
    required Future<Response> Function(Dio dio) requestSender,
    FutureOr<void> Function(Response, DateTime)? onSuccess,
    FutureOr<bool> Function()? onEmailNotConf,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<bool> Function()? onImageDBWakingUp,
    FutureOr<void> Function(DioException)? onError,

    bool saveServerTime = true,
    bool jwtTokenRefreshed = false // do not use this argument.
  }) async {

    Dio dio = Dio(BaseOptions(
      headers: {
        if(withToken) 'Authorization': 'Bearer ${AccountData.jwt}',
      },
      connectTimeout: const Duration(seconds: 18),
      receiveTimeout: const Duration(seconds: 40),
    ));

    try {
      Response response = await requestSender(dio);

      if(response.statusCode == HttpStatus.ok){
        debugPrint('HarcApp API: ${response.requestOptions.method} ${response.requestOptions.path} :: success!');
        DateTime lastServerTime = DateTime.tryParse(response.headers.value('time')??'')??DateTime(966);
        if(saveServerTime) AccountData.writeLastServerTime(lastServerTime);
        await onSuccess?.call(response, lastServerTime);
      }
      return response;
    } on DioException catch (e) {
      debugPrint('HarcApp API: ${e.requestOptions.method} ${e.requestOptions.path} :: error! :: ${e.message} :: ${e.response?.data?.toString()}');
      if(e.response?.statusCode != jwtInvalidHttpStatus) saveErrorMessage(e);
      bool? finish;

      if (e.response?.statusCode == 400 && e.response?.data is Map && e.response?.data?['error'] == "image_db_sleeping"){
        finish = await onImageDBWakingUp?.call();
        if(await isNetworkAvailable())
          Dio().get(imageDbUrl).onError((e, __) => Response(requestOptions: RequestOptions(path: '')));
      }

      if (e.response?.statusCode == 504 || e.response?.statusCode == 503 || e.response?.statusCode == 502) {
        finish = await onServerMaybeWakingUp?.call();
        if(await isNetworkAvailable())
          Dio().get(baseUrl).onError((e, __) => Response(requestOptions: RequestOptions(path: '')));

      } else if (e.response?.statusCode == jwtInvalidHttpStatus) {

        String respData = '';
        if(e.response?.data is Map) respData = e.response?.data['error'];

        if(!jwtTokenRefreshed && (respData == 'jwt_expired' || respData == 'invalid_signature')){

          Response? response;

          SingleComputerListener<DioException> listener = SingleComputerListener(
            onEnd: (DioException? error, bool unknownError, _) async {

              if(error == null)
                response = await sendRequest(
                    withToken: withToken,
                    requestSender: requestSender,
                    onSuccess: onSuccess,
                    onEmailNotConf: onEmailNotConf,
                    onForceLoggedOut: onForceLoggedOut,
                    onServerMaybeWakingUp: onServerMaybeWakingUp,
                    onImageDBWakingUp: onImageDBWakingUp,
                    onError: onError,

                    saveServerTime: saveServerTime,
                    jwtTokenRefreshed: true
                );
              else{
                response = error.response;
                saveErrorMessage(error);
                if (error.response?.statusCode == jwtInvalidHttpStatus) {
                  await handleForgetAccount();
                  finish = await onForceLoggedOut?.call();
                }
                if(finish??false) return;
                await onError?.call(error);
              }

            }
          );
          refreshTokenHandler.addListener(listener);
          await refreshTokenHandler.run(awaitFinish: true);
          refreshTokenHandler.removeListener(listener);

          return response;

        } else if(respData == 'invalid_user_key'){
          saveErrorMessage(e);
          await handleForgetAccount();
          finish = await onForceLoggedOut?.call();
          if(finish??false) return e.response;
          await onError?.call(e);
        }

      } else if(e.response?.statusCode == HttpStatus.unauthorized){
        finish = await onEmailNotConf?.call();
      }

      if(finish??false)
        return e.response;
      await onError?.call(e);
      return e.response;
    }
  }

  static Future<void> handleForgetAccount() async {
    await SynchronizerEngine.changeSyncStateInAll([
      SyncableParamSingleMixin.stateSynced,
      SyncableParamSingleMixin.stateSyncInProgress,
    ],
      SyncableParamSingleMixin.stateNotSynced
    );
    SynchronizerEngine.lastSyncTimeLocal = null;
    await AccountData.forgetAccount();
    AccountData.callOnLogout(true);
  }

  // INNE
  // RÓZNE
  // RZECZY

  static Future<List<Memory>> getPublishedMemories(String songFileName) async{

    List<Memory> result = [];

    await sendRequest(
        withToken: false,
        requestSender: (Dio dio) async => await dio.post(
            '${baseUrl}api/song/get_memories',
            data: {'song_file_name': songFileName}
        ),
        onSuccess: (Response response, DateTime now) async {

          for(Map map in response.data)
            result.add(Memory.fromRespMap(map));

        },
      onError: (DioException error)async{
        logger.d(error.response?.data);
      }
    );

    return result;
  }

  static Future<List<Song?>?> getRecommendedSongs({
    Function? onSuccess,
    Function? onError,
  }) async {

    List<Song?>? result = [];

    await sendRequest(
        withToken: true,
        requestSender: (Dio dio) async => await dio.get(
            '${baseUrl}api/song/recommended',
        ),
        onSuccess: (Response response, DateTime now) async {

          for(Map map in response.data)
            result!.add(OffSong.allOfficialMap[map['file_name']]);

          await onSuccess?.call();

        },
        onError: (DioException error)async{
          result = null;
          logger.d(error.response?.data);
          if(onError != null) await onError();
        }
    );

    return result;
  }

}