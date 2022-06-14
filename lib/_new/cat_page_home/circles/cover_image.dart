import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_cover_image_data.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CoverImage extends StatelessWidget{

  final CircleCoverImageData coverImage;

  const CoverImage(this.coverImage, {super.key});

  ImageProvider getImageProvider(){

    if(coverImage.local)
      return AssetImage('assets/images/circle/cover_images/${coverImage.themedFileName}');

    String url = coverImage.themedFileName!;

    return NetworkImage(url, headers:{"Keep-Alive": "timeout=5"});

  }

  @override
  Widget build(BuildContext context) => Image(
    image: getImageProvider(),

    fit: BoxFit.cover,

    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? imageChunkEvent) =>
    imageChunkEvent?.expectedTotalBytes == imageChunkEvent?.cumulativeBytesLoaded?
    child:
    NoImagePlaceholder(loading: true, local: coverImage.local),

    errorBuilder: (BuildContext context, Object object, StackTrace? stackTrace){
      return NoImagePlaceholder(loading: false, local: coverImage.local);
    }
  );

}

class NoImagePlaceholder extends StatelessWidget{

  final bool loading;
  final bool local;

  const NoImagePlaceholder({required this.loading, required this.local, super.key});

  @override
  Widget build(BuildContext context) => AspectRatio(
    aspectRatio: 3/2,
    child: Material(
      child: Icon(
        loading?
        MdiIcons.dotsHorizontal:
        local?
        MdiIcons.imageOffOutline:
        MdiIcons.linkOff,
        size: 72,
        color: backgroundIcon_(context),
      ),
    )
  );



}
