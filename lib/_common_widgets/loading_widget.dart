import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

class LoadingWidget extends StatelessWidget{

  final Color? color;
  final String text;

  const LoadingWidget(this.text, {this.color, super.key});

  @override
  Widget build(BuildContext context) => AppCard(
      radius: AppCard.bigRadius,
      margin: const EdgeInsets.all(Dimen.SIDE_MARG),
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(
            height: Dimen.ICON_SIZE,
            child: SpinKitChasingDots(
              size: Dimen.ICON_SIZE,
              color: color??iconEnab_(context),
            ),
          ),

          const SizedBox(width: Dimen.SIDE_MARG),

          Text(text, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), overflow: TextOverflow.ellipsis),

        ],
      )
  );

}

showLoadingWidget(BuildContext context, String text, {Color? color}) => openDialog(
    context: context,
    dismissible: false,
    builder: (context) => Center(
      child: LoadingWidget(text, color: color),
    )
);