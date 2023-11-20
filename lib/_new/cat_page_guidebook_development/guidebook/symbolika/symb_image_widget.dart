import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';

import 'data.dart';

class SymbImageWidget extends StatelessWidget{

  final ItemData data;
  final bool dense;
  final void Function()? onTap;

  const SymbImageWidget(this.data, {this.dense=false, this.onTap, super.key});

  @override
  Widget build(BuildContext context) => AspectRatio(
    aspectRatio: 1,
    child: SimpleButton(
        onTap: onTap,
        color: data.colorStart,
        radius: AppCard.bigRadius,
        elevation: AppCard.bigElevation,
        margin: EdgeInsets.zero,
        child: Stack(
          children: <Widget>[
            if(data.sharpBackgroundEdge)
              Row(
                children: <Widget>[
                  Expanded(child: Container()),
                  Expanded(child: Container(color: data.colorEnd))
                ],
              )
            else
              GradientWidget(colorStart: data.colorStart!, colorEnd: data.colorEnd!),

            Padding(
              padding: EdgeInsets.all(data.padding?(dense?10:20):0),
              child: data.childBuilder!=null?data.childBuilder!(context):Center(
                  child: SvgPicture.asset('$ASSETS_PATH${data.fileName}', fit: BoxFit.contain)
              ),
            )

          ],
        )
    ),
  );
  

}