import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../article.dart';
import 'common.dart';

class AuthorWidget extends StatelessWidget{

  final Article? article;
  final bool dense;
  final void Function()? onTap;

  const AuthorWidget(this.article, {this.dense=false, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {

    Widget child = Material(
      color: Colors.transparent,
      child: IntrinsicWidth(
        child: Row(
          children: [

            Icon(MdiIcons.accountEdit, color: Colors.white, size: dense?16.0:Dimen.ICON_SIZE),
            SizedBox(width: dense?8.0:Dimen.ICON_MARG),
            Expanded(
                child: Text(
                  article!.author!,
                  style: AppTextStyle(
                    fontWeight: weight.bold,
                    color: Colors.white,
                    fontSize: dense?TEXT_SIZE_DENSE:TEXT_SIZE_NORM,
                    shadow: true,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
            )
          ],
        ),
      ),
    );

    return Hero(
      tag: articleAuthorHero(article!),
      child:
      onTap==null?
      child:
      SimpleButton(
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.all(Dimen.ICON_MARG),
        radius: AppCard.bigRadius,
        onTap: onTap,
        child: child,
      ),
    );
  }


}