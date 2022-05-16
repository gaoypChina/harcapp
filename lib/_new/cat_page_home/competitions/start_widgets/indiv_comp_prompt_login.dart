import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'indiv_comp_preview_grid.dart';
import 'indiv_comp_prompt.dart';

class IndivCompPromptLogin extends StatelessWidget{

  final bool? singleLine;
  const IndivCompPromptLogin({this.singleLine, super.key});

  @override
  Widget build(BuildContext context) => IndivCompPrompt(
    child: IndivCompPreviewGrid(singleLine: singleLine),
    text: 'Zaloguj się, by współzawodniczyć',
    icon: MdiIcons.accountCircleOutline,
  );

}