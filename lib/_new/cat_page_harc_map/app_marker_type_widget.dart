import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_harc_map/model/marker_type.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

class MarkerTypeTemplateWidget extends StatelessWidget{

  final MarkerType markerType;
  final Color? backgroundColor;
  final Color? textColor;
  final bool dense;
  final void Function()? onTap;

  const MarkerTypeTemplateWidget(
      this.markerType,
      { this.backgroundColor,
        this.textColor,
        this.dense = false,
        this.onTap,
        super.key
      });

  double get textSize => dense?Dimen.TEXT_SIZE_NORMAL:Dimen.TEXT_SIZE_BIG;
  double get padding => dense?Dimen.defMarg:Dimen.ICON_MARG;

  @override
  Widget build(BuildContext context) => SimpleButton(
      color: backgroundColor??backgroundIcon_(context),
      margin: EdgeInsets.zero,
      radius: AppCard.bigRadius,
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          markerTypeToWidget(
              markerType,
              size: textSize + 2*padding,
              elevated: false
          ),

          Padding(
            padding: EdgeInsets.all(padding),
            child: Text(
              markerTypeToName(markerType),
              style: AppTextStyle(
                  color: textColor??iconEnab_(context),
                  fontWeight: weight.halfBold,
                  fontSize: textSize
              ),
            ),
          )

        ],
      )
  );

}

class MarkerTypeWidget extends StatelessWidget{

  final MarkerType markerType;
  final bool selected;
  final bool dense;
  final void Function()? onTap;

  const MarkerTypeWidget(
      this.markerType,
      { this.selected = true,
        this.dense = false,
        this.onTap,
        super.key
      });

  @override
  Widget build(BuildContext context) => MarkerTypeTemplateWidget(
      markerType,
      backgroundColor: getMarkerTypeColor(markerType),
      textColor: selected?Colors.black:Colors.black54,
      dense: dense,
      onTap: onTap
  );

}