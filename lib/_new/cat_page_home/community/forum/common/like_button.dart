import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';

import '../model/forum.dart';

class ForumLikeButton extends StatefulWidget{

  final Forum forum;
  final PaletteGenerator? palette;

  const ForumLikeButton(this.forum, {this.palette, super.key});

  @override
  State<StatefulWidget> createState() => ForumLikeButtonState();

}

class ForumLikeButtonState extends State<ForumLikeButton>{

  Forum get forum => widget.forum;
  PaletteGenerator? get palette => widget.palette;

  @override
  Widget build(BuildContext context) => SimpleButton.from(
      context: context,
      radius: AppCard.defRadius,
      margin: EdgeInsets.zero,
      color: CommunityCoverColors.cardColor(context, palette),
      icon: MdiIcons.thumbUp,
      onTap: (){}
  );

}