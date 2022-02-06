import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/values/colors.dart';

class ArticleThemeColorOption{

  static const ArticleThemeColorOption CREME = ArticleThemeColorOption(
      AppColors.text_def_enab,
      AppColors.icon_enabled,
      AppColors.text_hint_enab,
      AppColors.creme
  );
  static const ArticleThemeColorOption NORMAL = ArticleThemeColorOption(
      AppColors.text_def_enab,
      AppColors.icon_enabled,
      AppColors.text_hint_enab,
      Colors.white
  );
  static const ArticleThemeColorOption BLACK = ArticleThemeColorOption(
      Colors.white,
      ColorPackBlack.ICON_ENABLED,
      Colors.white70,
      Colors.black
  );

  final Color text;
  final Color hint;
  final Color icon;
  final Color background;

  const ArticleThemeColorOption(this.text, this.icon, this.hint, this.background);

  @override
  int get hashCode => text.hashCode + background.hashCode;

  @override
  bool operator == (other) => other is ArticleThemeColorOption && other.hashCode == hashCode;
}