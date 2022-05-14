import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_cover_image_data.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CoverImage extends StatelessWidget{

  final CircleCoverImageData? coverImage;

  const CoverImage(this.coverImage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Image(
    image: (coverImage!.local?
    AssetImage('assets/images/circle/cover_images/${coverImage!.themedFileName}'):
    NetworkImage(coverImage!.themedFileName!)) as ImageProvider<Object>,
    fit: BoxFit.cover,
    errorBuilder: (context, _, __) => Material(
      child: Icon(
          coverImage!.local?
          MdiIcons.imageOffOutline:
          MdiIcons.linkOff,
          color: backgroundIcon_(context),
      ),
    ),
  );



}