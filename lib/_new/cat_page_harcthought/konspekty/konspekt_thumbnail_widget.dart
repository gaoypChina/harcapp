import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_new/cat_page_harcthought/konspekty/konspekt.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import 'konspekt_widget.dart';

class KonspektThumbnailWidget extends StatelessWidget{

  final Konspekt konspekt;

  const KonspektThumbnailWidget(this.konspekt, {super.key});

  @override
  Widget build(BuildContext context) => AspectRatio(
      aspectRatio: 2,
      child: Hero(
          tag: konspekt,
          child: SimpleButton(
            onTap: () => pushPage(context, builder: (context) => KonspektWidget(konspekt)),
            color: Colors.amber[100],
            borderRadius: BorderRadius.circular(AppCard.bigRadius),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                      padding: const EdgeInsets.all(Dimen.ICON_MARG),
                      child: Center(
                        child: AutoSizeText(
                          konspekt.title.replaceAll(' ', '\n'),
                          style: AppTextStyle(
                            fontSize: Dimen.TEXT_SIZE_BIG,
                            fontWeight: weight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: konspekt.title.split(' ').length,
                        ),
                      )
                  ),
                ),

                Expanded(
                  child: Image.asset(
                    konspekt.coverPath,
                    fit: BoxFit.cover,
                  ),
                )

              ],
            ),
          )
      )
  );

}