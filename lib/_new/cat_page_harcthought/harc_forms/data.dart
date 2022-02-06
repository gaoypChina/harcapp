import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'harc_form.dart';

List<HarcForm> allForms = [

  HarcForm(
    filename: 'warcaby',
    title: 'Warcaby',
    icon: MdiIcons.chessPawn,
    meto: [metoH, metoHS, metoW],
    tags: [tagFormaZespolowa, tagSprawdzanieWiedzy],
    colorStart: Colors.blueAccent,
    colorEnd: Colors.purple
  ),

  HarcForm(
    filename: 'bukmacher',
    title: 'Bukmacher',
    icon: MdiIcons.gold,
    meto: [metoZ, metoH, metoHS, metoW],
    tags: [tagFormaZespolowa, tagSprawdzanieWiedzy],
    colorStart: Colors.yellow,
    colorEnd: Colors.deepOrange
  ),

  HarcForm(
    filename: 'tak_nie',
    title: 'Tak-nie',
    icon: MdiIcons.circleHalfFull,
    meto: [metoZ, metoH, metoHS, metoW],
    tags: [tagFormaZespolowa, tagSprawdzanieWiedzy, tagRuchowe],
    colorStart: Colors.blueGrey,
    colorEnd: Colors.black
  ),

];