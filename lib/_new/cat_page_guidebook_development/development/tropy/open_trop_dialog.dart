import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_page.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_widget.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';

void openTropDialog(
    BuildContext context,
    Trop trop
) => openDialog(
    context: context,
    builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets.add(AppCard.normMargin),
        child: Material(
            color: background_(context),
            borderRadius: BorderRadius.circular(AppCard.bigRadius),
            clipBehavior: Clip.hardEdge,
            child: TropWidget(trop)
        ),
      )
);

Future<void> _loadHandleTrop(BuildContext context, TropSharedPreviewData data, {required bool dialog}) async {

  Trop? loadSharedTrop;
  if(Trop.allSharedMapByKey.containsKey(data.key))
    if(data.lastUpdateTime == Trop.allSharedMapByKey[data.key]!.lastUpdateTime)
      loadSharedTrop = Trop.allSharedMapByKey[data.key];

  if(loadSharedTrop != null)
    pushPage(context, builder: (context) => TropPage(loadSharedTrop!));
  else {
    showLoadingWidget(context, AppColors.zhpTropColor, 'Otwieranie...');
    await ApiTrop.getTrop(
        tropKey: data.key,
        onSuccess: (Trop trop) async {
          trop.saveShared();
          Trop.addSharedToAll(trop, context: context);

          await popPage(context);
          if(dialog) openDialog(context: context, builder: (context) => TropPage(trop));
          else pushPage(context, builder: (context) => TropPage(trop));
        },
        onError: (_) async {
          await popPage(context);
          showAppToast(context, text: simpleErrorMessage);
        }
    );
  }
}

Future<void> loadOpenTropDialog(BuildContext context, TropSharedPreviewData data) async =>
  _loadHandleTrop(context, data, dialog: true);

Future<void> loadPushTropPage(BuildContext context, TropSharedPreviewData data) async =>
    _loadHandleTrop(context, data, dialog: false);