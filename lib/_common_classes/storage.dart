import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

late String _localPath;
Future<void> initPaths() async{
  _localPath = (await getApplicationDocumentsDirectory()).path;
}

String get getErrorFolderLocalPath => 'errors';
String get getErrorFolderPath => join(_localPath, getErrorFolderLocalPath);

String get getApiErrorFolderLocalPath => 'api_errors';
String get getApiErrorFolderPath => join(_localPath, getApiErrorFolderLocalPath);

String get getUsageStatsFolderLocalPath => '/usage_stats/';
String get getUsageStatsFolderPath => _localPath + getUsageStatsFolderLocalPath;

String get getGeneralReportFolderLocalPath => '/gen_rep/';
String get getGeneralReportFolderPath => _localPath + getGeneralReportFolderLocalPath;

String get getSongReportFolderLocalPath => '/song_rep/';
String get getSongReportFolderPath => _localPath + getSongReportFolderLocalPath;

String get getOkrzykiFolderLocalPath => '/okrzyki/';
String get getOkrzykiFolderPath => _localPath + getOkrzykiFolderLocalPath;

String get getSongFolderLocalPath => '/songs/';
String get getSongFolderPath => _localPath + getSongFolderLocalPath;

String get getOldOwnSongFileLocalPath => '/own_songs/own_sngs.hrcpsng';
String get getOldOwnSongFilePath => _localPath + getOldOwnSongFileLocalPath;

// String get getOwnLastFileNameFileLocalPath => '/own_songs/own_sng_last_file_name';
// String get getOwnLastFileNameFilePath => _localPath + getOwnLastFileNameFileLocalPath;

String get getSongMemoriesFolderLocalPath => '/song_memories/';
String get getSongMemoriesFolderPath => _localPath + getSongMemoriesFolderLocalPath;

String get getToLearnAlbumLocalPath => '/predefined_albums/to_learn_album';
String get getToLearnAlbumPath => _localPath + getToLearnAlbumLocalPath;

String get getOwnAlbumsFolderLocalPath => '/albums/';
String get getAlbumFolderPath => _localPath + getOwnAlbumsFolderLocalPath;

String get getMyTropFolderLocalPath => '/tropy/own/';
String get getOwnTropFolderPath => _localPath + getMyTropFolderLocalPath;

String get getSharedTropFolderLocalPath => '/tropy/shared/';
String get getSharedTropFolderPath => _localPath + getSharedTropFolderLocalPath;

String get getDuchoweFoldersLocalPath => '/duchowe/';
String get getDuchoweFoldersPath => _localPath + getDuchoweFoldersLocalPath;

String get getRemoveSyncReqFolderLocalPath => '/remove_sync_req/';
String get getRemoveSyncReqFolderPath => _localPath + getRemoveSyncReqFolderLocalPath;

String get _getArticleBaseFolderLocalPath => '/articles/';
String get _getArticleBaseFolderPath => _localPath + _getArticleBaseFolderLocalPath;
String get getArticleCoresFolderPath => '${_getArticleBaseFolderPath}cores/';

String get getArticleCoverFolder => '${_getArticleBaseFolderPath}images/';
String getArticleCoverPath(String id) => '$getArticleCoverFolder$id.jpg';
String getArticleCorePath(String id) => getArticleCoresFolderPath + id;

String get getAuthorsFolderLocalPath => '/author/';
String get getAuthorsFolderPath => _localPath + getAuthorsFolderLocalPath;


String getDuchoweSourceFolderLocalPath(String sourceCode) => "$getDuchoweFoldersLocalPath$sourceCode/";
String getDuchoweSourceFolderPath(String sourceCode) => _localPath + getDuchoweSourceFolderLocalPath(sourceCode);

String localToAbsolutePath(String localPath) => _localPath + localPath;


File saveStringAsFile(String path, String content) {

  File file = File(path);
  file.createSync(recursive: true);

  file.writeAsStringSync(content);
  return file;
}

File saveStringAsFileToFolder(String localPath, String content, {String? fileName}) {
  if(localPath.isNotEmpty && localPath[0]=='/')
    localPath = localPath.substring(1);
  String path = join(_localPath, localPath); //'${_localPath}/$localPath';

  Directory(path).createSync(recursive: true);

  if(fileName == null){
    int i=0;
    while(File(join(path, i.toString())).existsSync()) i++;
    fileName = i.toString();
  }

  return saveStringAsFile(join(path, fileName), content);
}

String getUnusedFileName(String localPath, {String? fileName}){
  String path = '$_localPath/$localPath';

  Directory(path).createSync(recursive: true);

  if(fileName == null){
    int i=0;
    while(File('$path$i').existsSync()) i++;
    fileName = i.toString();
  }

  return fileName;
}

Future<String?> readStringFromAssets(String path) async {
  String nullStr = '幸福 喜 禧 顺 顺利 顺遂 甜水 顺手 和蔼 愃 顺当';
  String result = await rootBundle.loadString(path).catchError((err) => nullStr);
  if(result == nullStr) return null;
  return result;
}

class FileNotFoundError extends Error{}

String readFileAsString(String path){
  if(File(path).existsSync())
    return File(path).readAsStringSync();
  else throw FileNotFoundError();
}

String? readFileAsStringOrNull(String path){
  if(File(path).existsSync())
    return File(path).readAsStringSync();
  else return null;
}

Future<OpenResult> openAsset(String assetPath) async {
  final ByteData bytes = await rootBundle.load(assetPath);
  final Uint8List list = bytes.buffer.asUint8List();

  final tempDir = await getTemporaryDirectory();
  final tempDocumentPath = '${tempDir.path}/$assetPath';

  final file = await File(tempDocumentPath).create(recursive: true);

  file.writeAsBytesSync(list);

  return OpenFile.open(file.path);
}