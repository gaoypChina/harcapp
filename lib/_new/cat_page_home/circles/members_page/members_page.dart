import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_page.dart';
import 'package:palette_generator/palette_generator.dart';

import '../common/member_tile.dart';
import '../model/circle.dart';
import 'members_page_templ.dart';

class MembersPage extends StatelessWidget{

  final Circle circle;
  final PaletteGenerator? palette;

  const MembersPage(this.circle, this.palette, {super.key});

  @override
  Widget build(BuildContext context) => MembersPageTempl(
    circle: circle,
    palette: palette,
    itemBuilder: (context, member) => MemberTile(
        userKey: member.key,
        name: member.name,
        shadow: member.shadow,
        thumbnailColor: CirclePage.backgroundColor(context, palette),
        thumbnailBorderColor: CirclePage.cardColor(context, palette),
        role: member.role,
        anythingSelected: false,
        heroTag: member
    ),
  );

}
