import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'indiv_comp_preview_grid.dart';
import 'indiv_comp_prompt.dart';

class IndivCompPromptLogin extends StatelessWidget{

  const IndivCompPromptLogin();

  @override
  Widget build(BuildContext context) => IndivCompPrompt(
    child: IndivCompPreviewGrid(),
    text: 'Zaloguj się, by współzawodniczyć',
    icon: MdiIcons.accountCircleOutline,
  );

}