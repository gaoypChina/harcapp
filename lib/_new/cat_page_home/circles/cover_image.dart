import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_cover_image_data.dart';

class CoverImage extends StatelessWidget{

  final CircleCoverImageData coverImage;

  const CoverImage(this.coverImage, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Image(
    image: coverImage.local?
    AssetImage('assets/images/circle/cover_images/${coverImage.themedFileName}'):
    NetworkImage(coverImage.themedFileName),
    fit: BoxFit.cover,
  );



}