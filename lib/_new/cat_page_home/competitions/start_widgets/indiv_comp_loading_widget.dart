import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'indiv_comp_preview_grid.dart';

class IndivCompLoadingWidget extends StatelessWidget{

  final double width;
  const IndivCompLoadingWidget({required this.width, super.key});

  @override
  Widget build(BuildContext context) => IndivCompPreviewGrid.from(
    width: width,
    context: context,
    icon: MdiIcons.refresh,
    text: 'Ładowanie\nwspółzawodnictw',
  );

}
