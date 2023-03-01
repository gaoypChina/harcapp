import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/spraw_widget_small.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

class SprawGridView extends StatelessWidget{

  final String title;
  final String mode;
  final List<String>? UIDs;
  final IconData? icon;
  final Color? sprawCardBackgroundColor;
  final Widget? emptyWidget;
  final String emptyMessage;
  final bool showProgress;
  final void Function(Spraw spraw)? onSprawLongPress;
  final void Function(String uniqSprawName)? onInvalidSprawLongPress;

  const SprawGridView({
    required this.title,
    required this.mode,
    required this.UIDs,
    required this.icon,
    this.sprawCardBackgroundColor,
    this.emptyWidget,
    this.emptyMessage = 'Pusto',
    this.showProgress = true,
    this.onSprawLongPress,
    this.onInvalidSprawLongPress,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(String uniqSprawName in UIDs!){

      Spraw? spraw = Spraw.fromUID(uniqSprawName);

      if(spraw == null){
        children.add(SizedBox(
          height: SprawWidgetSmall.height,
          width: SprawWidgetSmall.height,
          child: SimpleButton(
            elevation: AppCard.bigElevation,
            color: background_(context),
            radius: AppCard.bigRadius,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Dimen.defMarg),
              physics: const BouncingScrollPhysics(),
              child: AppText(
                  '<b>Błąd kodu sprawności</b>'
                      '\n\n$uniqSprawName'
                      '\n\n<b>Przytrzymaj, by ją usunać.</b>',
                  size: Dimen.TEXT_SIZE_SMALL
              ),
            ),
            onTap: () => showAppToast(context, text: 'Przytrzymaj by usunąć'),
            onLongPress: () => onInvalidSprawLongPress?.call(uniqSprawName),
          ),
        ));
        continue;
      }

      children.add(
          SprawWidgetSmall(
              spraw, mode,
              showProgress: showProgress,
              backgroundColor: sprawCardBackgroundColor,
              onLongPress: () => onSprawLongPress?.call(spraw),
          )
      );
    }

    while(children.length % 3 != 0)
      children.add(const SizedBox(width: SprawWidgetSmall.width, height: SprawWidgetSmall.height));

    return Stack(
      children: [

        Positioned(
            right: -0.1*MediaQuery.of(context).size.width,
            bottom: -0.1*MediaQuery.of(context).size.width,
            child: Hero(
              tag: icon!,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-15 / 360),
                child: Icon(
                  icon,
                  color: background_(context),
                  size: MediaQuery.of(context).size.width,
                ),
              ),
            )
        ),

        if(UIDs!.isEmpty)
          emptyWidget!=null?
          Center(
            child: emptyWidget,
          ):
          Positioned.fill(
            child: Center(
              child: Text(
                emptyMessage,
                style: AppTextStyle(
                    fontSize: 64.0,
                    fontWeight: weight.bold,
                    color: iconEnab_(context)
                ),
              ),
            ),
          ),

        Positioned.fill(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(Dimen.SIDE_MARG/2),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: Dimen.ICON_MARG,
              children: children,
            ),
          ),
        )
      ],
    );

  }

}
