import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import 'model/community_category.dart';

class CategoryCommonTemplateWidget extends StatelessWidget{

  final CommunityCategory category;
  final Color? backgroundColor;
  final Color? textColor;
  final bool dense;
  final void Function()? onTap;

  const CategoryCommonTemplateWidget(
      this.category,
      { this.backgroundColor,
        this.textColor,
        this.dense = false,
        this.onTap,
        super.key
      });

  double get textSize => dense?Dimen.TEXT_SIZE_NORMAL:Dimen.TEXT_SIZE_BIG;
  double get padding => dense?Dimen.defMarg:Dimen.ICON_MARG;

  @override
  Widget build(BuildContext context){

    Widget? commCatWidget = commCatToWidget(
        category,
        size: textSize + 2*padding,
        elevated: false
    );

    return SimpleButton(
        color: backgroundColor??backgroundIcon_(context),
        margin: EdgeInsets.zero,
        radius: AppCard.bigRadius,
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            commCatWidget,

            Padding(
              padding: EdgeInsets.all(padding),
              child: Text(
                commCatToName(category),
                style: AppTextStyle(
                    color: textColor??iconEnab_(context),
                    fontWeight: weight.halfBold,
                    fontSize: textSize
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )

          ],
        )
    );
  }

}

class CommunityCategoryWidget extends StatelessWidget{

  final CommunityCategory category;
  final bool selected;
  final bool dense;
  final void Function()? onTap;

  const CommunityCategoryWidget(
      this.category,
      { this.selected = true,
        this.dense = false,
        this.onTap,
        super.key
      });

  @override
  Widget build(BuildContext context) => CategoryCommonTemplateWidget(
      category,
      backgroundColor: selected?backgroundIcon_(context):backgroundIcon_(context),
      textColor: selected?iconEnab_(context):iconDisab_(context),
      dense: dense,
      onTap: onTap
  );

}