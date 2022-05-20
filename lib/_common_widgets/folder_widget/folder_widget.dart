import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';

import 'folder_icon.dart';

class FolderWidget extends StatelessWidget{

  static const double defSize = 46.0;

  final String? iconKey;
  final String? colorKey;
  final double size;

  const FolderWidget(this.iconKey, this.colorKey, {this.size = defSize, super.key});

  static FolderWidget empty({double size = defSize}){
    return FolderWidget(null, null, size: size);
  }

  @override
  Widget build(BuildContext context){

    Color color = cardEnab_(context)!;
    Color darkColor = Color.fromARGB(255, color.red-10, color.green-10, color.blue-10);

    double radius = size>84?AppCard.BIG_RADIUS:AppCard.DEF_RADIUS;

    return SizedBox(
        width: size,
        child: Stack(
          clipBehavior: Clip.none,
          children: [

            Positioned(
              left: size/36,
              top: 0,
              bottom: 12.0,
              child: SizedBox(
                width: size/2,
                child: AppCard(
                  color: darkColor,
                  elevation: AppCard.bigElevation,
                  radius: radius,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: size/12),
              child: AspectRatio(
                aspectRatio: 3/2,
                child: AppCard(
                  color: color,
                  elevation: AppCard.bigElevation,
                  radius: radius,
                  child:
                  iconKey == null || colorKey == null?
                  Container():
                  FolderIcon(iconKey!, colorKey!, size: size/2),
                ),
              ),
            ),
          ],
        )
    );

  }

}