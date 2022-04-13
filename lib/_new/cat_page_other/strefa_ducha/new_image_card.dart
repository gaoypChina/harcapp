import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

enum LoadingState{
  loading,
  success,
  failed,
}

class ImageCard extends StatefulWidget{

  final LoadingState state;

  const ImageCard(this.state, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ImageCardState();

}

class ImageCardState extends State<ImageCard>{

  Image image;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
        color: cardEnab_(context),
        borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS)
    ),
    child: Container(),
  );

}