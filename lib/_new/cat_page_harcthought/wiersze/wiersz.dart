import 'package:flutter/material.dart';
import 'package:harcapp/_new/details/part_contributors.dart';

import '../common/short_read.dart';

class Wiersz extends ShortRead{

  final String author;

  const Wiersz({
    required String title,
    required this.author,
    required Color Function(BuildContext) titleColor,
    required String fileName,
    required GraphicalResource graphicalResource,
    dynamic soundResource
  }):super(
      title: title,
      titleColor: titleColor,
      fileName: fileName,
      graphicalResource: graphicalResource,
      soundResource: soundResource,
  );

}