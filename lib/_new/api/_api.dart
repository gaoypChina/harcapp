
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_common_classes/time_settings.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/memory.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/off_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/ms_oauth.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp/values/server.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import '../../sync/syncable_new.dart';


const int jwtInvalidHttpStatus = HttpStatus.forbidden;
const int _CONNECT_IIMEOUT = 18000;
const int _RECEIVE_IIMEOUT = 40000;

class InvalidResponseError extends Error{

  String paramName;

  InvalidResponseError(this.paramName);

  @override
  String toString() => 'InvalidResponseError. Missing param: $paramName.';

}

class API{

  static const String SERVER_URL = '$SERVER_IP${SERVER_PORT==null?'':':$SERVER_PORT'}/';

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
    required Future<Response> Function(Dio dio) sendRequest,
    FutureOr<void> Function(Response, DateTime)? onSuccess,
    FutureOr<bool> Function()? onEmailNotConf,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<bool> Function()? onImageDBWakingUp,
    FutureOr<void> Function(DioError)? onError,

    bool saveServerTime = true
  }) async {

    Dio dio = Dio(BaseOptions(
      headers: {
        if(withToken) 'Authorization': 'Bearer ${AccountData.jwt}',
      },
      connectTimeout: _CONNECT_IIMEOUT,
      receiveTimeout: _RECEIVE_IIMEOUT,
    ));

    try {
      Response response = await sendRequest(dio);

      if(response.statusCode == HttpStatus.ok){
        debugPrint('HarcApp API: ${response.requestOptions.method} ${response.requestOptions.path} :: success!');
        DateTime lastServerTime = DateTime.tryParse(response.headers.value('time')??'')??DateTime(966);
        if(saveServerTime) AccountData.writeLastServerTime(lastServerTime);
        await onSuccess?.call(response, lastServerTime);
      }
      return response;
    } on DioError catch (e) {
      debugPrint('HarcApp API: ${e.requestOptions.method} ${e.requestOptions.path} :: error! :: ${e.message} :: ${e.response?.data?.toString()}');
      bool? finish;

      saveStringAsFileToFolder(
        getApiErrorFolderLocalPath,
        '# Date: ${DateTime.now().toIso8601String()}'
        '\n# System time used: ${await TimeSettings.isTimeAutomatic}'
        '\n# Status code: ${e.response?.statusCode}'
        '\n# Status message: ${e.response?.statusMessage}'
        '\n# Response error data:\n${e.response?.data}'
      );

      if(e.response?.statusCode == 400 && e.response?.data == "image_db_sleeping"){
        finish = await onImageDBWakingUp?.call();
        if(await isNetworkAvailable())
          Dio().get(IMAGE_DB_SERVER_IP).onError((e, __) => Response(requestOptions: RequestOptions(path: '')));

      }

      if (e.response?.statusCode == 404) {
        finish = await onServerMaybeWakingUp?.call();
        if(await isNetworkAvailable())
          Dio().get(SERVER_URL).onError((e, __) => Response(requestOptions: RequestOptions(path: '')));

      } else if (e.response?.statusCode == jwtInvalidHttpStatus) {
        await SynchronizerEngine.changeSyncStateInAll([
            SyncableParamSingle_.stateSynced,
            SyncableParamSingle_.stateSyncInProgress,
          ],
          SyncableParamSingle_.stateNotSynced
        );
        SynchronizerEngine.lastSyncTimeLocal = null;
        await ZhpAccAuth.logout();
        await AccountData.forgetAccount();
        AccountData.callOnForceLogout();

        finish = await onForceLoggedOut?.call();
      } else if(e.response?.statusCode == HttpStatus.unauthorized){
        finish = await onEmailNotConf?.call();
      }

      if(finish??false)
        return e.response;

      await onError?.call(e);

      return e.response;
    }
  }


  // INNE
  // RÓZNE
  // RZECZY

  static Future<List<Memory>> getPublishedMemories(String songFileName) async{

    List<Memory> result = [];

    await sendRequest(
        withToken: false,
        sendRequest: (Dio dio) async => await dio.post(
            '${SERVER_URL}api/song/get_memories',
            data: {'song_file_name': songFileName}
        ),
        onSuccess: (Response response, DateTime now) async {

          for(Map map in response.data)
            result.add(Memory.fromResponseData(map));

        },
      onError: (DioError error)async{
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
        sendRequest: (Dio dio) async => await dio.get(
            '${SERVER_URL}api/song/recomended',
        ),
        onSuccess: (Response response, DateTime now) async {

          for(Map map in response.data)
            result!.add(OffSong.allOfficialMap[map['file_name']]);

          await onSuccess?.call();

        },
        onError: (DioError error)async{
          result = null;
          logger.d(error.response?.data);
          if(onError != null) await onError();
        }
    );

    return result;
  }

}