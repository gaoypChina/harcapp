
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/memory.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/off_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp/values/server.dart';


const int JWT_VALID_HTTP_STATUS = HttpStatus.unauthorized;
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

  static Response createFakeErrResponse({String error, Map<String, dynamic> errMap}){

    return Response(
      statusCode: HttpStatus.badRequest,
      requestOptions: null,
      data: {
        'error': error??'',
        'errors': errMap,
      },
    );

  }

  static Future<Response> sendRequest ({
    bool withToken = false,
    Future<Response> Function(Dio dio) sendRequest,
    Future<void> Function(Response) onSuccess,
    Future<bool> Function() onEmailNotConf,
    Future<bool> Function() onUnauthorized,
    Future<void> Function(DioError) onError,

  }) async {

    //if(withToken && (token??AccSecData.jwt) == null) {
    //  AccSecData.forgetAccount();
    //  return Response(statusCode: JWT_VALID_HTTP_STATUS, requestOptions: null);
    //}
    Dio dio = Dio(BaseOptions(
      headers: {
        if(withToken) 'Authorization': 'Bearer ${AccSecData.jwt}',
        //'Content-Type': 'multipart/form-data',
        //'Accept': '*/*',
      },
      connectTimeout: _CONNECT_IIMEOUT,
      receiveTimeout: _RECEIVE_IIMEOUT,
    ));

    try {
      Response response = await sendRequest(dio);

      if(response.statusCode == HttpStatus.ok){
        debugPrint('HarcApp API: ${response.requestOptions.method} ${response.requestOptions.path} :: success!');
        await onSuccess?.call(response);
      }
      return response;
    } on DioError catch (e) {
      debugPrint('HarcApp API: ${e.requestOptions.method} ${e.requestOptions.path} :: error! :: ${e.message} :: ${e.response?.data?.toString()}');
      bool finish;
      if (e.response?.statusCode == JWT_VALID_HTTP_STATUS) {
        await SynchronizerEngine.changeSyncStateInAll([
          SyncableParamSingle.STATE_SYNCED,
          SyncableParamSingle.STATE_SYNC_IN_PROGRESS,
        ],
          SyncableParamSingle.STATE_NOT_SYNCED
        );
        SynchronizerEngine.lastSyncTimeLocal = null;
        await AccSecData.forgetAccount();

        finish = await onUnauthorized?.call();
      } else if(e.response?.statusCode == HttpStatus.forbidden){
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
            SERVER_URL + 'api/song/get_memories',
            data: {'song_file_name': songFileName}
        ),
        onSuccess: (Response response)async{

          for(Map map in response.data)
            result.add(Memory.fromResponseData(map));

        },
      onError: (DioError error)async{
          print(error.response?.data);
      }
    );

    return result;
  }

  static Future<List<Song>> getRecomendedSongs({
    Function onSuccess,
    Function onError,
  }) async {

    List<Song> result = [];

    await sendRequest(
        withToken: true,
        sendRequest: (Dio dio) async => await dio.get(
            SERVER_URL + 'api/song/recomended',
        ),
        onSuccess: (Response response)async{

          for(Map map in response.data)
            result.add(OffSong.allOfficialMap[map['file_name']]);

          if(onSuccess != null) await onSuccess();

        },
        onError: (DioError error)async{
          result = null;
          print(error.response?.data);
          if(onError != null) await onError();
        }
    );

    return result;
  }
}