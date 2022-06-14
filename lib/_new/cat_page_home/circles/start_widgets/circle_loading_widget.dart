
import 'package:flutter/material.dart';

import 'circle_preview_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CircleLoadingWidget extends StatelessWidget{

  final double width;
  final EdgeInsets padding;
  const CircleLoadingWidget({required this.width, this.padding = EdgeInsets.zero, super.key});

  @override
  Widget build(BuildContext context) => CirclePreviewWidget.from(
    context: context,
    width: width,
    padding: padding,
    icon: MdiIcons.refresh,
    text: 'Ładowanie kręgów...',
  );

}
