import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';

class ImageCard extends StatelessWidget{

  final ImageProvider image;
  final ValueNotifier? pageViewNotifier;
  final int? index;
  final void Function()? onLike;
  final void Function()? onLongPress;
  final void Function()? onTap;

  const ImageCard(
      this.image,
      { this.pageViewNotifier,
        this.index,
        this.onLike,
        this.onLongPress,
        this.onTap,
        Key? key
      }) : super(key: key);

  ValueNotifier get _pageViewNotifier => pageViewNotifier??ValueNotifier(0);
  int get _index => index??0;

  @override
  Widget build(BuildContext context) => Material(
      color: Colors.transparent,
      elevation: AppCard.bigElevation,
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(AppCard.bigRadius),
      child:
      image == null?
      AspectRatio(
        aspectRatio: 1,
        child: Container(),
      ):
      GestureDetector(
        onTap: onTap,
        onDoubleTap: onLike,
        onLongPress: onLongPress,
        child: AnimatedBuilder(
          animation: _pageViewNotifier,
          child: Image(image: image),
          builder: (BuildContext context, Widget? child) => Transform.scale(
            scale: 1 + sin(_pageViewNotifier.value - _index).abs()*0.4,
            child: Image(image: image)
          )
        )
      )
  );

}