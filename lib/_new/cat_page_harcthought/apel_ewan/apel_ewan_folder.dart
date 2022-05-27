import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';

import 'apel_ewan.dart';

abstract class ApelEwanFolder{

  final String id;
  final List<ApelEwan> generalApelEwans;
  final Map<ApelEwan, String> notedApelEwans;

  const ApelEwanFolder({
    required this.id,
    required this.generalApelEwans,
    required this.notedApelEwans
  });

  bool get isEmpty;

  String get name;

  String get colorsKey;
  CommonColorData get colorData => CommonColorData.ALL[colorsKey]??
      CommonColorData.ALL[CommonColorData.DEF_COLORS_KEY]!;

  String get iconKey;
  IconData get icon => CommonIconData.ALL[iconKey]??CommonIconData.FOLDER_ICON;

  @override
  bool operator == (Object other) =>
      other is ApelEwanFolder && id == other.id;

  @override
  int get hashCode => id.hashCode;

}