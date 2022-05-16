import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'circle_preview_grid.dart';
import 'circle_prompt.dart';

class CirclePromptLogin extends StatelessWidget{

  final bool? singleLine;
  const CirclePromptLogin({this.singleLine, super.key});

  @override
  Widget build(BuildContext context) => CirclePrompt(
    child: CirclePreviewGrid(singleLine: singleLine),
    text: 'Zaloguj się, by zawiązać krąg',
    icon: MdiIcons.accountCircleOutline,
  );

}