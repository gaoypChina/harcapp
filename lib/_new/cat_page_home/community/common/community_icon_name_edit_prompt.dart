import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_new/cat_page_home/community/community_editor/_main.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import '../model/community_role.dart';
import '../community_thumbnail_widget.dart';
import '../model/community.dart';
import 'community_cover_colors.dart';

class CommunityIconNameEditPrompt extends StatelessWidget{

  final CommunityBasicData initCommunity;
  final PaletteGenerator? palette;
  final bool editing;

  const CommunityIconNameEditPrompt(this.initCommunity, this.palette, {required this.editing, super.key});

  @override
  Widget build(BuildContext context) =>
    Consumer<CommunityProvider>(
      builder: (context, prov, child) => SimpleButton(
        radius: CommunityThumbnailWidget.defRadius,
        onTap: editing?(){

          Community? community = Community.allMap![initCommunity.key];
          CommunityProvider communityProv = CommunityProvider.of(context);

          if(community?.myRole == CommunityRole.ADMIN)
            pushPage(context, builder: (context) => CommunityEditorPage(
              initCommunity: community!,
              onSaved: (updatedCommunity){
                community.update(updatedCommunity);
                communityProv.notify();
              },
            ));
          else
            showAppToast(context, text: 'Nie masz uprawnień do edycji środowiska');

        }:null,
        child: Row(
          children: [
            CommunityThumbnailWidget(
              initCommunity.iconKey,
              initCommunity.key,

              backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
              iconColor: CommunityCoverColors.strongColor(context, palette),
              borderColor: CommunityCoverColors.strongColor(context, palette),

            ),

            const SizedBox(width: Dimen.SIDE_MARG),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Text(
                    initCommunity.name,
                    style: AppTextStyle(
                      fontSize: 24.0,
                      fontWeight: weight.bold,
                      color: CommunityCoverColors.strongColor(context, palette),
                    ),
                  ),

                  const SizedBox(height: Dimen.defMarg),

                  if(editing)
                    Text(
                      'Zmiana nazwy i ikony środowiska - ustawienia środowiska.',
                      style: AppTextStyle(
                        color: CommunityCoverColors.strongColor(context, palette),
                      ),
                    ),

                ],
              ),
            )

          ],
        ),
      ),
    );


}