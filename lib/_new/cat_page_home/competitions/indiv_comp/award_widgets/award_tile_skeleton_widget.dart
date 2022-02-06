
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

import '../indiv_comp_awards_page.dart';

class AwardTileSkeletonWidget extends StatelessWidget{

  final int position;
  final IndivCompAward award;
  final Widget text;
  final Widget titleTrailing;

  const AwardTileSkeletonWidget(this.position, this.award, this.text, {this.titleTrailing});

  @override
  Widget build(BuildContext context) => Column(
    children: [

      ListTile(
          leading: rankToAwardWidget(position, size: 36.0),
          title: Row(
            children: [
              Expanded(
                child: Text(
                    'Miejsce ${award.place}',
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_BIG + 2,
                        fontWeight: weight.halfBold
                    )
                ),
              ),

              if(titleTrailing != null) titleTrailing
            ],
          )
      ),

      Row(
        children: [
          SizedBox(width: 72.0),
          Expanded(child: text),
        ],
      ),

    ],
  );

}
