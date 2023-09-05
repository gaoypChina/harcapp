import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DurationDateWidget extends StatelessWidget{

  final DateTime startDate;
  final DateTime? endDate;
  final CommonColorData colors;

  const DurationDateWidget({
    required this.startDate,
    required this.endDate,
    required this.colors,
    super.key
  });

  String? get timeLeft{
    String? message;
    if(endDate != null){
      int daysLeft = Duration(
          milliseconds: endDate!.millisecondsSinceEpoch -
              DateTime.now().millisecondsSinceEpoch).inDays;
      if (daysLeft < 0) daysLeft = 0;
      int weeksLeft = daysLeft ~/ 7;

      if (weeksLeft > 0)
        message = '$weeksLeft tyg.';
      else
        message = '$daysLeft dni';
    }
    return message;
  }

  @override
  Widget build(BuildContext context) {

    int span = (endDate??DateTime(2966)).millisecondsSinceEpoch - startDate.millisecondsSinceEpoch;
    int today = DateTime.now().millisecondsSinceEpoch - startDate.millisecondsSinceEpoch;

    String? message = timeLeft;

    return GestureDetector(
      child: Row(
        children: [

          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints){

                double width = constraints.maxWidth - Dimen.ICON_SIZE;
                double progress = today/span;
                double remainingWidth = width*(max(0, min(1 - progress, 1)));

                return Stack(
                  alignment: Alignment.centerLeft,
                  children: [

                    const SizedBox(height: Dimen.ICON_SIZE),

                    GradientWidget(
                        colorStart: colors.colorStart,
                        colorEnd: colors.colorEnd,
                        radius: AppCard.bigRadius,
                        clipBehavior: Clip.hardEdge,
                        child: Container(height: 10)
                    ),

                    Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 24.0,
                          color: background_(context),
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.horizontal(right: Radius.circular(AppCard.bigRadius)),
                                color: cardEnab_(context),
                              ),
                              width: remainingWidth - Dimen.ICON_SIZE,
                              height: 10.0,
                            ),
                          )
                        )
                    ),

                  ],
                );

              },
            ),
          ),

          const SizedBox(width: Dimen.ICON_MARG),

          Icon(MdiIcons.calendarEndOutline, color: iconDisab_(context)),

          Text(
            ' $message',
            style: AppTextStyle(
                fontWeight: weight.halfBold,
                fontSize: Dimen.TEXT_SIZE_BIG,
                color: iconDisab_(context)
            ),
          ),

        ],
      ),
      onTap: (){

        String? spanText = endDate == null?
        null:
        dateRangeToString(startDate, endDate!, shortMonth: true);

        showAppToast(
            context,
            text: spanText == null?
            (message==null?'Brak czasu zakończenia':'Pozostało $message'):
            (message==null?'$spanText\n\nBrak czasu zakończenia':'$spanText\n\nPozostało $message'),
            duration: spanText == null ? const Duration(seconds: 3) : const Duration(seconds: 5)
        );
      },
    );

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){

        double width = constraints.maxWidth - Dimen.ICON_SIZE;
        double progress = today/span;
        double coloredDots = width*(max(0, min(progress, 1)));

        List<Widget> dots = [];
        for(int i = 0; i<width/Dimen.ICON_SIZE; i++){
          bool colored = coloredDots/Dimen.ICON_SIZE > i;
          bool nextColored = coloredDots/Dimen.ICON_SIZE > i + 1;
          dots.add(
              GestureDetector(
                child: Icon(
                    nextColored == colored?MdiIcons.circleMedium:MdiIcons.timerSand,
                    color: colored?colors.avgColor:iconDisab_(context)
                ),
                onTap: (){

                  String? spanText = endDate == null?
                  null:
                  dateRangeToString(startDate, endDate!, shortMonth: true);

                  showAppToast(
                    context,
                    text: spanText == null?
                    (message==null?'Brak czasu zakończenia':'Pozostało $message'):
                    (message==null?'$spanText\n\nBrak czasu zakończenia':'$spanText\n\nPozostało $message'),
                    duration: spanText == null ? const Duration(seconds: 3) : const Duration(seconds: 5)
                  );
                },
              )
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: dots,
            ),

            const SizedBox(height: Dimen.defMarg),

          ],
        );
      },
    );

  }

}
