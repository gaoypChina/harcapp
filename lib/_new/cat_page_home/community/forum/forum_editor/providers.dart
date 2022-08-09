import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_image_data.dart';

import '../model/forum.dart';

class DescriptionProvider extends ChangeNotifier{

  late TextEditingController descriptionController;

  DescriptionProvider({Forum? forum}){
    descriptionController = TextEditingController(text: forum?.description??'');
  }

}

class CoverImageProvider extends ChangeNotifier{

  CommunityCoverImageData? _coverImage;
  CommunityCoverImageData? get coverImage => _coverImage;
  set coverImage(CommunityCoverImageData? value){
    _coverImage = value;
    notifyListeners();
  }

  CoverImageProvider({Forum? forum}){
    _coverImage = forum?.coverImage??CommunityCoverImageData.paths[Random().nextInt(CommunityCoverImageData.paths.length)];
  }

}

class ColorsKeyProvider extends ChangeNotifier{

  String? _colorsKey;
  String? get colorsKey => _colorsKey;
  set colorsKey(String? value){
    _colorsKey = value;
    notifyListeners();
  }

  ColorsKeyProvider({Forum? forum}){
    _colorsKey = forum?.colorsKey??'auto';
  }

}