import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

class CreateNewButton extends StatelessWidget{

  final IconData icon;
  final String title;
  final String description;
  final Widget? bottom;
  final void Function()? onTap;

  const CreateNewButton({required this.icon, required this.title, required this.description, this.bottom, this.onTap, super.key});


  @override
  Widget build(BuildContext context) => SimpleButton(
      radius: AppCard.BIG_RADIUS,
      color: background_(context),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [

            Row(
              children: [
                Icon(icon),
                const SizedBox(width: Dimen.SIDE_MARG),
                Text(
                  title,
                  style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_APPBAR,
                    fontWeight: weight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                  description,
                  style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_BIG,
                  )),
            ),

            if(bottom != null)
              bottom!,

          ],
        ),
      )
  );


}