import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DurationDateWidget extends StatelessWidget{

  final DateTime startDate;
  final DateTime? endDate;
  final Color color;

  const DurationDateWidget({
    required this.startDate,
    required this.endDate,
    required this.color,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    int span = (endDate??DateTime(2966)).millisecondsSinceEpoch - startDate.millisecondsSinceEpoch;
    int today = DateTime.now().millisecondsSinceEpoch - startDate.millisecondsSinceEpoch;

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
                    nextColored == colored?MdiIcons.circleMedium:MdiIcons.clockTimeEight,
                    color: colored?color:iconDisab_(context)
                ),
                onTap: (){

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

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: dots,
        );
      },
    );

  }

}
