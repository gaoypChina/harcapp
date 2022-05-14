import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

class LoadingWidget extends StatelessWidget{

  final Color color;
  final String text;

  const LoadingWidget(this.color, this.text, {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
        radius: AppCard.BIG_RADIUS,
        margin: const EdgeInsets.all(Dimen.SIDE_MARG),
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(
              height: Dimen.ICON_SIZE,
              child: SpinKitChasingDots(
                size: Dimen.ICON_SIZE,
                color: color,
              ),
            ),

            const SizedBox(width: Dimen.SIDE_MARG),

            Text(text, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), overflow: TextOverflow.ellipsis),

          ],
        )
    );
  }

}

showLoadingWidget(BuildContext context, Color color, String text) => openDialog(
    context: context,
    dismissible: false,
    builder: (context) => Center(
      child: LoadingWidget(color, text),
    )
);