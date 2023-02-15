import 'package:flutter/cupertino.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

import 'meal.dart';

class PrepStepsWidget extends StatelessWidget{

  final Meal meal;

  const PrepStepsWidget(this.meal);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: meal.prepSteps.map(
        (step) => Padding(
          padding: EdgeInsets.only(top: Dimen.ICON_MARG/2, bottom: Dimen.ICON_MARG/2),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: Dimen.ICON_MARG),
                Container(
                  width: Dimen.ICON_SIZE,
                  child: Text('${meal.prepSteps.indexOf(step)+1}. ', style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG)),
                ),
                SizedBox(width: Dimen.ICON_MARG),
                Expanded(child: Text(step, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
              ]
          ),
        )
      ).toList(),
    );
  }

}