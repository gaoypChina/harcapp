import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/ideas/trop_ideas_page.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/predefined/data_z.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_icon.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_page.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'ideas/data_h.dart';
import 'ideas/data_hs.dart';
import 'ideas/data_w.dart';
import 'predefined/trop_predef_page.dart';
import 'trop.dart';
import 'trop_editor_page/_main.dart';
import 'trop_tile.dart';

class TropyPage extends StatelessWidget{

  const TropyPage({super.key});

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: Consumer<TropListProvider>(
      builder: (context, prov, child) => CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          const SliverAppBar(
            floating: true,
            pinned: true,
            centerTitle: true,
            title: Text('Tropy'),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
                (BuildContext context, int index) => SimpleButton(
                  radius: AppCard.bigRadius,
                  child: TropTile(name: Trop.all[index].name, category: Trop.all[index].category),
                  onTap: () => pushPage(
                      context,
                      builder: (BuildContext context) => TropPage(Trop.all[index])
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: Dimen.SIDE_MARG),
                count: Trop.all.length
            )),
          )

        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: AppColors.zhpTropColor,
      child: const Icon(MdiIcons.plus),
      onPressed: () => openNewTropBottomSheet(context)
    ),
  );

  Future<void> openNewTropBottomSheet(BuildContext context) => showScrollBottomSheet(
      context: context,
      builder: (context) => BottomSheetDef(
          builder: (context) => Column(
            children: [

              const TitleShortcutRowWidget(title: 'Stwórz nowy trop', textAlign: TextAlign.left),

              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppCard.bigRadius),
                ),
                leading: const TropIcon(TropCategory.harcZaradnosc, size: 52.0,),
                title: Text('Nowy trop harcerski', style: AppTextStyle(fontWeight: weight.halfBold)),
                subtitle: Text('...ale też HS i W', style: AppTextStyle()),
                onTap: (){
                  Navigator.pop(context);
                  pushPage(context, builder: (_) => TropEditorPage(
                      allCategories: allHarcTropCategories,
                      onSaved: (Trop trop){
                        Trop.addToAll(trop, context: context);
                        pushPage(context, builder: (context) => TropPage(trop));
                      }
                  ));
                }
              ),

              ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppCard.bigRadius),
                  ),
                  leading: const TropIcon(TropCategory.zuchObywatelskie, size: 52.0/(2/1.71), zuchTropName: 'biale_orly',),
                  title: Text('Nowy trop zuchowy', style: AppTextStyle(fontWeight: weight.halfBold)),
                  subtitle: Text('...z listy gotowców', style: AppTextStyle()),
                  onTap: (){
                    Navigator.pop(context);
                    pushPage(context, builder: (context) => TropPredefPage(
                      metoShort: 'Z',
                      predefTrops: zuchTrops,
                      allCategories: allZuchTropCategories,
                    ));
                  }
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              const TitleShortcutRowWidget(title: 'Poszukaj pomysłów', textAlign: TextAlign.left),

              ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppCard.bigRadius),
                  ),
                  leading: Material(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.metoZhpH,
                    child: SvgPicture.asset(
                      'assets/images/meto/h.svg',
                      height: 48.0,
                      width: 48.0,
                    ),
                  ),
                  trailing: const Icon(MdiIcons.lightbulbOutline),
                  title: Text('Pomysły i inspiracje', style: AppTextStyle(fontWeight: weight.halfBold)),
                  subtitle: Text('...na trop harcerski', style: AppTextStyle()),
                  onTap: (){
                    Navigator.pop(context);
                    pushPage(context, builder: (context) => TropIdeasPage(
                      metoShort: 'H',
                      ideas: harcHTropIdeas,
                    ));
                  }
              ),

              ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppCard.bigRadius),
                  ),
                  leading: Material(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.metoZhpHS,
                    child: SvgPicture.asset(
                      'assets/images/meto/hs.svg',
                      height: 48.0,
                      width: 48.0,
                    ),
                  ),
                  trailing: const Icon(MdiIcons.lightbulbOutline),
                  title: Text('Pomysły i inspiracje', style: AppTextStyle(fontWeight: weight.halfBold)),
                  subtitle: Text('...na trop starszoharcerski', style: AppTextStyle()),
                  onTap: (){
                    Navigator.pop(context);
                    pushPage(context, builder: (context) => TropIdeasPage(
                      metoShort: 'HS',
                      ideas: harcHSTropIdeas,
                    ));
                  }
              ),

              ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppCard.bigRadius),
                  ),
                  leading: Material(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.metoZhpW,
                    child: SvgPicture.asset(
                      'assets/images/meto/w.svg',
                      height: 48.0,
                      width: 48.0,
                    ),
                  ),
                  trailing: const Icon(MdiIcons.lightbulbOutline),
                  title: Text('Pomysły i inspiracje', style: AppTextStyle(fontWeight: weight.halfBold)),
                  subtitle: Text('...na trop wędrowniczy', style: AppTextStyle()),
                  onTap: (){
                    Navigator.pop(context);
                    pushPage(context, builder: (context) => TropIdeasPage(
                      metoShort: 'W',
                      ideas: harcWTropIdeas,
                    ));
                  }
              ),

            ],
          )
      )
  );

}