
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/header_widgets/sector_sep_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

class SingleHeaderWidget extends StatelessWidget{

  final String title;
  final String? text;
  final IconData? icon;

  const SingleHeaderWidget(this.title, this.text, {super.key, this.icon});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [


        SectorSepWidget(title),

        const SizedBox(height: Dimen.SIDE_MARG),

        Material(
          color: cardEnab_(context),
          borderRadius: BorderRadius.circular(AppCard.bigRadius),
          child: Padding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            child: SelectableText(text!, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)),
          ),
        )

      ],
    );

  }

}