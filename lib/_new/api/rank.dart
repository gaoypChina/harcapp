import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_state_shared.dart';

import '_api.dart';

class SharedRankMetaData{

  final UserData userData;
  final String rankType;
  final String sharedRankKey;
  final String rankUniqName;

  final bool rankCompleted;
  final bool rankInProgress;
  final int rankCompletedTasksCnt;

  final DateTime lastUpdateDate;

  const SharedRankMetaData({
    @required this.userData,
    @required this.rankType,
    @required this.sharedRankKey,
    @required this.rankUniqName,

    @required this.rankCompleted,
    @required this.rankInProgress,
    @required this.rankCompletedTasksCnt,

    @required this.lastUpdateDate,
  });

  static SharedRankMetaData fromMap(Map map){

    Map<String, dynamic> rankData = map['rank']??(throw InvalidResponseError('rank'));

    return SharedRankMetaData(
      userData: UserData.fromMap(map['user']),
      rankType: rankData['type']??(throw InvalidResponseError('type')),
      sharedRankKey: rankData['key']??(throw InvalidResponseError('key')),
      rankUniqName: rankData['uniqName']??(throw InvalidResponseError('uniqName')),

      rankCompleted: rankData['completed']??(throw InvalidResponseError('completed')),
      rankInProgress: rankData['inProgress']??(throw InvalidResponseError('inProgress')),
      rankCompletedTasksCnt: rankData['completedTasksCnt']??(throw InvalidResponseError('completedTasksCnt')),

      lastUpdateDate: DateTime.parse(rankData['lastUpdateTime']??(throw InvalidResponseError('lastUpdateTime')))
    );
  }

}

class ApiRank{

  static Future<Response> shareRank(
      String uniqName,
      { @required List<String> addByNick,
        @required List<String> removeByKey,
        void Function() onError,
        void Function(List<UserData> sharedUsers) onSuccess,
      }) async => await API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) => dio.post(
      API.SERVER_URL + 'api/rank/share/$uniqName',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      }),
      data: jsonEncode({
        'addByNick': addByNick,
        'removeByKey': removeByKey,
      })
    ),
    onSuccess: (Response response) async {

      List<UserData> userRespBodies = [];

      Map<String, dynamic> rawData = response.data;
      for(String key in rawData.keys)
        userRespBodies.add(UserData.fromMap(rawData[key], key: key));

      await onSuccess?.call(userRespBodies);
    },
    onError: (DioError error) async => await onError?.call()
  );

  static Future<Response> getAllShareUsers(
      String uniqName,
      { void Function() onError,
        void Function(List<UserData> sharedUsers) onSuccess,
      }) async => await API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.get(
        API.SERVER_URL + 'api/rank/share/$uniqName',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
      ),
      onSuccess: (Response response) async {

        List<UserData> userRespBodies = [];

        Map<String, dynamic> rawData = response.data;
        for(String key in rawData.keys)
          userRespBodies.add(UserData.fromMap(rawData[key], key: key));

        await onSuccess?.call(userRespBodies);
      },
      onError: (DioError error) async => await onError?.call()
  );

  static Future<Response> getAllShared(
      { void Function() onError,
        void Function(List<SharedRankMetaData>) onSuccess,
      }) async => await API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.get(
          API.SERVER_URL + 'api/rank/shared',
      ),
      onSuccess: (Response response) async {

        List<SharedRankMetaData> sharedRankMetaDataList = [];

        List<dynamic> rawData = response.data;
        for(dynamic rawDataItem in rawData)
          sharedRankMetaDataList.add(SharedRankMetaData.fromMap(rawDataItem));

        await onSuccess?.call(sharedRankMetaDataList);
      },
      onError: (DioError error) async => await onError?.call()
  );

  static Future<Response> getShared({
    @required String key,
    @required DateTime lastUpdateTime,
    void Function(Rank rank) onSuccess,
    void Function(Response response) onError,
  }) async => await API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) async => await dio.get(
      API.SERVER_URL + 'api/rank/shared/$key',
    ),
    onSuccess: (Response response) async {

      Map<String, dynamic> rankSyncData = response.data;
      String uniqRankName = rankSyncData['uniqName'];

      RankStateShared stateShared = RankStateShared.from(key, lastUpdateTime, rankSyncData);
      stateShared.dump();

      Rank preview = Rank.fromStateShared(uniqRankName, stateShared);

      onSuccess?.call(preview);

    },
    onError: (err) async => await onError?.call(err.response),
  );


}