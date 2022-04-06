
import 'package:flutter/material.dart';

import 'indiv_comp_preview_grid.dart';
import 'indiv_comp_prompt.dart';

class IndivCompLoadingWidget extends StatelessWidget{

  const IndivCompLoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const IndivCompPrompt(
      child: IndivCompPreviewGrid(),
      text: 'Ładowanie współzawodnictw...',
  );

}
