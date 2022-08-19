import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/list_items.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';


class TitledCardWidget extends AppCard {
  final TitledItem item;

  TitledCardWidget(this.item) : super();

  @override
  Widget build(BuildContext context) {
    return AppCard(child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(alignment: Alignment.centerLeft,
            child: Padding(
                child: Text(
                    item.title,
                    style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG),
                    textAlign: TextAlign.start),
                padding: const EdgeInsets.only(bottom: Dimen.defMarg))),
        Align(alignment: Alignment.centerLeft,
            child: Text(item.description, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL)))
      ],
    ),
    );
  }

}
