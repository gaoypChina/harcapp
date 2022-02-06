import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HarcFormTag{

  final String text;
  final IconData icon;

  const HarcFormTag(this.text, this.icon);

}

const HarcFormTag tagSprawdzanieWiedzy = HarcFormTag('Sprawdz. wiedzy', MdiIcons.school);
const HarcFormTag tagFormaZespolowa = HarcFormTag('Zespołowe', MdiIcons.accountMultiple);
const HarcFormTag tagRuchowe = HarcFormTag('Ruchowe', MdiIcons.run);

class HarcFormMeto{

  final String text;
  final Color color;

  const HarcFormMeto(this.text, this.color);

}

const HarcFormMeto metoZ = HarcFormMeto('  Z', Colors.orangeAccent);
const HarcFormMeto metoH = HarcFormMeto('  H', Colors.green);
const HarcFormMeto metoHS = HarcFormMeto('  HS', Colors.indigo);
const HarcFormMeto metoW = HarcFormMeto('  W', Colors.red);

class HarcForm{

  final String filename;
  final String title;
  final IconData icon;
  final List<HarcFormMeto> meto;
  final List<HarcFormTag> tags;
  final Color colorStart;
  final Color colorEnd;

  const HarcForm({
    @required this.filename,
    @required this.title,
    @required this.icon,
    @required this.meto,
    @required this.tags,
    @required this.colorStart,
    @required this.colorEnd
  });

}