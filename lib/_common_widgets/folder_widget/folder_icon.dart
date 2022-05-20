import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_folder_page/spraw_folder.dart';

class FolderIcon extends StatelessWidget{

  static const double defSize = 36.0;

  final String iconKey;
  final String colorKey;
  final double size;

  const FolderIcon(this.iconKey, this.colorKey, {this.size = defSize, super.key});

  static FolderIcon from(SprawFolder folder, {double size = defSize}) => FolderIcon(folder.iconKey, folder.colorsKey, size: size);

  @override
  Widget build(BuildContext context) {

    CommonColorData? commonColorData = CommonColorData.ALL[colorKey];

    return ShaderMask(
        child: Icon(
          CommonIconData.ALL[iconKey],
          size: size,
          color: Colors.white,
        ),
        shaderCallback: (Rect bounds){
          final Rect rect = Rect.fromLTRB(0, 0, size, size);
          final Gradient gradient = LinearGradient(
              colors: [
                commonColorData!.colorStart!,
                commonColorData.colorEnd!
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          );
          return gradient.createShader(rect);
        }
    );

  }

}