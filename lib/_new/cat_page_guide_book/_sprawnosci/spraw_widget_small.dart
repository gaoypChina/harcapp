import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/auto_size_text.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_book.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_icon.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/widgets/open_spraw_dialog.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

import 'widgets/common.dart';

class SprawWidgetSmall extends StatelessWidget{

  static const double height = 140.0;
  static const double width = 130.0;

  static const String MODE_SAVED = 'MODE_SAVED';
  static const String MODE_IN_PROGRESS = 'MODE_IN_PROGRESS';
  static const String MODE_COMPLETE = 'MODE_COMPLETE';

  static const double marginVal = 8.0;

  final Spraw spraw;
  final String mode;
  final bool showProgress;
  final bool clickable;
  final EdgeInsets margin;
  final Color? backgroundColor;
  final void Function()? onReqComplChanged;
  final void Function()? onLongPress;

  const SprawWidgetSmall(this.spraw, this.mode, {this.showProgress = false, this.clickable = true, this.margin = const EdgeInsets.all(marginVal), this.backgroundColor, this.onReqComplChanged, this.onLongPress});

  String get heroTag => mode + '#' + spraw.uniqName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Hero(
        tag: heroTag,
        child: AppCard(
            color: backgroundColor??cardEnab_(context),
            onLongPress: onLongPress,
            onTap: clickable?() => openSprawDialog(
                context,
                spraw,
                heroTag: heroTag,
                onReqComplChanged: onReqComplChanged
            ):null,
            margin: margin,
            radius: AppCard.BIG_RADIUS,
            elevation: AppCard.bigElevation,
            padding: EdgeInsets.zero,
            child: Stack(
              children: [

                Positioned(
                  bottom: -40,
                  left: -40,
                  child: RotationTransition(
                      turns: AlwaysStoppedAnimation(45 / 360),
                      child: Container(
                        width: 80,
                        height: 80,
                        color: SprawBookData.mapIdColorMap[spraw.sprawBook.id]!.avgColor(false),
                      )
                  ),
                ),

                Positioned(
                  bottom: 6,
                  left: 6,
                  child: RotationTransition(
                      turns: AlwaysStoppedAnimation(15 / 360),
                      child: Icon(
                        SprawBookData.mapIdIconMap[spraw.sprawBook.id],
                        color: Colors.white24,
                      )
                  ),
                ),

                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.all(Dimen.ICON_MARG),
                    child: Column(
                      children: [

                        Row(
                          children: [
                            LevelWidget(spraw, size: 14.0),

                            Expanded(child: Container()),

                            SizedBox(
                              height: 24.0,
                              width: 24.0,
                              child: SprawIcon(spraw),
                            )

                          ],
                        ),

                        SizedBox(height: Dimen.ICON_MARG),

                        AutoSizeText(
                          spraw.title,
                          wrapWords: false,
                          minFontSize: 10.0,
                          style: AppTextStyle(
                            fontWeight: weight.halfBold,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        Expanded(child: Container()),

                        if(showProgress)
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              '${spraw.completenessPercent}%',
                              style: AppTextStyle(
                                  fontWeight: weight.halfBold,
                                  color: hintEnab_(context)
                              ),
                            ),
                          )

                      ],
                    ),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }

}