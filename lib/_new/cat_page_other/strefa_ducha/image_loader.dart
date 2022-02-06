import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_classes/storage.dart';

import 'source.dart';

class ImageLoader{

  static ImageProvider get noInternetImage => Image.asset('assets/images/stref_duch/bg_no_internet.webp').image;
  static ImageProvider get emptyImage => Image.asset('assets/images/stref_duch/bg_empty.webp').image;

  static Future<Image> loadImage(SourceItem item, {Function({Image image, bool cached}) onComplete}) async{

    Image image;
    File cached = item.cachedFile;
    if(cached.existsSync()) {
      image = Image.file(cached);
      if(onComplete!=null) onComplete(image: image, cached: true);
    }else {
      image = await downloadSaveImage(item, shaPref.getBool(ShaPref.SHA_PREF_DUCHOWE_SAVE_LOCALLY, true));
      if(onComplete!=null) onComplete(image: image, cached: false);
    }

    return image;

  }

  static Future<Image> downloadSaveImage(SourceItem item, bool save) async {
    Dio dio = Dio(BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
      sendTimeout: 3000,
    ));

    if(save) {
      File cachedFile = item.cachedFile;
      if(cachedFile.existsSync()) return Image.file(cachedFile);
      cachedFile.createSync(recursive: true);

      try {
        var response = await dio.get(item.downloadUrl(), options: Options(responseType: ResponseType.bytes));
        cachedFile.writeAsBytesSync(response.data);
      } catch (e){
        cachedFile.deleteSync(recursive: true);
        return null;
      }

      return Image.file(cachedFile);
    }else{
      try {
        return Image.network(item.downloadUrl());
      } catch (e){
        return null;
      }
    }
  }

  static List<Source> get allLocalItems {
    Directory foldersDir = Directory(getDuchoweFoldersPath);
    if(!foldersDir.existsSync()) return [];

    List<FileSystemEntity> sourceFolders = foldersDir.listSync();

    List<Source> sources = [];
    for(FileSystemEntity folderEntity in sourceFolders){
      Directory localDirectory = Directory(folderEntity.path);
      List<FileSystemEntity> sourceFolder = localDirectory.listSync();
      List<SourceItem> items = [];
      for(FileSystemEntity entity in sourceFolder) {
        SourceItem item = SourceItem.fromFile(shaPref, entity.path);
        items.add(item);
      }
      Source source = Source.fromFolderName(shaPref, folderEntity.path);
      source.addAll(items);
      sources.add(source);

    }
    return sources;
  }

  static List<SourceItem> getLocalItems(ShaPref shaPref, Source source) {
    List<SourceItem> items = [];
    Directory dir = Directory(getDuchoweSourceFolderPath(source.code));
    if(!dir.existsSync()) return [];

    List<FileSystemEntity> itemFiles = dir.listSync();
    for(FileSystemEntity entity in itemFiles) {
      SourceItem item = SourceItem.fromFile(shaPref, entity.path);
      items.add(item);
    }
    return items;
  }

  static int getSavedSourceSize(Source source) {
    Directory dir = Directory(getDuchoweSourceFolderPath(source.code));
    if(!dir.existsSync()) return 0;
    List<FileSystemEntity> itemFiles = dir.listSync();

    int size = 0;

    for(FileSystemEntity entity in itemFiles)
      size += File(entity.path).lengthSync();

    return size;
  }

}