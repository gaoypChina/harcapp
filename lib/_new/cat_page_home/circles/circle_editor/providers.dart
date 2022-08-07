import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_image_data.dart';

import '../model/circle.dart';

class NameProvider extends ChangeNotifier{

  late TextEditingController nameController;

  NameProvider({Circle? circle}){
    nameController = TextEditingController(text: circle?.name??'');
  }

}

class DescriptionProvider extends ChangeNotifier{

  late TextEditingController descriptionController;

  DescriptionProvider({Circle? circle}){
    descriptionController = TextEditingController(text: circle?.description??'');
  }

}

class CoverImageProvider extends ChangeNotifier{

  CommunityCoverImageData? _coverImage;
  CommunityCoverImageData? get coverImage => _coverImage;
  set coverImage(CommunityCoverImageData? value){
    _coverImage = value;
    notifyListeners();
  }

  CoverImageProvider({Circle? circle}){
    _coverImage = circle?.coverImage??CommunityCoverImageData.paths[Random().nextInt(CommunityCoverImageData.paths.length)];
  }

}

class ColorsKeyProvider extends ChangeNotifier{

  String? _colorsKey;
  String? get colorsKey => _colorsKey;
  set colorsKey(String? value){
    _colorsKey = value;
    notifyListeners();
  }

  ColorsKeyProvider({Circle? circle}){
    _colorsKey = circle?.colorsKey??'auto';
  }

}