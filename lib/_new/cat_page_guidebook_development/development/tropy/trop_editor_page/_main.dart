import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/border_material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_editor_page/providers.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_icon.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../trop.dart';

class TropEditorPage extends StatefulWidget{

  final Trop? initTrop;

  const TropEditorPage({this.initTrop, super.key});

  @override
  State<StatefulWidget> createState() => TropEditorPageState();

}

class TropEditorPageState extends State<TropEditorPage>{

  bool get editMode => widget.initTrop != null;



  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => NameControllerProvider(initTrop: widget.initTrop)),
      ChangeNotifierProvider(create: (context) => TropCategoryProvider(initTrop: widget.initTrop)),
      ChangeNotifierProvider(create: (context) => AimControllersProvider(initTrop: widget.initTrop)),
      ChangeNotifierProvider(create: (context) => TasksProvider(initTrop: widget.initTrop)),
    ],
    builder: (context, child) => BottomNavScaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            title: Text(
                editMode?'Edytuj trop':'Nowy trop'
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(MdiIcons.check),
                onPressed: (){

                },
              )
            ],
          ),

          SliverPadding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              sliver: SliverList(delegate: SliverChildListDelegate([

                const TitleShortcutRowWidget(
                  title: 'Informacje ogólne',
                  textAlign: TextAlign.left,
                ),

                Consumer<NameControllerProvider>(
                    builder: (context, prov, child) => AppTextFieldHint(
                      hint: 'Nazwa tropu:',
                      hintTop: 'Nazwa tropu',
                      textCapitalization: TextCapitalization.sentences,
                      controller: prov.nameController,
                      maxLength: Trop.maxLenName,
                    ),
                ),

                const SizedBox(height: Dimen.SIDE_MARG),

                Row(
                  children: [

                    Text('Kategoria:', style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG
                    )),

                    Expanded(child: DropdownButtonHideUnderline(
                        child: Consumer<TropCategoryProvider>(
                          builder: (context, prov, child) => DropdownButton2<TropCategory>(
                            isExpanded: true,
                            hint: Text(
                                'Kategoria tropu',
                                style: AppTextStyle(color: hintEnab_(context))
                            ),
                            items: TropCategory.values.map((cat) => DropdownMenuItem(
                              value: cat,
                              child: Row(
                                children: [
                                  const SizedBox(width: Dimen.defMarg),
                                  Text(tropCategoryToName(cat), style: AppTextStyle(
                                    fontSize: Dimen.TEXT_SIZE_BIG,
                                    fontWeight: weight.halfBold
                                  )),
                                  Expanded(child: Container()),
                                  Padding(
                                    padding: const EdgeInsets.all(Dimen.defMarg),
                                    child: TropIcon(cat, size: 60),
                                  ),
                                  const SizedBox(width: Dimen.defMarg),
                                ],
                              )
                            )).toList(),
                            itemPadding: EdgeInsets.zero,
                            itemHeight: TropIcon.defSize,

                            value: prov.category,
                            onChanged: (value) => prov.category = value as TropCategory,
                            iconSize: 0,
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppCard.defRadius),
                            ),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppCard.bigRadius),
                            ),
                            dropdownPadding: EdgeInsets.zero,
                          ),
                        )
                    ))
                  ],
                ),

                const SizedBox(height: Dimen.SIDE_MARG),

                const TitleShortcutRowWidget(
                  title: 'Cele',
                  textAlign: TextAlign.left,
                ),

                Consumer<AimControllersProvider>(
                  builder: (context, prov, child) => ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(
                      height: Dimen.defMarg,
                    ),
                    itemBuilder: (BuildContext context, int index) => Material(
                      color: cardEnab_(context),
                      borderRadius: BorderRadius.circular(AppCard.bigRadius),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          BorderMaterial(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: Dimen.defMarg,
                                left: Dimen.ICON_MARG,
                                bottom: Dimen.defMarg,
                                right: Dimen.defMarg,
                              ),
                              child: AppTextFieldHint(
                                hint: 'Cel ${index+1}:',
                                hintTop: 'Cel ${index+1}',
                                textCapitalization: TextCapitalization.sentences,
                                controller: prov.aimControllers[index],
                                maxLength: Trop.maxLenAim,
                                maxLines: null,
                              ),
                            ),
                          ),

                          if(prov.aimControllers.length > 1)
                            Align(
                              alignment: Alignment.bottomRight,
                              child: SimpleButton.from(
                                  context: context,
                                  text: 'Usuń',
                                  icon: MdiIcons.close,
                                  margin: EdgeInsets.zero,
                                  iconLeading: false,
                                  //padding: const EdgeInsets.all(Dimen.defMarg),
                                  onTap: (){

                                    String text = prov.aimControllers[index].text;
                                    prov.removeAt(index);

                                    showAppToast(
                                        context,
                                        text: 'Usunięto',
                                        buttonText: 'Cofnij',
                                        onButtonPressed: () => prov.insert(index, text)
                                    );
                                  }
                              ),
                            ),

                        ],
                      )
                    ),
                    itemCount: prov.aimControllers.length,
                    shrinkWrap: true,
                  )
                ),

                const SizedBox(
                  height: Dimen.defMarg,
                ),

                Consumer<AimControllersProvider>(
                  builder: (context, prov, child) => SimpleButton.from(
                      color: cardEnab_(context),
                      context: context,
                      icon: MdiIcons.plus,
                      text: 'Dodaj cel',
                      margin: EdgeInsets.zero,
                      onTap: () => prov.add()
                  ),
                ),

                const SizedBox(height: Dimen.SIDE_MARG),

                const TitleShortcutRowWidget(
                  title: 'Zadania',
                  textAlign: TextAlign.left,
                ),

                Consumer<TasksProvider>(
                    builder: (context, prov, child) => ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(
                        height: Dimen.defMarg,
                      ),
                      itemBuilder: (BuildContext context, int index) => Material(
                          color: cardEnab_(context),
                          borderRadius: BorderRadius.circular(AppCard.bigRadius),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [

                              BorderMaterial(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: Dimen.defMarg,
                                    left: Dimen.ICON_MARG,
                                    bottom: Dimen.defMarg,
                                    right: Dimen.defMarg,
                                  ),
                                  child: AppTextFieldHint(
                                    hint: 'Zadanie ${index+1}:',
                                    hintTop: 'Zadanie ${index+1}',
                                    textCapitalization: TextCapitalization.sentences,
                                    controller: prov.tasks[index].item1,
                                    maxLength: TropTask.maxLenContent,
                                    maxLines: null,
                                  ),
                                ),
                              ),

                              if(prov.tasks.length > 1)
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: SimpleButton.from(
                                      context: context,
                                      text: 'Usuń',
                                      icon: MdiIcons.close,
                                      margin: EdgeInsets.zero,
                                      iconLeading: false,
                                      //padding: const EdgeInsets.all(Dimen.defMarg),
                                      onTap: (){

                                        Tuple3<TextEditingController, DateTime, String> value = prov.tasks[index];
                                        prov.removeAt(index);

                                        showAppToast(
                                            context,
                                            text: 'Usunięto',
                                            buttonText: 'Cofnij',
                                            onButtonPressed: () => prov.insert(index, value)
                                        );
                                      }
                                  ),
                                ),

                            ],
                          )
                      ),
                      itemCount: prov.tasks.length,
                      shrinkWrap: true,
                    )
                ),

                const SizedBox(
                  height: Dimen.defMarg,
                ),

                Consumer<TasksProvider>(
                  builder: (context, prov, child) => SimpleButton.from(
                      color: cardEnab_(context),
                      context: context,
                      icon: MdiIcons.plus,
                      text: 'Dodaj zadanie',
                      margin: EdgeInsets.zero,
                      onTap: () => prov.add()
                  ),
                ),

              ]))
          )

        ],
      ),
    )
  );

}