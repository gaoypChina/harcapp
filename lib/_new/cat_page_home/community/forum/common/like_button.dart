import 'package:flutter/material.dart';
import 'package:harcapp/_new/api/forum.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';

import '../model/forum.dart';

class ForumLikeButton extends StatefulWidget{

  final Forum forum;
  final PaletteGenerator? palette;
  final void Function(bool)? onChanged;

  const ForumLikeButton(this.forum, {this.palette, this.onChanged, super.key});

  @override
  State<StatefulWidget> createState() => ForumLikeButtonState();

}

class ForumLikeButtonState extends State<ForumLikeButton>{

  Forum get forum => widget.forum;
  PaletteGenerator? get palette => widget.palette;
  void Function(bool)? get onChanged => widget.onChanged;

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
      forum.liked?
      MdiIcons.thumbUp:
      MdiIcons.thumbUpOutline,

      onTap: processing?null:() async {

        setState(() => processing = true);
        await ApiForum.likeForum(
            forumKey: forum.key,
            like: !forum.liked,
            onSuccess: (liked){
              if(!mounted) return;

              if(forum.liked && !liked)
                forum.likeCnt -= 1;
              else if(!forum.liked && liked)
                forum.likeCnt += 1;

              forum.liked = liked;

              setState((){});
              ForumProvider.notify_(context);
              if(liked) showAppToast(context, text: 'Polubiłeś forum ${forum.name}');
              else showAppToast(context, text: 'Już nie lubisz forum ${forum.name}');

              onChanged?.call(liked);
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