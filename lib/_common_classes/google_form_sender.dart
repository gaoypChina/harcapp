
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp_core/comm_classes/network.dart';

class GoogleFormSender{

  static const String SONG_ERROR_FORM_URL = 'https://docs.google.com/forms/d/e/1FAIpQLSeYxKO5KOmU1iBjqzQO6X8yHbsXC90v3sE72K8ODs8xQylzYA/formResponse';
  static const String GEN_ERROR_FORM_URL = "https://docs.google.com/forms/d/e/1FAIpQLScodk1gKrMhhr3aGh-OYYdGS9LHtVNXH3-6SCbQ7yl0Q7yezw/formResponse";
  static const String USAGE_STATS_FORM_URL = "https://docs.google.com/forms/d/e/1FAIpQLSdV1tuPjCU5Noo9Qjt67LoVRG2KKA75hXBSapHw7UHtGUtBtQ/formResponse";


  static const String SEPARATOR = '~';

  String url;
  Function? beforeSubmit;
  Function(Response)? afterSubmit;

  Map<String, String?>? body;

  GoogleFormSender(this.url, {this.beforeSubmit, this.afterSubmit, this.body}){
    if(body == null) body = {};
  }

  addTextResponse(String entryId, String? text){
    body![entryId] = text;
  }

  Future<void> submit({saveLocalPath}) async {
    if(beforeSubmit!=null) beforeSubmit!();

    if(!(await isNetworkAvailable()) && saveLocalPath!=null) {
      saveToFile(localPath: saveLocalPath);
      return;
    }

    FormData formData = FormData.fromMap(body!);
    Response response = await Dio().post(
      url,
      data: formData,
    );

    if(response.statusCode != 200 && saveLocalPath!=null)
      saveToFile(localPath: saveLocalPath);

    if(afterSubmit!=null) afterSubmit!(response);
  }

  void saveToFile({required String localPath}) async {
    String result = '';
    result += url + SEPARATOR;
    for(String key in body!.keys.toList())
      result += key + SEPARATOR + body![key]! + SEPARATOR;

    result = result.substring(0, result.length-1);

    await saveStringAsFileToFolder(localPath, result);
  }

  static resend({required String folderLocalPath}) async{

    String folderPath = await localToAbsolutePath(folderLocalPath);
    if(!Directory(folderPath).existsSync()) return;

    List<FileSystemEntity> files = Directory(folderPath).listSync();
    for(FileSystemEntity file in files){
      String code = readFileAsString(file.path);
      List<String> elements = code.split(SEPARATOR);
      String url = elements[0];

      Map<String, String> body = {};
      for(int i=1; i< elements.length; i+=2)
        body[elements[i]] = elements[i+1];

      await GoogleFormSender(
          url,
          body: body,
          afterSubmit: (response) => file.deleteSync()
      ).submit(saveLocalPath: folderLocalPath);
    }
  }
}