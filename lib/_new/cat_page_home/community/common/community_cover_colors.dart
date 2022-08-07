import 'package:flutter/widgets.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_new/details/app_settings.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
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

class CommunityCoverColors{

  static Color? _lighten(Color? color, [double amount = .1]) {
    if(color == null) return null;

    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness(amount);

    return hslLight.toColor();
  }

  static Color? appBarColor(BuildContext context, PaletteGenerator? palette) =>
      backgroundColor(context, palette);

  static Color? backgroundColor(BuildContext context, PaletteGenerator? palette){
    if(palette == null) return background_(context);

    if(AppSettings.isDark)
      return _lighten(palette.dominantColor!.color, .1);
    else
      return _lighten(palette.dominantColor!.color, .94);

  }

  static Color? cardColor(BuildContext context, PaletteGenerator? palette){
    if(palette == null) return cardEnab_(context);

    if(AppSettings.isDark)
      return _lighten(palette.dominantColor!.color, .16);
    else
      return _lighten(palette.dominantColor!.color, .88);

  }

  static Color strongColor(BuildContext context, PaletteGenerator? palette) =>
      _lighten(palette?.dominantColor?.color, .5)??iconEnab_(context);

  static Color coverIconColor(BuildContext context, PaletteGenerator? palette){
    PaletteColor? color = palette?.dominantColor;
    if(color == null) return iconEnab_(context);
    return color.color.computeLuminance() > .5? DefColorPack.ICON_ENABLED:ColorPackBlack.ICON_ENABLED;
  }

}