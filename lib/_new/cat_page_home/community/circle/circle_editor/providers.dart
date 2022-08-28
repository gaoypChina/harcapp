import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_image_data.dart';

import '../../common/community_cover_colors.dart';
import '../model/circle.dart';
import 'package:provider/provider.dart';

class DescriptionProvider extends ChangeNotifier{

  static DescriptionProvider of(BuildContext context) => Provider.of<DescriptionProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  late TextEditingController descriptionController;

  DescriptionProvider({Circle? circle}){
    descriptionController = TextEditingController(text: circle?.description??'');
  }

  void notify() => notifyListeners();

}

class CoverImageProvider extends ChangeNotifier{

  static CoverImageProvider of(BuildContext context) => Provider.of<CoverImageProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  late CommunityCoverImageData _coverImage;
  CommunityCoverImageData get coverImage => _coverImage;
  set coverImage(CommunityCoverImageData value){
    _coverImage = value;
    notifyListeners();
  }

  CoverImageProvider({Circle? circle}){
    _coverImage = circle?.coverImage??CommunityCoverImageData.paths[Random().nextInt(CommunityCoverImageData.paths.length)];
  }

  void notify() => notifyListeners();

}

class ColorsKeyProvider extends ChangeNotifier{

  static ColorsKeyProvider of(BuildContext context) => Provider.of<ColorsKeyProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  String? _colorsKey;
  String? get colorsKey => _colorsKey;
  set colorsKey(String? value){
    _colorsKey = value;
    notifyListeners();
  }

  bool get isColorsKeyAuto => _colorsKey == CommunityCoverColors.colorsKeyAuto;

  ColorsKeyProvider({Circle? circle}){
    _colorsKey = circle?.colorsKey??CommunityCoverColors.colorsKeyAuto;
  }

  void notify() => notifyListeners();

}