import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/missing_decode_param_error.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_state_local.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_state_shared.dart';

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
    required this.userData,
    required this.rankType,
    required this.sharedRankKey,
    required this.rankUniqName,

    required this.rankCompleted,
    required this.rankInProgress,
    required this.rankCompletedTasksCnt,

    required this.lastUpdateDate,
  });

  static SharedRankMetaData fromRespMap(Map respMap){

    Map<String, dynamic> rankData = respMap['rank']??(throw InvalidResponseError('rank'));

    return SharedRankMetaData(
      userData: UserData.fromRespMap(respMap['user']),
      rankType: rankData['type']??(throw InvalidResponseError('type')),
      sharedRankKey: rankData['key']??(throw InvalidResponseError('key')),
      rankUniqName: rankData['uniqName']??(throw InvalidResponseError('uniqName')),

      rankCompleted: rankData['completed']??(throw InvalidResponseError('completed')),
      rankInProgress: rankData['inProgress']??(throw InvalidResponseError('inProgress')),
      rankCompletedTasksCnt: rankData['completedTasksCnt']??(throw InvalidResponseError('completedTasksCnt')),

      lastUpdateDate: DateTime.parse(rankData['lastUpdateTime']??(throw InvalidResponseError('lastUpdateTime')))
    );
  }

  int get completenessPercent{
    Rank rank = Rank.allMap[rankUniqName]!;
    return 100*rankCompletedTasksCnt~/(rank.state as RankStateLocal).taskCount;
  }

}

class ApiRank{

  static Future<Response?> shareRank(
      String uniqName,
      { required List<String?> addByNick,
        required List<String> removeByKey,
        void Function()? onError,
        void Function(List<UserData> sharedUsers)? onSuccess,
      }) async => await API.sendRequest(
    withToken: true,
    requestSender: (Dio dio) => dio.post(
      '${API.SERVER_URL}api/rank/share/$uniqName',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      }),
      data: jsonEncode({
        'addByNick': addByNick,
        'removeByKey': removeByKey,
      })
    ),
    onSuccess: (Response response, DateTime now) async {

      List<UserData> userRespBodies = [];

      Map<String, dynamic> rawData = response.data;
      for(String key in rawData.keys)
        userRespBodies.add(UserData.fromRespMap(rawData[key], key: key));

      onSuccess?.call(userRespBodies);
    },
    onError: (DioError error) async => onError?.call()
  );

  static Future<Response?> getAllShareUsers(
      String uniqName,
      { void Function()? onError,
        void Function(List<UserData> sharedUsers)? onSuccess,
      }) async => await API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.get(
        '${API.SERVER_URL}api/rank/share/$uniqName',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
      ),
      onSuccess: (Response response, DateTime now) async {

        List<UserData> userRespBodies = [];

        Map<String, dynamic> rawData = response.data;
        for(String key in rawData.keys)
          userRespBodies.add(UserData.fromRespMap(rawData[key], key: key));

        onSuccess?.call(userRespBodies);
      },
      onError: (DioError error) async => onError?.call()
  );

  static Future<Response?> getAllShared(
      { void Function()? onError,
        void Function(List<SharedRankMetaData>)? onSuccess,
      }) async => await API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.get(
          '${API.SERVER_URL}api/rank/shared',
      ),
      onSuccess: (Response response, DateTime now) async {

        List<SharedRankMetaData> sharedRankMetaDataList = [];

        List<dynamic> rawData = response.data;
        for(dynamic rawDataItem in rawData)
          sharedRankMetaDataList.add(SharedRankMetaData.fromRespMap(rawDataItem));

        onSuccess?.call(sharedRankMetaDataList);
      },
      onError: (DioError error) async => onError?.call()
  );

  static Future<Response?> getShared({
    required String key,
    required DateTime lastUpdateTime,
    void Function(Rank rank)? onSuccess,
    void Function(Response? response)? onError,
  }) async => await API.sendRequest(
    withToken: true,
    requestSender: (Dio dio) async => await dio.get(
      '${API.SERVER_URL}api/rank/shared/$key',
    ),
    onSuccess: (Response response, DateTime now) async {

      Map<String, dynamic> rankSyncData = response.data;
      String rankUniqName = rankSyncData['uniqName']??(throw MissingDecodeParamError('uniqName'));

      RankStateShared stateShared = RankStateShared.fromRespMap(key, rankUniqName, lastUpdateTime, rankSyncData);
      stateShared.dump();

      Rank? preview = Rank.fromStateShared(rankUniqName, stateShared);

      if(preview == null) onError?.call(null);
      else onSuccess?.call(preview);

    },
    onError: (err) async => onError?.call(err.response),
  );

}