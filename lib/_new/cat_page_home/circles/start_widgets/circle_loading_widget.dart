
import 'package:flutter/material.dart';

import 'circle_preview_grid.dart';
import 'circle_prompt.dart';

class CircleLoadingWidget extends StatelessWidget{

  final bool singleLine;
  const CircleLoadingWidget({this.singleLine = false, super.key});

  @override
  Widget build(BuildContext context) => CirclePrompt(
      child: CirclePreviewGrid(singleLine: singleLine),
      text: 'Ładowanie kręgów...',
  );

}
