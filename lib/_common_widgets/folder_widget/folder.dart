import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';

abstract class Folder{

  String get name;
  int get count;

  String get iconKey;
  IconData get icon => CommonIconData.get(iconKey, defKey: CommonIconData.folderIconKey);

  String get colorsKey;
  CommonColorData get colorsData => CommonColorData.get(colorsKey);

  const Folder();

}