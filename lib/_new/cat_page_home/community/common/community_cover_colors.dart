import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_image_data.dart';
import 'package:harcapp/_new/details/app_settings.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:palette_generator/palette_generator.dart';

Future<PaletteGenerator?> getPaletteGenerator(CommunityCoverImageData? data, {bool darkSample = false}) async {

  if(data == null) return null;
  ImageProvider? imageProv = data.getImageProvider(darkSample: darkSample);
  if(imageProv == null) return null;

  return await PaletteGenerator.fromImageProvider(imageProv);

}

class CommunityCoverColors{

  static const colorsKeyAuto = 'auto';
  static const colorsKeyNone = 'none';


  static Color? _lighten(Color? color, [double amount = .1]) {
    if(color == null) return null;

    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness(amount);

    return hslLight.toColor();
  }

  static Color appBarColor(BuildContext context, PaletteGenerator? palette) =>
      backgroundColor(context, palette);

  static Color backgroundColor(BuildContext context, PaletteGenerator? palette){

    if(AppSettings.isDark)
      return _lighten(palette?.dominantColor!.color, .1)??background_(context);
    else
      return _lighten(palette?.dominantColor!.color, .94)??background_(context);

  }

  static Color nonPaletteCardColor(){
    if(AppSettings.isDark)
      return const Color.fromARGB(255, 50, 50, 50);
    else
      return const Color.fromARGB(255, 240, 240, 240);
  }

  static Color cardColor(BuildContext context, PaletteGenerator? palette){

    if(AppSettings.isDark)
      return _lighten(palette?.dominantColor!.color, .16)??nonPaletteCardColor();
    else
      return _lighten(palette?.dominantColor!.color, .88)??nonPaletteCardColor();

  }

  static Color strongColor(BuildContext context, PaletteGenerator? palette) =>
      _lighten(palette?.dominantColor?.color, .5)??iconEnab_(context);

  static Color coverIconColor(BuildContext context, PaletteGenerator? palette){
    PaletteColor? color = palette?.dominantColor;
    if(color == null) return iconEnab_(context);
    return color.color.computeLuminance() > .5? DefColorPack.ICON_ENABLED:ColorPackBlack.ICON_ENABLED;
  }

}