import 'package:flutter/material.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../_common_classes/app_navigator.dart';
import '../circle/model/circle.dart';
import '../community_editor/_main.dart';
import '../forum/model/forum.dart';
import '../model/community.dart';
import '../role_page/managers_page.dart';

class CommunityButtonsWidget extends StatelessWidget{

  final Community community;
  final void Function(Circle)? onCircleTap;
  final void Function(Forum)? onForumTap;

  const CommunityButtonsWidget(this.community, {this.onCircleTap, this.onForumTap, super.key});

  @override
  Widget build(BuildContext context) => Row(
    children: [

      SimpleButton.from(
          context: context,
          margin: EdgeInsets.zero,
          radius: communityRadius,
          icon: MdiIcons.cogOutline,
          text: 'Ustawienia',
          onTap: (){

            CommunityProvider communityProv = CommunityProvider.of(context);

            pushPage(
                context,
                builder: (context) => CommunityEditorPage(
                  initCommunity: community,
                  onSaved: (updatedCommunity){
                    community.update(updatedCommunity);
                    communityProv.notify();
                  },
                  onForceLoggedOut: (){
                    Navigator.pop(context);
                  },
                )
            );

          }
      ),

      SimpleButton.from(
          context: context,
          margin: EdgeInsets.zero,
          radius: communityRadius,
          icon: MdiIcons.accountSupervisorCircleOutline,
          text: 'Role',
          onTap: () => pushPage(
              context,
              builder: (context) => CommunityManagersPage(
                community: community,
              )
          )
      ),

    ],
  );

}