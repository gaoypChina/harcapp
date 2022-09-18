import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_app_common/icon_selector_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/community_editor/providers.dart';
import 'package:harcapp/_new/cat_page_home/community/community_thumbnail_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:harcapp_core/dimen.dart';

import '../model/community_category.dart';

class GeneralPart extends StatefulWidget{

  final Community? initCommunity;
  const GeneralPart(this.initCommunity, {super.key});

  @override
  State<StatefulWidget> createState() => GeneralPartState();

}

class GeneralPartState extends State<GeneralPart>{

  Community? get initCommunity => widget.initCommunity;

  @override
  Widget build(BuildContext context) => ListView(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
    children: [

      Consumer<IconKeyProvider>(
        builder: (context, prov, child) => SimpleButton(
            radius: CommunityThumbnailWidget.defRadius,
            child: Row(
              children: [

                CommunityThumbnailWidget(
                  prov.iconKey,
                  initCommunity?.key??'',
                  colorsInverted: true,
                ),

                const SizedBox(width: Dimen.SIDE_MARG),

                Expanded(
                  child: Text(
                    'Edytuj ikonę środowiska',
                    style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      fontWeight: weight.halfBold,
                      color: hintEnab_(context)
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

      Text(
        'Nazwa środowiska:',
        style: AppTextStyle(
            fontSize: Dimen.TEXT_SIZE_BIG,
            fontWeight: weight.halfBold
        ),
      ),

      Consumer<NameProvider>(
        builder: (context, prov, child) => AppTextFieldHint(
          hint: 'Nazwa środowiska:',
          hintTop: '',
          controller: prov.nameController,
          maxLength: Community.maxLenName,
        ),
      ),

      const SizedBox(height: Dimen.SIDE_MARG),

      Text(
        'Rodzaj środowiska:',
        style: AppTextStyle(
          fontSize: Dimen.TEXT_SIZE_BIG,
          fontWeight: weight.halfBold
        ),
      ),

      const SizedBox(height: Dimen.defMarg),

      Wrap(
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: Dimen.defMarg,
        spacing: Dimen.defMarg,
        children: allCommunityCategories.map((cat) => CategoryWidget(cat)).toList(),
      ),

      if(initCommunity == null)
        const SizedBox(height: 4*Dimen.SIDE_MARG),

      if(initCommunity == null)
        Text(
          'Zawiązać krąg lub założyć forum będziesz ${AccountData.sex == Sex.male?'mógł':'mogła'} po stworzeniu środowiska',
          style: AppTextStyle(
            fontSize: Dimen.TEXT_SIZE_APPBAR,
            fontWeight: weight.halfBold,
            color: hintEnab_(context)
          ),
          textAlign: TextAlign.center,
        ),

      if(initCommunity == null)
        const SizedBox(height: 2*Dimen.SIDE_MARG),

      if(initCommunity == null)
        Icon(
          Community.icon,
          color: hintEnab_(context),
          size: 72,
        )

    ],
  );

}

class CategoryWidget extends StatelessWidget{

  final CommunityCategory category;

  const CategoryWidget(this.category, {super.key});

  @override
  Widget build(BuildContext context) => Consumer<CategoryProvider>(
      builder: (context, prov, child) => SimpleButton.from(
          color: category == prov.category?backgroundIcon_(context):backgroundIcon_(context),
          textColor: category == prov.category?iconEnab_(context):iconDisab_(context),
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.all(Dimen.defMarg),
          text: commCatToName[category],
          onTap: () => CategoryProvider.of(context).category = category
      )
  );



}