import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CompletedWidget extends StatelessWidget{

  final String text;
  final Color colorText;
  final Color color;
  final void Function() onPressed;

  const CompletedWidget(this.text, this.color, {this.colorText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppCard(
        onTap: onPressed,
        elevation: AppCard.bigElevation,
        color: color,
        padding: EdgeInsets.all(Dimen.ICON_MARG),
        margin: EdgeInsets.only(left: AppCard.NORM_MARGIN_VAL, right: AppCard.NORM_MARGIN_VAL, bottom: AppCard.NORM_MARGIN_VAL),
        radius: AppCard.BIG_RADIUS,
        child: Stack(
          children: [

            SizedBox(
              height: Dimen.ICON_FOOTPRINT,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Opacity(
                    opacity: .5,
                    child: Icon(
                      MdiIcons.trophy,
                      color: colorText??Colors.white,
                      size: 28.0,
                    ),
                  ),

                  Text(
                    text,
                    style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_APPBAR,
                      fontWeight: weight.bold,
                      color: colorText??Colors.white,//accentIcon_(context),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Opacity(
                    opacity: .5,
                    child: Icon(
                      MdiIcons.trophy,
                      color: colorText??Colors.white,
                      size: 28.0,
                    ),
                  ),

                ],
              ),
            ),

          ],
        )
    );
  }

}