import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_app_common/icon_selector_widget.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_home/community/community_editor/providers.dart';
import 'package:harcapp/_new/cat_page_home/community/community_thumbnail_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/multi_text_field.dart';
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

      Consumer<CategoryProvider>(builder: (context, prov, child) => Row(children: [
        CategoryTemplateWidget(
          prov.category,
          onTap: () => selectCommunityCategory(context, prov)
        ),
        Expanded(child: Container()),
        IconButton(
          icon: const Icon(MdiIcons.dotsVertical),
          onPressed: () => selectCommunityCategory(context, prov)
        )
      ])),

      const SizedBox(height: 2*Dimen.SIDE_MARG),

      Text(
        'Kontakt:',
        style: AppTextStyle(
            fontSize: Dimen.TEXT_SIZE_BIG,
            fontWeight: weight.halfBold
        ),
      ),

      const SizedBox(height: Dimen.defMarg),

      const CommunityContactEditorWidget(),

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

class CategoryTemplateWidget extends StatelessWidget{

  final CommunityCategory category;
  final Color? backgroundColor;
  final Color? textColor;
  final void Function()? onTap;

  const CategoryTemplateWidget(
      this.category,
      { this.backgroundColor,
        this.textColor,
        this.onTap,
        super.key
      });

  @override
  Widget build(BuildContext context) => SimpleButton.from(
      color: backgroundColor??backgroundIcon_(context),
      textColor: textColor??iconEnab_(context),
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(Dimen.defMarg),
      text: commCatToName[category],
      onTap: onTap
  );

}

class CategoryWidget extends StatelessWidget{

  final CommunityCategory category;
  final bool selected;
  final void Function()? onTap;

  const CategoryWidget(this.category, this.selected, {this.onTap, super.key});

  @override
  Widget build(BuildContext context) => SimpleButton.from(
      color: selected?backgroundIcon_(context):backgroundIcon_(context),
      textColor: selected?iconEnab_(context):iconDisab_(context),
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(Dimen.defMarg),
      text: commCatToName[category],
      onTap: onTap
  );

}

selectCommunityCategory(BuildContext context, CategoryProvider prov) => openDialog(
  context: context,
  builder: (context) => CommunityCategorySelectorDialog(
    prov.category,
    onCompleted: (category){
      if(category != null)
        prov.category = category;
    },
  ),
);

class CommunityCategorySelectorDialog extends StatefulWidget{

  final CommunityCategory initialCategory;
  final void Function(CommunityCategory?)? onCompleted;

  const CommunityCategorySelectorDialog(this.initialCategory, {this.onCompleted, super.key});

  @override
  State<StatefulWidget> createState() => CommunityCategorySelectorDialogState();
}

class CommunityCategorySelectorDialogState extends State<CommunityCategorySelectorDialog>{

  CommunityCategory get initialCategory => widget.initialCategory;
  void Function(CommunityCategory?)? get onCompleted => widget.onCompleted;

  late List<CommunityCategory> searchedCommunityCategories;

  late CommunityCategory selectedCategory;

  @override
  void initState() {
    searchedCommunityCategories = allCommunityCategories;
    selectedCategory = initialCategory;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(Dimen.ICON_MARG).add(MediaQuery.of(context).viewInsets),
    child: Material(
        clipBehavior: Clip.hardEdge,
        color: background_(context),
        borderRadius: BorderRadius.circular(AppCard.bigRadius),
        child: Column(
          children: [

            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [

                  FloatingContainer.child(
                      child: SearchField(
                        hint: 'Szukaj kategorii',
                        elevation: 1,
                        background: background_(context),
                        onChanged: (text){

                          text = remSpecChars(remPolChars(text));
                          List<CommunityCategory> searched = [];

                          for(CommunityCategory category in allCommunityCategories)
                            if(remSpecChars(remPolChars(commCatToName[category]!)).contains(text))
                              searched.add(category);

                          searchedCommunityCategories = searched;
                          setState(() {});
                        },
                      ),
                      height: SearchField.height
                  ),

                  SliverPadding(
                    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                    sliver: SliverList(delegate: SliverChildListDelegate([
                      Wrap(
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runSpacing: Dimen.defMarg,
                        spacing: Dimen.defMarg,
                        children: searchedCommunityCategories.map((cat) => CategoryWidget(
                          cat,
                          selectedCategory == cat,
                          onTap: () => setState(() => selectedCategory = cat),
                        )).toList(),
                      ),
                    ])),
                  )

                ],
              ),
            ),

            Row(
              children: [

                Expanded(
                  child: SimpleButton.from(
                    context: context,
                    margin: EdgeInsets.zero,
                    icon: MdiIcons.arrowLeft,
                    text: 'Wróć',
                    onTap: (){
                      onCompleted?.call(null);
                      Navigator.pop(context);
                    },
                  ),
                ),

                Expanded(
                  child: SimpleButton.from(
                    context: context,
                    margin: EdgeInsets.zero,
                    icon: MdiIcons.check,
                    iconLeading: false,
                    text: 'Zapisz',
                    onTap: (){
                      onCompleted?.call(selectedCategory);
                      Navigator.pop(context);
                    },
                  ),
                )

              ],
            )

          ],
        )
    ),
  );

}


class CommunityContactEditorWidget extends StatefulWidget{

  const CommunityContactEditorWidget({super.key});

  @override
  State<StatefulWidget> createState() => CommunityContactEditorWidgetState();

}

class CommunityContactEditorWidgetState extends State<CommunityContactEditorWidget>{

  late MultiTextFieldController emailController;
  late MultiTextFieldController phoneController;
  late MultiTextFieldController websiteController;
  late TextEditingController otherController;

  @override
  void initState() {

    ContactProvider contactProv = ContactProvider.of(context);

    emailController = MultiTextFieldController(texts: contactProv.email);
    phoneController = MultiTextFieldController(texts: contactProv.phone);
    websiteController = MultiTextFieldController(texts: contactProv.website);
    otherController = TextEditingController(text: contactProv.other);

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Consumer<ContactProvider>(
    builder: (context, prov, child) => Column(
      children: [

        AppTextFieldHint(
          hint: 'Email:',
          hintTop: 'Email',
          multiHintTop: 'Emaile',
          multi: true,
          multiExpanded: true,
          multiAddIcon: MdiIcons.plus,
          multiController: emailController,
          style: AppTextStyle(),
          onAnyChanged: (emails) => prov.email = emails,
        ),

        AppTextFieldHint(
          hint: 'Telefon:',
          hintTop: 'Telefon',
          multiHintTop: 'Telefony',
          multi: true,
          multiExpanded: true,
          multiAddIcon: MdiIcons.plus,
          multiController: phoneController,
          style: AppTextStyle(),
          onAnyChanged: (phones) => prov.phone = phones,
        ),

        AppTextFieldHint(
          hint: 'Strona:',
          hintTop: 'Strona internetowa',
          multiHintTop: 'Strony internetowe',
          multi: true,
          multiExpanded: true,
          multiAddIcon: MdiIcons.plus,
          multiController: websiteController,
          style: AppTextStyle(),
          onAnyChanged: (websites) => prov.website = websites,
        ),

        AppTextFieldHint(
          hint: 'Uwaga na marginesie:',
          hintTop: 'Uwaga na marginesie',
          controller: otherController,
          onAnyChanged: (other) => prov.other = other[0],
        ),

      ],
    ),
  );

}