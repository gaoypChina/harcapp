import 'package:flutter/material.dart';
import 'package:harcapp/_new/details/part_contributors.dart';

import '../common/short_read.dart';

class Gaweda extends ShortRead{

  const Gaweda({
    @required String title,
    @required Color Function(BuildContext) titleColor,
    @required String fileName,
    @required GraphicalResource graphicalResource,
    dynamic soundResource}):super(
      title: title,
      titleColor: titleColor,
      fileName: fileName,
      graphicalResource: graphicalResource,
      soundResource: soundResource,
  );

}