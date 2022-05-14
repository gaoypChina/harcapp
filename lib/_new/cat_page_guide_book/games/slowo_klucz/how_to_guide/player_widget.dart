import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum PlayerType{
  PLAYER,
  LEADER,
  MULTI,
}

class PlayerWidget extends StatelessWidget{

  static const double size = 42.0;
  static const Color _color = Colors.black;

  final Color? color;
  final bool showColor;
  final PlayerType type;

  const PlayerWidget({this.color, this.showColor = true, this.type = PlayerType.PLAYER});

  @override
  Widget build(BuildContext context) {

    IconData? icon;
    if(type == PlayerType.PLAYER) icon = MdiIcons.accountOutline;
    else if(type == PlayerType.LEADER) icon = MdiIcons.accountCowboyHat;
    else if(type == PlayerType.MULTI)  icon = MdiIcons.accountMultipleOutline;

    return Stack(
      children: [
        SimpleShadow(
          child: Icon(icon, size: size, color: _color,),
          offset: Offset(2, 2), // Default: Offset(2, 2)
          sigma: 2,             // Default: 2,
        ),

        AnimatedOpacity(
          opacity: showColor?1.0:0,
          duration: Duration(milliseconds: 500),
          child: Icon(icon, size: size, color: color??_color),
        ),

      ],
    );

  }

}