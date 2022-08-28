import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/api/forum.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';

import '../model/forum.dart';

class ForumFollowButton extends StatefulWidget{

  final Forum forum;
  final PaletteGenerator? palette;
  final void Function(bool)? onChanged;

  const ForumFollowButton(this.forum, {this.palette, this.onChanged, super.key});

  @override
  State<StatefulWidget> createState() => ForumFollowButtonState();

}

class ForumFollowButtonState extends State<ForumFollowButton>{

  Forum get forum => widget.forum;
  void Function(bool)? get onChanged => widget.onChanged;
  PaletteGenerator? get palette => widget.palette;

  late bool processing;

  @override
  void initState() {
    processing = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SimpleButton.from(
      radius: AppCard.defRadius,
      margin: EdgeInsets.zero,
      color: CommunityCoverColors.cardColor(context, palette),

      textColor:
      processing?
      iconDisab_(context):
      iconEnab_(context),

      icon:
      forum.followed?
      MdiIcons.eyeCheckOutline:
      MdiIcons.eyePlusOutline,

      text:
      forum.followed?
      'Obserwujesz':
      'Obserwuj',

      animateSize: true,

      onTap: processing?null:() async {

        setState(() => processing = true);
        await ApiForum.followForum(
          forumKey: forum.key,
          follow: !forum.followed,
          onSuccess: (followed){
            if(!mounted) return;

            if(forum.followed && !followed)
              forum.followersCnt -= 1;
            else if(!forum.followed && followed)
              forum.followersCnt += 1;

            forum.followed = followed;

            if(followed)
              Community.addToAllByForum(forum, context: context);
            else
              Community.removeForum(forum, context: context);
            
            setState((){});
            ForumProvider.notify_(context);
            CommunityListProvider.notify_(context);
            if(followed) showAppToast(context, text: 'Obserwujesz forum ${forum.name}');
            else showAppToast(context, text: 'Już nie obserwujesz forum ${forum.name}');

            onChanged?.call(followed);
          },
          onError: () => mounted?showAppToast(context, text: simpleErrorMessage):null,
          onServerMaybeWakingUp: () {
            if(mounted) showServerWakingUpToast(context);
            return true;
          },
          onForceLoggedOut: (){
            Navigator.pop(context);
            return true;
          }
        );

        setState(() => processing = false);

      }
  );

}