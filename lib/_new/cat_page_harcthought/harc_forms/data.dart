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

  const HarcForm(
      filename: 'zwiad',
      title: 'Zwiad',
      icon: MdiIcons.treeOutline,
      meto: [metoH, metoHS, metoW],
      tags: [tagFormaZespolowa, tagFormaWyjazdowa, tagRuchowe, tagOrientacjaWTerenie],
      colorStart: Colors.amber,
      colorEnd: Colors.green
  ),

  const HarcForm(
      filename: 'antymapa',
      title: 'Anty-mapa',
      icon: MdiIcons.mapOutline,
      meto: [metoH, metoHS, metoW],
      tags: [tagOrientacjaWTerenie],
      colorStart: Colors.orange,
      colorEnd: Colors.brown
  ),

  const HarcForm(
      filename: 'pajeczyna',
      title: 'Pajęczyna',
      icon: MdiIcons.spiderWeb,
      meto: [metoH, metoHS, metoW],
      tags: [tagFormaZespolowa, tagRuchowe],
      colorStart: Colors.grey,
      colorEnd: Colors.blue
  ),

  const HarcForm(
      filename: 'jaka_to_melodia',
      title: 'Jaka to melodia',
      icon: MdiIcons.music,
      meto: [metoZ, metoH, metoHS, metoW],
      tags: [tagFormaZespolowa, tagMuzyczne, tagSprawdzanieWiedzy],
      colorStart: Colors.pinkAccent,
      colorEnd: Colors.deepPurple
  ),

  const HarcForm(
      filename: 'pantomima',
      title: 'Pantomima',
      icon: MdiIcons.dramaMasks,
      meto: [metoZ, metoH],
      tags: [tagFormaZespolowa],
      colorStart: Colors.green,
      colorEnd: Colors.blueAccent
  ),

  HarcForm(
      filename: 'ino',
      title: 'I.N.O.',
      icon: MdiIcons.mapMarkerOutline,
      meto: [metoH, metoHS, metoW],
      tags: [tagFormaZespolowa, tagWspolzawodnictwo, tagOrientacjaWTerenie],
      colorStart: Colors.green[800]!,
      colorEnd: Colors.lightGreen
  ),

  HarcForm(
      filename: 'sad_nad_sprawa',
      title: 'Sąd nad sprawą',
      icon: MdiIcons.gavel,
      meto: [metoHS, metoW],
      tags: [tagFormaZespolowa, tagArgumentacja],
      colorStart: Colors.deepPurple,
      colorEnd: Colors.blue
  ),

];