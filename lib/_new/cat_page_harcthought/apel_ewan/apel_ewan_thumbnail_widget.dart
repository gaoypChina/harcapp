import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/apel_ewan.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:webfeed/util/iterable.dart';

import 'apel_ewan_widget.dart';

class ApelEwanThumbnailWidget extends StatelessWidget{

  final ApelEwan apelEwan;
  final String? subgroup;

  const ApelEwanThumbnailWidget(this.apelEwan, {this.subgroup, super.key});

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
              double outerRadius = .12*constraints.maxWidth;
              double innerRadius = .15*constraints.maxWidth;
              double pagesHeight = .12*constraints.maxWidth;

              Color textColor;
              if(apelEwan.siglum.substring(0, 2) == 'Mt')
                textColor = Colors.cyan;
              else if(apelEwan.siglum.substring(0, 2) == 'Mk')
                textColor = Colors.redAccent;
              else if(apelEwan.siglum.substring(0, 2) == 'Łk')
                textColor = Colors.amber;
              else
                textColor = Colors.white;

              return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(outerRadius),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [

                      Positioned.fill(
                          top: coversBorder,
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: Colors.brown[700],
                              borderRadius: BorderRadius.circular(outerRadius),
                            ),
                          )
                      ),

                      // Pages
                      Positioned(
                        bottom: coversBorder,
                        left: coversBorder,
                        right: 2*coversBorder,
                        height: pagesHeight,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(innerRadius),
                              bottomRight: Radius.circular(outerRadius),
                              bottomLeft: Radius.circular(innerRadius),
                            ),
                            color: Colors.orange[100],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: coversBorder,
                        right: coversBorder,
                        height: 2*pagesHeight,
                        width: 2*pagesHeight,
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color: Colors.orange[100],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(innerRadius),
                              bottomRight: Radius.circular(outerRadius),
                              bottomLeft: Radius.circular(innerRadius),
                            ),
                          ),
                        )
                      ),

                      Positioned.fill(
                          bottom: coversBorder + pagesHeight,
                          right: coversBorder,
                          left: coversBorder,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [

                              Positioned.fill(
                                child: PhysicalModel(
                                  color: Colors.orange[100]!,
                                  borderRadius: BorderRadius.circular(outerRadius),
                                  elevation: 6,
                                ),
                              ),

                              GradientWidget(
                                colorStart: Colors.brown[600]!,
                                colorEnd: Colors.deepOrange[600]!,
                                elevation: AppCard.bigElevation,
                                borderRadius: BorderRadius.circular(outerRadius),
                                child: InkWell(
                                    splashColor: Colors.brown,
                                    onTap: () => pushPage(context, builder: (context) => ApelEwanWidget(
                                        apelEwan,
                                        initSubgroup: subgroup
                                    )),
                                )
                              ),

                            ],
                          )
                      ),

                      Positioned(
                        top: 0,
                        bottom: coversBorder + pagesHeight,
                        left: 0,
                        width: coverInitWidth,
                        child: Material(
                            color: Colors.brown[700],
                            child: RotatedBox(
                                quarterTurns: 3,
                                child: Center(
                                  child: Text(
                                    apelEwan.siglum,
                                    style: AppTextStyle(
                                      fontSize: .7*textSize,
                                      color: textColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                            )
                        ),
                      ),

                      Positioned.fill(
                          left: coverInitWidth,
                          right: coversBorder,
                          bottom: coverInitWidth - coversBorder,
                          child: IgnorePointer(
                            child: Padding(
                              padding: EdgeInsets.all(coversBorder),
                              child: Center(
                                child: Text(
                                  apelEwan.subgroupShortTitle[subgroup]??
                                      apelEwan.subgroupTitle[subgroup]??
                                      apelEwan.subgroupShortTitle.values.firstOrNull??
                                      apelEwan.subgroupTitle.values.first,

                                  style: AppTextStyle(
                                      fontSize: .7*textSize,
                                      fontWeight: weight.bold,
                                      color: textColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                      )

                    ],
                  )
              );

            },
      ),
    ),
  );

}