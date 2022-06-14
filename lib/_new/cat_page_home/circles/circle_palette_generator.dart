import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

Future<PaletteGenerator?> getPaletteGenerator(bool local, String? imgUrlOrFileName) async {

  if(imgUrlOrFileName == null)
    return null;

  return await PaletteGenerator.fromImageProvider(
    (local?
    AssetImage('assets/images/circle/cover_images/$imgUrlOrFileName'):
    NetworkImage(imgUrlOrFileName, headers:{"Keep-Alive": "timeout=5"})) as ImageProvider<Object>,
  );

}