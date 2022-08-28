import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/icon_selector_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/community_editor/providers.dart';
import 'package:harcapp/_new/cat_page_home/community/community_thumbnail_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:harcapp_core/dimen.dart';

class GeneralPart extends StatefulWidget{

  final String communityKey;
  const GeneralPart({this.communityKey = '', super.key});

  @override
  State<StatefulWidget> createState() => GeneralPartState();

}

class GeneralPartState extends State<GeneralPart>{

  String get communityKey => widget.communityKey;

  @override
  Widget build(BuildContext context) => ListView(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
    children: [

      Consumer<IconKeyProvider>(
        builder: (context, prov, child) => SimpleButton(
            radius: AppCard.bigRadius,
            child: Row(
              children: [

                CommunityThumbnailWidget(prov.iconKey, communityKey),

                const SizedBox(width: Dimen.SIDE_MARG),

                Expanded(
                  child: Text(
                    'Edytuj ikonę środowiska',
                    style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Icon(MdiIcons.gestureTap, color: hintEnab_(context))

              ],
            ),
            onTap: () async {

              prov.iconKey = await selectCommonIcon(context, initIconKey: prov.iconKey)??prov.iconKey;

            }
        ),
      ),

      const SizedBox(height: Dimen.SIDE_MARG),

      Consumer<NameProvider>(
        builder: (context, prov, child) => AppTextFieldHint(
          hint: 'Nazwa środowiska:',
          hintTop: 'Nazwa środowiska',
          controller: prov.nameController,
          maxLength: Community.maxLenName,
        ),
      ),

    ],
  );

}
