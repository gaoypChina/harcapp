import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_icon.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

import 'common.dart';

class SprawTileTemplateWidget extends StatefulWidget{

  final Spraw spraw;
  final EdgeInsets padding;
  final Alignment alignment;
  final void Function()? onTap;
  final Widget? leading;
  final Widget? trailing;

  const SprawTileTemplateWidget({
    required this.spraw,
    this.padding = EdgeInsets.zero,
    this.alignment = Alignment.center,
    this.onTap,
    this.leading,
    this.trailing,
    super.key});

  @override
  State<StatefulWidget> createState() => SprawTileTemplateWidgetState();
}

class SprawTileTemplateWidgetState extends State<SprawTileTemplateWidget>{

  Spraw get spraw => widget.spraw;
  EdgeInsets get padding => widget.padding;
  Alignment get alignment => widget.alignment;
  void Function()? get onTap => widget.onTap;
  Widget? get leading => widget.leading;
  Widget? get trailing => widget.trailing;

  String get title => spraw.title;
  String get level => spraw.level;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap==null?null:() => onTap!(),
    child: Padding(
      padding: padding,
      child: Row(
        children: [

          if(leading != null)
            leading!,

          SizedBox(
            width: Dimen.ICON_FOOTPRINT,
            height: Dimen.ICON_FOOTPRINT + 2*12,
            child: SprawIcon(
                spraw,
                size: SprawIcon.sizeSmall
            ),
          ),

          const SizedBox(width: 16.0),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [

                Text(
                  title,
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      fontWeight: weight.halfBold,
                      color: textEnab_(context)
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 4.0),

                LevelWidget(spraw, size: 16.0),

              ],
            ),
          ),

          if(trailing != null)
            trailing!,

        ],
      ),
    ),
  );

}

class SprawTileProgressWidget extends StatelessWidget{

  final Spraw spraw;

  const SprawTileProgressWidget({required this.spraw, super.key});

  @override
  Widget build(BuildContext context) => Text(
    '${spraw.completenessPercent}%',
    style: AppTextStyle(
        fontSize: Dimen.TEXT_SIZE_APPBAR,
        fontWeight: weight.halfBold,
        color: hintEnab_(context)
    ),
  );

}