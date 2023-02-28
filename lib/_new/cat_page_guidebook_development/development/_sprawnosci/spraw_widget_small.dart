import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_common_classes/org/org_indicator.dart';
import 'package:harcapp/_common_classes/org/org_switcher.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_book.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/spraw_icon.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/widgets/open_spraw_dialog.dart';
import 'package:harcapp/_new/details/app_settings.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import 'widgets/common.dart';

class SprawWidgetSmall extends StatelessWidget{

  static const double height = 140.0 - 12.0;
  static const double width = 130.0 - 12.0;

  static const String MODE_SAVED = 'MODE_SAVED';
  static const String MODE_IN_PROGRESS = 'MODE_IN_PROGRESS';
  static const String MODE_COMPLETE = 'MODE_COMPLETE';

  static const double marginVal = 8.0;

  final Spraw spraw;
  final String mode;
  final bool showProgress;
  final bool clickable;
  final double elevation;
  final Color? backgroundColor;
  final void Function()? onReqComplChanged;
  final void Function()? onLongPress;

  const SprawWidgetSmall(
      this.spraw,
      this.mode,
      { this.showProgress = true,
        this.clickable = true,
        this.elevation = AppCard.bigElevation,
        this.backgroundColor,
        this.onReqComplChanged,
        this.onLongPress,
        super.key
      });

  String get heroTag => '$mode#${spraw.uniqName}';

  @override
  Widget build(BuildContext context) => SizedBox(
    width: width,
    height: height,
    child: Hero(
      tag: heroTag,
      child: SimpleButton(
          color: backgroundColor??cardEnab_(context),
          onLongPress: onLongPress,
          onTap: clickable?() => openSprawDialog(
              context,
              spraw,
              heroTag: heroTag,
              onReqComplChanged: onReqComplChanged
          ):null,
          radius: AppCard.bigRadius,
          elevation: elevation,
          padding: EdgeInsets.zero,
          child: Stack(
            children: [

              Positioned(
                bottom: -40,
                left: -40,
                child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(45 / 360),
                    child: Container(
                        width: 80,
                        height: 80,
                        color: SprawBookData.mapIdColorMap[spraw.sprawBook.id]!.end(AppSettings.isDark),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            height: 28,
                            child: Center(
                              child: OrgAdvancedIndicator(
                                spraw.sprawBook.org,
                                fontColor: SprawBookData.mapIdColorMap[spraw.sprawBook.id]!.start(AppSettings.isDark),
                                dense: true,
                                topSpace: false,
                              ),
                            )
                          )
                        )
                    )
                ),
              ),

              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(Dimen.ICON_MARG),
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

                      const SizedBox(height: Dimen.ICON_MARG),

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