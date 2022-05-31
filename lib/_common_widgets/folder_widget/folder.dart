import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';

abstract class Folder{

  String get name;
  int get count;

  String get iconKey;
  IconData get icon => CommonIconData.ALL[iconKey]??CommonIconData.FOLDER_ICON;

  String get colorsKey;
  CommonColorData get colorsData => CommonColorData.ALL[colorsKey]??
      CommonColorData.ALL[CommonColorData.DEF_COLORS_KEY]!;

  const Folder();

}