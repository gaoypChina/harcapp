import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../article.dart';
import 'common.dart';

class DateWidget extends StatelessWidget{

  final Article? article;
  final bool dense;

  const DateWidget(this.article, {super.key, this.dense = false});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: articleDateHero(article!),
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [

            Icon(MdiIcons.calendar, color: Colors.white, size: dense?16.0:Dimen.ICON_SIZE),
            SizedBox(width: dense?8.0:Dimen.ICON_MARG),

            Text(
              article?.dateString??'',
              style: AppTextStyle(
                fontSize:
                dense?
                TEXT_SIZE_DENSE:
                TEXT_SIZE_NORM,
                color: Colors.white,
                fontWeight: weight.bold,
                shadow: true,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),

          ],
        ),
      ),
    );
  }

}
