import 'package:flutter/material.dart';
import 'package:harcapp/_new/details/part_contributors.dart';

class ShortRead{

  final String title;
  final Color Function(BuildContext) titleColor;
  final String fileName;
  final GraphicalResource graphicalResource;
  final dynamic soundResource;

  const ShortRead({
    @required this.title,
    @required this.titleColor,
    @required this.fileName,
    @required this.graphicalResource,
    this.soundResource});

}