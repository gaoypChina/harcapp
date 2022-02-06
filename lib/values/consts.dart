
import 'package:flutter/cupertino.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

AppTextStyle settingsHintStyle(BuildContext context) => AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL, color: hintEnab_(context));
AppTextStyle settingsTextStyle(BuildContext context) => AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: textEnab_(context), fontWeight: weight.halfBold);
