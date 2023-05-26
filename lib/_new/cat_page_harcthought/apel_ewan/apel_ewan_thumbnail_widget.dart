import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/apel_ewan.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

class ApelEwanThumbnailWidget extends StatelessWidget{

  final ApelEwan apelEwan;
  final String? subgroup;
  final void Function(ApelEwan, String?)? onTap;

  const ApelEwanThumbnailWidget(this.apelEwan, {this.subgroup, this.onTap, super.key});

  @override
  Widget build(BuildContext context) => Hero(
    tag: apelEwan,
    child: AspectRatio(
      aspectRatio: 1,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){

          double textSize = .15*constraints.maxWidth;
          double coverInitWidth = .14*constraints.maxWidth;
          double coversBorder = .05*constraints.maxWidth;
          double outerRadius = .15*constraints.maxWidth;
          double innerRadius = .15*constraints.maxWidth;
          double pagesWidth = constraints.maxWidth - 2*coversBorder;
          double pagesHeight = .1*constraints.maxWidth;

          Color textColor;
          if(apelEwan.siglum.substring(0, 2) == 'Mt')
            textColor = Colors.cyan;
          else if(apelEwan.siglum.substring(0, 2) == 'Mk')
            textColor = Colors.redAccent;
          else if(apelEwan.siglum.substring(0, 2) == 'Łk')
            textColor = Colors.amber;
          else
            textColor = Colors.yellow[100]!;

          return CustomPaint(
            size: Size(constraints.maxWidth, constraints.maxWidth),
            painter: BackCoverPainter(),
            child: Stack(
              children: [

                Positioned(
                  bottom: coversBorder,
                  left: coversBorder,
                  right: coversBorder,
                  child: CustomPaint(
                    size: Size(pagesWidth, 3*pagesHeight),
                    painter: PagesCustomPainter(),
                  ),
                ),


                Positioned.fill(
                    bottom: coversBorder + pagesHeight,
                    left: coverInitWidth,
                    right: coversBorder,
                    child: PhysicalModel(
                        borderRadius: BorderRadius.circular(outerRadius),
                        color: Colors.transparent,
                        elevation: 4.0,
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(outerRadius),
                            ),
                            color: const Color.fromARGB(255, 130, 70, 50),
                            /*
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [Colors.brown[600]!, Colors.deepOrange[600]!]
                                  ),

                                   */
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.brown,
                              onTap: () => onTap?.call(apelEwan, subgroup),
                              child: IgnorePointer(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: coversBorder,
                                      bottom: 2*coversBorder,
                                      left: coversBorder,
                                      right: coversBorder
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [

                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            apelEwan.subgroupShortTitle[subgroup]??
                                                apelEwan.subgroupTitle[subgroup]??
                                                apelEwan.subgroupShortTitle.values.firstOrNull??
                                                apelEwan.subgroupTitle.values.first,

                                            style: TextStyle(
                                              fontFamily: 'PlayfairDisplay',
                                              fontSize: .69*textSize,
                                              fontWeight: FontWeight.bold,
                                              color: textColor,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),

                                      Text(
                                        apelEwan.siglum,
                                        style: AppTextStyle(
                                          fontSize: .68*textSize,
                                          color: textColor,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                    )
                ),

              ],
            ),
          );

        },
      ),
    ),
  );

}


class BackCoverPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
      ..color = Colors.brown[700]!
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path = Path();
    path.moveTo(0, size.height*0.15);
    path.quadraticBezierTo(0, 0, size.width*0.15, 0);
    path.cubicTo(size.width*0.3375, size.height*0.025, size.width*0.675, size.height*0.075, size.width*0.85, size.height*0.1);
    path.quadraticBezierTo(size.width, size.height*0.1, size.width, size.height*0.25);
    path.lineTo(size.width,size.height*0.85);
    path.quadraticBezierTo(size.width, size.height, size.width*0.85, size.height);
    path.quadraticBezierTo(size.width*0.6625, size.height, size.width*0.1, size.height);
    path.quadraticBezierTo(0,size.height, 0, size.height*0.88);
    path.quadraticBezierTo(0, size.height*0.7125, 0, size.height*0.15);
    path.close();

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}


class PagesCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint.shader = ui.Gradient.linear(
        Offset(size.width*0.29,size.height*0.14),
        Offset(size.width*0.29,size.height*0.43),
        [Colors.orange[200]!,Colors.orange[100]!],
        [0.00,1.00]
    );



    Path path = Path();
    path.moveTo(size.width*0.055,size.height*0.6666667);
    path.quadraticBezierTo(0, size.height*0.668,0,size.height*0.8333333);
    path.quadraticBezierTo(0, size.height, size.width*0.055, size.height);
    path.quadraticBezierTo(size.width*0.6805556,size.height, size.width*0.8888889,size.height);
    path.quadraticBezierTo(size.width,size.height,size.width, size.height*0.6666667);
    path.lineTo(size.width,0);
    path.lineTo(size.width*0.7777778,size.height*0.6666667);
    path.lineTo(size.width*0.055,size.height*0.6666667);
    path.close();

    canvas.drawPath(path, paint);



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}