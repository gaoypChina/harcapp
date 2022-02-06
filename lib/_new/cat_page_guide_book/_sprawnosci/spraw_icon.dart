
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';

class SprawIcon extends StatelessWidget{

  static const double sizeBig = 48.0;
  static const double sizeSmall = 34.0;

  final Spraw spraw;
  final double size;
  final void Function() onTap;

  const SprawIcon(this.spraw, {this.size, this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        spraw.iconPath,
        width: size,
        height: size,
        color: iconEnab_(context),
        placeholderBuilder: (context) => SprawIconPlaceholder(
          spraw,
          size: size,
        ),
      )
  );

}

class SprawIconPlaceholder extends StatelessWidget{

  final Spraw spraw;
  final double size;

  const SprawIconPlaceholder(this.spraw, {this.size});

  @override
  Widget build(BuildContext context) {

    String placeholderText = '';
    if(spraw.title.length > 1)
      placeholderText = spraw.title[0].toUpperCase() + spraw.title[1].toLowerCase();
    else if (spraw.title.isNotEmpty)
      placeholderText = spraw.title[0].toUpperCase();

    return LayoutBuilder(
      builder: (context, constraints){

        double spaceSize = min(size??double.infinity, constraints.maxHeight);

        return Center(
          child: Container(
            width: size,
            height: size,
            child: AspectRatio(
              aspectRatio: 1,
              child: Stack(
                children: [

                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: iconEnab_(context),
                            width: .09*spaceSize
                        ),
                        borderRadius: BorderRadius.circular(spaceSize),
                      ),
                    ),
                  ),

                  Positioned.fill(
                    child: Center(
                      child: Text(
                        placeholderText,
                        style: AppTextStyle(
                            fontSize: spaceSize*.45,
                            fontWeight: weight.bold,
                            color: iconEnab_(context)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );

  }

}