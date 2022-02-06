import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_widget_small.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

class SprawGridView extends StatelessWidget{

  final String title;
  final String mode;
  final List<String> UIDs;
  final IconData icon;
  final Color sprawCardBackgroundColor;
  final Widget emptyWidget;
  final String emptyMessage;
  final bool showProgress;
  final void Function(Spraw spraw) onSprawLongPress;

  SprawGridView({@required this.title, @required this.mode, @required this.UIDs, @required this.icon, this.sprawCardBackgroundColor, this.emptyWidget, this.emptyMessage = 'Pusto', this.showProgress = false, this.onSprawLongPress});

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(String UID in UIDs){

      Spraw spraw = Spraw.fromUID(UID);

      if(spraw == null){
        if(true)
          children.add(AppCard(child: Text(spraw.uniqName)));
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
      children.add(SizedBox(width: SprawWidgetSmall.width, height: SprawWidgetSmall.height));


    return Stack(
      children: [

        Positioned(
            right: -0.1*MediaQuery.of(context).size.width,
            bottom: -0.1*MediaQuery.of(context).size.width,
            child: Hero(
              tag: icon,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(-15 / 360),
                child: Icon(
                  icon,
                  color: backgroundIcon_(context),
                  size: MediaQuery.of(context).size.width,
                ),
              ),
            )
        ),

        if(UIDs.isEmpty)
          emptyWidget??
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
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: Dimen.SIDE_MARG),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: children,
            ),
          ),
        )
      ],
    );

  }

}
