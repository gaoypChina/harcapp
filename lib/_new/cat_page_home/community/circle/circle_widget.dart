import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../community_group_widget_template.dart';
import 'model/circle.dart';

class CircleWidget extends StatelessWidget{

  static const double height = 180;

  final Circle circle;
  final void Function()? onTap;
  const CircleWidget(this.circle, {this.onTap, super.key});


  @override
  Widget build(BuildContext context) => Consumer<CircleProvider>(
      builder: (context, prov, child) => CommunityGroupWidgetTemplate(
        circle.coverImage,
        text: 'Krąg',
        icon: Circle.icon,
        onTap: onTap,
        titleBottom: circle.awaitingCount == 0?
        null:
        Row(
          children: [
            const SizedBox(width: Dimen.ICON_MARG),
            Icon(MdiIcons.clockAlertOutline, color: Colors.red),
            const SizedBox(width: Dimen.ICON_MARG),
            Text(
              '${circle.awaitingCount}',
              style: AppTextStyle(
                  fontSize: Dimen.TEXT_SIZE_BIG,
                  color: Colors.red,
                  fontWeight: weight.halfBold
              )
            ),
          ],
        ),
      )
  );

}