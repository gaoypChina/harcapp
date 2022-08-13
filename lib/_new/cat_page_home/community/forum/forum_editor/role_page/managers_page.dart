import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../model/forum.dart';
import 'manager_tile.dart';
import 'managers_page_templ.dart';

class ManagersPage extends StatelessWidget{

  final Forum forum;
  final PaletteGenerator? palette;

  const ManagersPage(this.forum, this.palette, {super.key});

  @override
  Widget build(BuildContext context) => MembersPageTempl(
    forum: forum,
    palette: palette,
    itemBuilder: (context, member) => ManagerTile(
        userKey: member.key,
        name: member.name,
        shadow: member.shadow,
        thumbnailColor: CommunityCoverColors.backgroundColor(context, palette),
        thumbnailBorderColor: CommunityCoverColors.cardColor(context, palette),
        role: member.role,
        anythingSelected: false,
        heroTag: member
    ),
  );

}
