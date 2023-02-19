import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_classes/storage.dart';

import 'source.dart';

class ImageLoader{

  static ImageProvider get noInternetImage => Image.asset('assets/images/stref_duch/bg_no_internet.webp').image;
  static ImageProvider get emptyImage => Image.asset('assets/images/stref_duch/bg_empty.webp').image;

  static Future<Image?> loadImage(
      SourceItem item,
      { Function(Image? image, bool cached)? onComplete,
        Function()? onError,
      }) async {

    Image? image;
    File cached = item.cachedFile;
    if(cached.existsSync()) {
      try {
        image = Image.file(cached);
      } on StateError{
        cached.deleteSync();
        image = await loadImage(item, onComplete: onComplete, onError: onError);
      }
      onComplete?.call(image, true);
    }else {
      image = await downloadImage(item, ShaPref.getBool(ShaPref.SHA_PREF_DUCHOWE_SAVE_LOCALLY, true));
      if(image == null) onError?.call();
      else onComplete?.call(image, false);
    }

    return image;

  }

  static Future<Image?> downloadImage(SourceItem item, bool cache) async {

    if(cache) {
      File cachedFile = item.cachedFile;
      cachedFile.createSync(recursive: true);

      Dio dio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
      ));

      try {
        var response = await dio.get(item.downloadUrl, options: Options(responseType: ResponseType.bytes));
        cachedFile.writeAsBytesSync(response.data);
      } catch (e){
        cachedFile.deleteSync(recursive: true);
        return null;
      }

      return Image.file(cachedFile);
    }

    try {
      return Image.network(item.downloadUrl);
    } catch (e){
      return null;
    }

  }

  static List<SourceItem> get allCachedItems {
    Directory foldersDir = Directory(getDuchoweFoldersPath);
    if(!foldersDir.existsSync()) return [];

    List<FileSystemEntity> sourceFolders = foldersDir.listSync();

    List<SourceItem> sourceItems = [];
    for(FileSystemEntity folderEntity in sourceFolders){
      Directory localDirectory = Directory(folderEntity.path);
      List<FileSystemEntity> sourceFolder = localDirectory.listSync();
      List<SourceItem> items = [];
      for(FileSystemEntity entity in sourceFolder) {
        SourceItem item = SourceItem.fromFile(entity.path);
        items.add(item);
      }
      Source source = Source.fromFolderName(folderEntity.path);
      if(source.display)
        sourceItems.addAll(items);

    }
    return sourceItems;
  }

  static List<SourceItem> getCachedItems(Source source) {
    List<SourceItem> items = [];
    Directory dir = Directory(getDuchoweSourceFolderPath(source.uniqId));
    if(!dir.existsSync()) return [];

    List<FileSystemEntity> itemFiles = dir.listSync();
    for(FileSystemEntity entity in itemFiles) {
      SourceItem item = SourceItem.fromFile(entity.path);
      items.add(item);
    }
    return items;
  }

  static int getSavedSourceSize(Source source) {
    Directory dir = Directory(getDuchoweSourceFolderPath(source.uniqId));
    if(!dir.existsSync()) return 0;
    List<FileSystemEntity> itemFiles = dir.listSync();

    int size = 0;

    for(FileSystemEntity entity in itemFiles)
      size += File(entity.path).lengthSync();

    return size;
  }

}