import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';

import '../widgets/spraw_widget.dart';

void openSprawDialog(
    BuildContext context,
    Spraw spraw,
    { heroTag,
      void Function()? onStateChanged,
      void Function()? onReqComplChanged
    }) => openDialog(
    context: context,
    builder: (context){
      Widget child = Padding(
        padding: MediaQuery.of(context).viewInsets.add(AppCard.normMargin),
        child: Material(
          color: background_(context),
          borderRadius: BorderRadius.circular(AppCard.bigRadius),
          clipBehavior: Clip.hardEdge,
          child: SprawWidget(
              spraw,
              onStateChanged: onStateChanged,
              onReqComplChanged: onReqComplChanged
          )
        ),
      );

      if(heroTag == null)
        return child;
      else
        return Hero(
          tag: heroTag,
          child: child,
        );
    }
);