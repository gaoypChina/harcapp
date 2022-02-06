import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_folder_page/spraw_folder.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_folder_page/spraw_folder_icon.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';

class SprawFolderWidget extends StatelessWidget{

  static const double defSize = 46.0;

  final String iconKey;
  final String colorKey;
  final double size;

  const SprawFolderWidget(this.iconKey, this.colorKey, {this.size = defSize});

  static SprawFolderWidget from(SprawFolder folder, {double size = defSize}){
    return SprawFolderWidget(folder.iconKey, folder.colorKey, size: size);
  }

  static SprawFolderWidget empty({double size = defSize}){
    return SprawFolderWidget(null, null, size: size);
  }

  @override
  Widget build(BuildContext context) {

    Color color = cardEnab_(context);
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
                  child: iconKey == null || colorKey == null?Container():SprawFolderIcon(iconKey, colorKey, size: size/2),
                ),
              ),
            ),
          ],
        )
    );

  }

}