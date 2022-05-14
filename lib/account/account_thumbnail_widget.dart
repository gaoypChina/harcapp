import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tuple/tuple.dart';

import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';

class AccountThumbnailWidget extends StatelessWidget{

  static const List<Tuple2<Color, Color>> backgroundColors = [
    Tuple2(Color.fromARGB(255, 255, 204, 204), Color.fromARGB(255, 255, 153, 153)),
    Tuple2(Color.fromARGB(255, 255, 229, 204), Color.fromARGB(255, 255, 204, 153)),
    Tuple2(Color.fromARGB(255, 255, 255, 204), Color.fromARGB(255, 255, 255, 51)),
    Tuple2(Color.fromARGB(255, 229, 255, 204), Color.fromARGB(255, 204, 255, 153)),
    Tuple2(Color.fromARGB(255, 204, 255, 204), Color.fromARGB(255, 153, 255, 153)),
    Tuple2(Color.fromARGB(255, 204, 255, 229), Color.fromARGB(255, 153, 255, 204)),
    Tuple2(Color.fromARGB(255, 204, 255, 255), Color.fromARGB(255, 153, 255, 255)),
    Tuple2(Color.fromARGB(255, 204, 229, 255), Color.fromARGB(255, 153, 204, 255)),
    Tuple2(Color.fromARGB(255, 204, 204, 255), Color.fromARGB(255, 153, 153, 255)),
    Tuple2(Color.fromARGB(255, 229, 204, 255), Color.fromARGB(255, 204, 153, 255)),
    Tuple2(Color.fromARGB(255, 255, 204, 255), Color.fromARGB(255, 255, 153, 255)),
  ];

  static const double defSize = 50;
  static const double defTextSize = 50*textSizeRatio;
  static const double textSizeRatio = 1/2.8;

  final String? name;
  final IconData? icon;

  final bool shadow;

  final bool elevated;
  final double? size;
  final bool enabled;
  final IconData? markIcon;
  final void Function()? onTap;

  const AccountThumbnailWidget(
      { this.name,
        this.icon,
        this.shadow=false,

        this.elevated=true,
        this.size,
        this.markIcon,
        this.enabled = true,
        this.onTap,
        Key? key
      }): super(key: key);

  @override
  Widget build(BuildContext context) {

    assert(name != null || icon != null);

    double size = this.size??defSize;

    String abbr = '';
    if(name != null) {
      List<String> nameParts = name!.split(' ');
      if (nameParts.length == 1) {
        String part = nameParts[0];
        if (part.length == 1)
          abbr = part[0].toUpperCase();
        else if (part.length > 1)
          abbr = part[0].toUpperCase() + part[1].toLowerCase();
      } else {
        String part1 = nameParts[0];
        String part2 = nameParts[1];
        if (part1.isNotEmpty)
          abbr += part1[0].toUpperCase();
        if (part2.isNotEmpty)
          abbr += part2[0].toUpperCase();
      }
    }
    Tuple2<Color, Color> colors = backgroundColors[name.hashCode%backgroundColors.length];

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [

          SimpleButton(
            onTap: onTap??(name==null?null:() => showAppToast(context, text: '$name${shadow?' (konto widmo)':''}')),
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            elevation: elevated?AppCard.bigElevation:0,
            radius: size/2,
            color: cardEnab_(context),
            child: Center(
              child:
              icon == null?
              Text(
                abbr,
                style: AppTextStyle(fontSize: size*textSizeRatio, fontWeight: weight.halfBold, color: enabled?textEnab_(context):hintEnab_(context)),
              ):
              Icon(icon, color: textEnab_(context)),
            ),
          ),

          if(shadow)
            Positioned(
              top: -.04*size,
              right: -.04*size,
              child: Material(
                borderRadius: BorderRadius.circular(size),
                color: background_(context),
                child: Icon(
                  MdiIcons.alien,
                  color: hintEnab_(context),
                  size: size/2.6,
                ),
              )
            ),

          if(markIcon != null)
            Positioned(
              bottom: -.04*size,
              right: -.04*size,
              child: Material(
                borderRadius: BorderRadius.circular(size),
                color: background_(context),
                child: Icon(
                  markIcon,
                  color: hintEnab_(context),
                  size: size/2.6,
                ),
              )
            ),

          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: backgroundIcon_(context).withOpacity(.02),
                      width: .098*size,
                      style: BorderStyle.solid
                  ),
                  borderRadius: BorderRadius.circular(size),
                ),
              ),
            ),
          ),

        ],
      )
    );

  }

}