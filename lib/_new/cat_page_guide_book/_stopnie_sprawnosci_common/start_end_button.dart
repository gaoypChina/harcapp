import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class StartStopButton extends StatelessWidget{

  static const Color COLOR_IN_PROGRESS = Colors.amber;

  static const Color COLOR_START = Colors.cyan;
  static const Color COLOR_TEXT_START = Colors.white;

  final Color color;
  final bool Function() inProgress;
  final int Function() completenessPercent;

  final void Function(bool inProgress) onPressed;

  const StartStopButton({@required this.color, @required this.inProgress, @required this.completenessPercent, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppCard(
        onTap: inProgress()?null:(){
          if(onPressed != null) onPressed(inProgress());
        },
        elevation: AppCard.bigElevation,
        radius: AppCard.BIG_RADIUS,
        padding: EdgeInsets.only(left: Dimen.ICON_MARG, right: Dimen.ICON_MARG),
        margin: EdgeInsets.only(
          right: AppCard.NORM_MARGIN_VAL,
          left: AppCard.NORM_MARGIN_VAL,
          bottom: AppCard.NORM_MARGIN_VAL
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            if(inProgress())
              SizedBox(
                width: 53,
                child: IconButton(
                  icon: Icon(MdiIcons.close, color: color),
                  onPressed: (){
                    if(onPressed != null) onPressed(inProgress());
                  },
                ),
              ),

            Expanded(
              child: Text(
                inProgress()?
                'W trakcie zdobywania':
                'Rozpocznij zdobywanie',
                style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_APPBAR,
                    fontWeight: weight.bold,
                    color: color
                ),
                textAlign: TextAlign.center,
              ),
            ),

            if(inProgress())
              SizedBox(
                width: 53,
                child: Text(
                  '${completenessPercent()}%',
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_APPBAR,
                      fontWeight: weight.halfBold,
                      color: color
                  ),
                ),
              )
          ],
        )
    );
  }

}