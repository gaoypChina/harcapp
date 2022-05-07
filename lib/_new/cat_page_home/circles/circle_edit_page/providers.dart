import 'package:flutter/material.dart';

import '../circle_cover_image_data.dart';
import '../model/circle.dart';

class NameProvider extends ChangeNotifier{

  TextEditingController nameController;

  NameProvider(Circle circle){
    nameController = TextEditingController(text: circle?.name??'');
  }

}

class DescriptionProvider extends ChangeNotifier{

  TextEditingController descriptionController;

  DescriptionProvider(Circle circle){
    descriptionController = TextEditingController(text: circle?.description??'');
  }

}

class CoverImageProvider extends ChangeNotifier{

  CircleCoverImageData _coverImage;
  CircleCoverImageData get coverImage => _coverImage;
  set coverImage(CircleCoverImageData value){
    _coverImage = value;
    notifyListeners();
  }

  CoverImageProvider(Circle circle){
    _coverImage = circle.coverImage;
  }

}

class ColorsKeyProvider extends ChangeNotifier{

  String _colorsKey;
  String get colorsKey => _colorsKey;
  set colorsKey(String value){
    _colorsKey = value;
    notifyListeners();
  }

  ColorsKeyProvider(Circle circle){
    _colorsKey = circle.colorsKey;
  }

}