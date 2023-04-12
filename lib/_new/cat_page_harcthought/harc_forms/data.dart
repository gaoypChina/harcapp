import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'harc_form.dart';

List<HarcForm> allForms = [

  const HarcForm(
    filename: 'warcaby',
    title: 'Warcaby',
    icon: MdiIcons.chessPawn,
    meto: [metoH, metoHS, metoW],
    tags: [tagFormaZespolowa, tagSprawdzanieWiedzy],
    colorStart: Colors.blueAccent,
    colorEnd: Colors.purple
  ),

  const HarcForm(
    filename: 'bukmacher',
    title: 'Bukmacher',
    icon: MdiIcons.gold,
    meto: [metoZ, metoH, metoHS, metoW],
    tags: [tagFormaZespolowa, tagSprawdzanieWiedzy],
    colorStart: Colors.yellow,
    colorEnd: Colors.deepOrange
  ),

  const HarcForm(
    filename: 'tak_nie',
    title: 'Tak-nie',
    icon: MdiIcons.circleHalfFull,
    meto: [metoZ, metoH, metoHS, metoW],
    tags: [tagFormaZespolowa, tagSprawdzanieWiedzy, tagRuchowe],
    colorStart: Colors.blueGrey,
    colorEnd: Colors.black
  ),

  const HarcForm(
      filename: 'wieza_papieru',
      title: 'Wieża papieru',
      icon: MdiIcons.scriptOutline,
      meto: [metoH, metoHS, metoW],
      tags: [tagFormaZespolowa],
      colorStart: Colors.grey,
      colorEnd: Colors.blue
  ),

];