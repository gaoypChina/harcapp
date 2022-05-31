import 'package:flutter/cupertino.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:oktoast/oktoast.dart';

import 'app_text.dart';

void showAppToast(
    BuildContext context,
    {String? header,
    required String text,
    Color? background,
    Color? textColor,
    Duration duration = const Duration(seconds: 3)
}) => showToastWidget(
    Padding(
      padding: const EdgeInsets.only(
        right: 12.0,
        left: 12.0,
        bottom: 46.0,
      ),
      child: AppCard(
          radius: 12.0,
          elevation: 20.0,
          color: background??cardEnab_(context),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if(header != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Text(
                        header,
                        style: AppTextStyle(color: textColor??textEnab_(context), fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
                        textAlign: TextAlign.center,
                      ),
                    ),

                  AppText(
                    text,
                    color: textEnab_(context),
                    size: Dimen.TEXT_SIZE_BIG,
                    textAlign: TextAlign.center,
                  ),
                ],
              )
          )
      )
    ),
    position: ToastPosition.bottom,
    duration: duration,
    dismissOtherToast: true,
);