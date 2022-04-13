import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}