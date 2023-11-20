import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/account_header_widget.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';

Future<void> showAccountDetailsBottomSheet(
    BuildContext context,
    UserData user,
    { Color? thumbnailColor,
      Color? thumbnailBorderColor,
      Color? thumbnailMarkerColor,
      Color? backgroundColor,
    }
) => showScrollBottomSheet(
    context: context,
    builder: (context) => BottomSheetDef(
      color: backgroundColor??background_(context),
      builder: (context) => AccountHeaderWidget.fromUserData(
        user,
        thumbnailColor: thumbnailColor??cardEnab_(context),
        thumbnailBorderColor: thumbnailBorderColor??cardEnab_(context),
        thumbnailMarkerColor: thumbnailMarkerColor??cardEnab_(context),
        backgroundColor: backgroundColor??background_(context),
        detailsBorderColor: thumbnailBorderColor,
        showDetails: true,
        showDetailsButton: false
      ),
  ),
);