
import 'package:flutter/material.dart';

import 'communities_preview_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CommunitiesLoadingWidget extends StatelessWidget{

  final double width;
  final EdgeInsets padding;
  const CommunitiesLoadingWidget({required this.width, this.padding = EdgeInsets.zero, super.key});

  @override
  Widget build(BuildContext context) => CommunitiesPreviewWidget.from(
    context: context,
    width: width,
    padding: padding,
    icon: MdiIcons.refresh,
    text: 'Ładowanie środowisk...',
  );

}
