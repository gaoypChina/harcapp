
import 'package:flutter/material.dart';

import 'indiv_comp_preview_grid.dart';
import 'indiv_comp_prompt.dart';

class IndivCompLoadingWidget extends StatelessWidget{

  final bool singleLine;
  const IndivCompLoadingWidget({this.singleLine = false, super.key});

  @override
  Widget build(BuildContext context) => IndivCompPrompt(
      child: IndivCompPreviewGrid(singleLine: singleLine),
      text: 'Ładowanie współzawodnictw...',
  );

}
