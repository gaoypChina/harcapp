import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/border_material.dart';
import 'package:harcapp/_common_widgets/duration_date_widget.dart';
import 'package:harcapp/_new/app_drawer.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_editor_page/_main.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_icon.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_task_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_tile.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp/account/account_thumbnail_row_widget.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';


class TropWidget extends StatelessWidget{

  final Trop trop;
  final double iconSize;
  final bool showBack;

  const TropWidget(
      this.trop,
      { this.iconSize = TropIcon.defSize,
        this.showBack = true,
        super.key
      });

  @override
  Widget build(BuildContext context) => Consumer<TropProvider>(
      builder: (context, prov, child) => CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          if(showBack)
            SliverAppBar(
              title: Text(trop.name),
              centerTitle: true,
              floating: true,
              actions: [
                IconButton(
                  icon: const Icon(MdiIcons.pencilOutline),
                  onPressed: () {

                    pushPage(context, builder: (context) => TropEditorPage(
                        initTrop: trop,
                        allCategories:
                        trop.isCategoryHarc?
                        allHarcTropCategories:
                        allZuchTropCategories,
                        onSaved: (updatedTrop){
                          trop.update(updatedTrop);
                          showAppToast(context, text: 'Trop poprawiony');
                          prov.notify();
                        }
                    ));

                  },
                )
              ],
            ),

          SliverPadding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            sliver: SliverList(delegate: SliverChildListDelegate([

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  DurationDateWidget(
                    startDate: trop.startDate,
                    endDate: trop.endDate,
                    color: AppColors.zhpTropColor,
                  ),

                  const SizedBox(height: Dimen.SIDE_MARG),

                  TropTile(
                    name: trop.name,
                    category: trop.category,
                    zuchTropName: trop.customIconTropName,
                    trailing: TropTileProgressWidget(trop.completenessPercent),
                    iconSize: iconSize,
                  ),

                  if(account)
                    Row(
                      children: [

                        Expanded(child: AccountThumbnailRowWidget(trop.assignedUsers.map((p) => p.name).toList())),

                        if(trop.assignedUsers.length <= 1)
                          Align(
                            alignment: Alignment.centerRight,
                            child: SimpleButton.from(
                                context: context,
                                color: AppColors.zhpTropColor,
                                textColor: Colors.white,
                                icon: MdiIcons.accountPlusOutline,
                                text: 'Zaproś kumpli',
                                onTap: (){

                                  if(AccountData.loggedIn)
                                    showAppToast(context, text: 'Na razie to nie działa!');
                                  else
                                    AccountPage.open(context);

                                }
                            ),
                          ),

                      ],
                    ),

                  if(trop.aims.isNotEmpty)
                    const SizedBox(height: Dimen.SIDE_MARG),

                  if(trop.aims.isNotEmpty)
                    const TitleShortcutRowWidget(
                      title: 'Cele',
                      textAlign: TextAlign.left,
                    ),

                  if(trop.aims.isNotEmpty)
                    ListView.separated(
                      itemBuilder: (context, index) => TropAimWidget(trop.aims[index], index: index),
                      separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
                      itemCount: trop.aims.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),

                  const SizedBox(height: Dimen.SIDE_MARG),

                  const TitleShortcutRowWidget(
                    title: 'Zadania',
                    textAlign: TextAlign.left,
                  ),

                  ListView.separated(
                    itemBuilder: (context, index) => TropTaskWidget(trop, trop.tasks[index], index: index),
                    separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
                    itemCount: trop.tasks.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),

                  if(trop.hasNotesForLeaders)
                    const SizedBox(height: Dimen.SIDE_MARG),

                  if(trop.hasNotesForLeaders)
                    const TitleShortcutRowWidget(
                      title: 'Wskazówki dla drużynowego',
                      textAlign: TextAlign.left,
                    ),

                  if(trop.hasNotesForLeaders)
                    BorderMaterial(
                      child: Padding(
                          padding: const EdgeInsets.all(Dimen.ICON_MARG),
                          child: Text(
                            trop.notesForLeaders!,
                            style: AppTextStyle(
                                fontSize: Dimen.TEXT_SIZE_BIG
                            ),
                          )
                      ),
                    ),

                ],
              )

            ])),
          )

        ],
      )
  );

}

class TropAimWidget extends StatelessWidget{

  final String aim;
  final int index;

  const TropAimWidget(this.aim, {required this.index, super.key});

  @override
  Widget build(BuildContext context) => BorderMaterial(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.ICON_MARG),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Text(
            'Cel ${index+1}',
            style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG,
                fontWeight: weight.halfBold,
                color: hintEnab_(context)
            ),
          ),

          const SizedBox(height: Dimen.ICON_MARG),

          Text(
            aim,
            style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG
            ),
          )

        ],
      ),
    ),
  );

}