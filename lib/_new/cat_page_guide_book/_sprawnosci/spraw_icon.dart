
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';

class SprawIcon extends StatefulWidget{

  static const double sizeBig = 48.0;
  static const double sizeSmall = 34.0;

  final Spraw? spraw;
  final double? size;
  final void Function()? onTap;

  const SprawIcon(this.spraw, {this.size, this.onTap, super.key});

  @override
  State<StatefulWidget> createState() => SprawIconState();
  
}

class SprawIconState extends State<SprawIcon>{

  Spraw? get spraw => widget.spraw;
  double? get size => widget.size;
  void Function()? get onTap => widget.onTap;

  late bool assetExists;

  void checkAssetExistance() async {
    try {
      await rootBundle.loadString(widget.spraw!.iconPath);
      setState(() => assetExists = true);
    } catch(_) {
      setState(() => assetExists = false);
    }
  }
  
  @override
  void initState() {
    assetExists = false;
    checkAssetExistance();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: widget.onTap,
      child: assetExists?SvgPicture.asset(
        spraw!.iconPath,
        width: size,
        height: size,
        color: iconEnab_(context),
        placeholderBuilder: (context) => SprawIconPlaceholder(
          spraw,
          size: size,
        ),
      ):SprawIconPlaceholder(
        spraw,
        size: size,
      ),
  );
  
}

class SprawIconPlaceholder extends StatelessWidget{

  final Spraw? spraw;
  final double? size;

  const SprawIconPlaceholder(this.spraw, {this.size, super.key});

  @override
  Widget build(BuildContext context) {

    String placeholderText = '';
    if(spraw!.title.length > 1)
      placeholderText = spraw!.title[0].toUpperCase() + spraw!.title[1].toLowerCase();
    else if (spraw!.title.isNotEmpty)
      placeholderText = spraw!.title[0].toUpperCase();

    return LayoutBuilder(
      builder: (context, constraints){

        double spaceSize = min(size??double.infinity, constraints.maxHeight);

        return Center(
          child: SizedBox(
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
                            width: .098*spaceSize,
                            style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(spaceSize),
                      ),
                    ),
                  ),

                  Positioned.fill(
                    child: Center(
                      child: Text(
                        placeholderText,
                        style: TextStyle(
                            fontFamily: 'Amarante',
                            fontSize: spaceSize*.45,
                            fontWeight: FontWeight.bold,
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