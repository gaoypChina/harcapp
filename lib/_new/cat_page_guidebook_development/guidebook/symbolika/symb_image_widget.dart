import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';

import 'data.dart';

class SymbImageWidget extends StatelessWidget{

  final ItemData data;
  final bool dense;
  final void Function()? onItemTap;

  const SymbImageWidget(this.data, {this.dense=false, this.onItemTap});

  @override
  Widget build(BuildContext context) {

    Widget image = SvgPicture.asset('$ASSETS_PATH${data.fileName}', fit: BoxFit.contain);

    return AspectRatio(
      aspectRatio: 1,
      child: AppCard(
        onTap: onItemTap,
          color: data.colorStart,
          radius: AppCard.bigRadius,
          elevation: AppCard.bigElevation,
          padding: EdgeInsets.zero,
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
                child: data.childBuilder!=null?data.childBuilder!(context):Center(child: image),
              )

            ],
          )
      ),
    );
  }



}