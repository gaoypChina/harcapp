import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/apel_ewan.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/sparkling_tiles_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import 'apel_ewan_widget.dart';

class ApelEwanThumbnailWidget extends StatelessWidget{

  final ApelEwan apelEwan;

  const ApelEwanThumbnailWidget(this.apelEwan, {Key key}): super(key: key);

  @override
  Widget build(BuildContext context) => Hero(
    tag: apelEwan,
    child: SimpleButton(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      onTap: () => pushPage(context, builder: (context) => ApelEwanWidget(apelEwan)),
      radius: AppCard.BIG_RADIUS,
      child: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [

              Positioned.fill(
                child: SparklingTilesWidget(
                  colors: [
                    Colors.grey[100],//Colors.yellow,
                    Colors.grey[200],//Colors.yellow[600],
                    Colors.grey[300],//Colors.amber,
                  ],
                  count: 4 + apelEwan.hashCode%6,
                ),
              ),

              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Text(
                      apelEwan.siglum.split(', ')[0],
                      style: AppTextStyle(
                          fontSize: Dimen.TEXT_SIZE_APPBAR,
                          fontWeight: weight.bold,
                          color: Colors.black
                      ),
                      textAlign: TextAlign.center,
                    ),

                    Text(
                      apelEwan.siglum.split(', ')[1],
                      style: AppTextStyle(
                          fontSize: Dimen.TEXT_SIZE_APPBAR,
                          fontWeight: weight.normal,
                          color: Colors.black
                      ),
                      textAlign: TextAlign.center,
                    ),

                  ]
              ),

            ],
          )
      ),
    ),
  );

}