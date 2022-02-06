
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/header_widgets/sector_sep_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:harcapp/_new/cat_page_guide_book/_stopnie/header_widgets/single_line_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

class ListHeaderWidget extends StatelessWidget{

  final String title;
  final List<String> text;
  final IconData icon;

  const ListHeaderWidget(this.title, this.text, {this.icon});

  @override
  Widget build(BuildContext context) {



    List<Widget> children = [];
    for(int i=0; i<text.length; i++){
      String _text = text[i];
      children.add(
          Material(
            color: cardEnab_(context),
            borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
            child: Padding(
              padding: EdgeInsets.all(Dimen.SIDE_MARG),
              child: SelectableText(_text, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)),
            ),
          )
      );

      if(i < text.length - 1)
        children.add(SizedBox(height: 2*Dimen.DEF_MARG));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        //SingleLineWidget(icon, title),

        SectorSepWidget(title),
        SizedBox(height: Dimen.SIDE_MARG),

        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),

      ],
    );

  }

}