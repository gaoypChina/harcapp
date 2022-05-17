import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/apel_ewan.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';

import 'apel_ewan_widget.dart';

class ApelEwanThumbnailWidget extends StatelessWidget{

  final ApelEwan apelEwan;

  const ApelEwanThumbnailWidget(this.apelEwan, {super.key});

  @override
  Widget build(BuildContext context) => Hero(
    tag: apelEwan,
    child: AspectRatio(
          aspectRatio: 1,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){

              double textSize = .15*constraints.maxWidth;
              double coverInitWidth = .25*constraints.maxWidth;
              double coversBorder = .05*constraints.maxWidth;
              double outerRadius = .15*constraints.maxWidth;
              double innerRadius = .12*constraints.maxWidth;

              Color textColor;
              if(apelEwan.siglum.substring(0, 2) == 'Mt')
                textColor = Colors.cyan;
              else if(apelEwan.siglum.substring(0, 2) == 'Mk')
                textColor = Colors.redAccent;
              else if(apelEwan.siglum.substring(0, 2) == 'Łk')
                textColor = Colors.amber;
              else
                textColor = Colors.white;

              return Material(
                  borderRadius: BorderRadius.circular(outerRadius),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [

                      Positioned.fill(
                          top: coversBorder,
                          child: Material(
                            color: Colors.brown[700],
                            borderRadius: BorderRadius.circular(outerRadius),
                          )
                      ),

                      Positioned.fill(
                        bottom: coversBorder,
                        right: coversBorder,
                        child: GradientWidget(
                          colorStart: Colors.brown[600]!,
                          colorEnd: Colors.deepOrange[600]!,
                          elevation: AppCard.bigElevation,
                          borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
                        ),
                      ),

                      Positioned.fill(
                          bottom: coversBorder,
                          right: coversBorder,
                          child: SimpleButton(
                              radius: AppCard.BIG_RADIUS,
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              onTap: () => pushPage(context, builder: (context) => ApelEwanWidget(apelEwan)),
                              child: Container()
                          )
                      ),

                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        width: coverInitWidth,
                        child: Material(
                          elevation: AppCard.bigElevation,
                          color: Colors.brown[700],
                        ),
                      ),

                      Positioned(
                        bottom: coversBorder,
                        left: coversBorder,
                        right: coversBorder,
                        height: .18*constraints.maxWidth,
                        child: GradientWidget(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(innerRadius),
                            bottomRight: Radius.circular(innerRadius),
                            bottomLeft: Radius.circular(innerRadius),
                          ),
                          colorStart: Colors.orange[100]!,
                          colorEnd: Colors.yellow[100]!,
                        ),
                      ),

                      Positioned.fill(
                        left: coverInitWidth,
                        right: coversBorder,
                        bottom: coverInitWidth - coversBorder,
                        child: Padding(
                          padding: EdgeInsets.all(coversBorder),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [

                                SizedBox(height: coversBorder),

                                Text(
                                  apelEwan.siglum.split(', ')[0],
                                  style: AppTextStyle(
                                      fontSize: textSize,
                                      fontWeight: weight.bold,
                                      color: textColor,
                                      shadow: true
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                Text(
                                  apelEwan.siglum.split(', ')[1],
                                  style: AppTextStyle(
                                      fontSize: .8*textSize,
                                      fontWeight: weight.normal,
                                      color: textColor,
                                      shadow: true
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                SizedBox(height: coversBorder),

                                Expanded(
                                  child: Center(
                                    child: Text(
                                      apelEwan.title,
                                      style: AppTextStyle(
                                          fontSize: .7*textSize,
                                          fontWeight: weight.halfBold,
                                          color: textColor,
                                          shadow: true
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )

                              ]
                          ),
                        ),
                      )

                    ],
                  )
              );

            },
      ),
    ),
  );

}