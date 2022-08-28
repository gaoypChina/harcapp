import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_page.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/comp_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task_compl.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/indiv_comp_particips_provider.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../common/accept_task_dialog.dart';
import '../common/particip_tile_extended.dart';
import '../models/show_rank_data.dart';
import 'add_user_bottom_sheet.dart';

class ParticipantsExtendedPage extends StatefulWidget{

  final IndivComp comp;

  const ParticipantsExtendedPage(this.comp, {super.key});

  @override
  State<StatefulWidget> createState() => ParticipantsExtendedPageState();

}

class ParticipantsExtendedPageState extends State<ParticipantsExtendedPage>{

  IndivComp get comp => widget.comp;

  List<IndivCompParticip> get particips => comp.particips;

  late List<IndivCompParticip> selectedParticips;

  void onParticipProviderNotified() => setState((){});

  @override
  void initState() {

    IndivCompParticipsProvider.addOnNotifyListener(onParticipProviderNotified);
    selectedParticips = [];

    super.initState();
  }

  @override
  void dispose() {
    IndivCompParticipsProvider.removeOnNotifyListener(onParticipProviderNotified);
    super.dispose();
  }

  List<IndivCompParticip> inactiveSelParticips(){
    List<IndivCompParticip> result = [];
    for(IndivCompParticip particip in selectedParticips)
      if(!particip.profile.active) result.add(particip);

    return result;
  }

  void onPointsGranted(List<IndivCompTaskCompl> taskComplList, Map<String, ShowRankData> idRank){
    selectedParticips.clear();

    comp.handleRanks(idRank);

    for(IndivCompTaskCompl taskCompl in taskComplList) {
      comp.myProfile?.addCompletedTask(taskCompl);
      comp.addPoints(taskCompl.participKey, taskCompl.points(comp));
    }

    Provider.of<IndivCompProvider>(context, listen: false).notify();
    Provider.of<IndivCompListProvider>(context, listen: false).notify();
    
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => Consumer<IndivCompParticipsProvider>(
      builder: (context, prov, child){

        List<IndivCompParticip> participAdmins = [];
        List<IndivCompParticip> participMods = [];
        List<IndivCompParticip> participObs = [];

        for(IndivCompParticip particip in particips) {
          if (particip.profile.role == CompRole.ADMIN)
            participAdmins.add(particip);

          else if (particip.profile.role == CompRole.MODERATOR)
            participMods.add(particip);

          else if (particip.profile.role == CompRole.OBSERVER)
            participObs.add(particip);
        }

        participAdmins.sort((p1, p2) => p1.profile.points??0 - (p2.profile.points??0));
        participMods.sort((p1, p2) => p1.profile.points??0 - (p2.profile.points??0));
        participObs.sort((p1, p2) => p1.profile.points??0 - (p2.profile.points??0));

        return Stack(
          children: [

            UserListManagementPage<IndivCompParticip>(
              appBarTitle: selectedParticips.isEmpty?
              'Lista członków (${particips.length})':
              'Zaznaczono: ${selectedParticips.length}',

              userSets: [
                UserSet(
                    icon: compRoleToIcon[CompRole.ADMIN]!,
                    name: 'Administratorzy',
                    users: participAdmins
                ),

                UserSet(
                    icon: compRoleToIcon[CompRole.MODERATOR]!,
                    name: 'Moderatorzy',
                    users: participMods
                ),

                UserSet(
                    icon: compRoleToIcon[CompRole.OBSERVER]!,
                    name: 'Pozostali',
                    users: participObs
                )
              ],

              appBarLeading: selectedParticips.isEmpty?
              null:
              SizedBox(
                width: Dimen.APPBAR_LEADING_WIDTH,
                child: IconButton(
                    icon: const Icon(MdiIcons.close),
                    onPressed: () => setState(() => selectedParticips.clear())
                ),
              ),
              
              appBarActions: [
                if(selectedParticips.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(right: 2*Dimen.defMarg),
                    child: IconButton(
                        icon: const Icon(MdiIcons.selectMultiple),
                        onPressed: (){
                          selectedParticips.clear();
                          selectedParticips.addAll(particips);
                          setState(() {});
                        }
                    ),
                  )
                else if(comp.myProfile?.role == CompRole.ADMIN)
                  IconButton(
                      icon: const Icon(MdiIcons.plus),
                      onPressed: () => showScrollBottomSheet(
                          context: context,
                          builder: (context) => AddUserBottomSheet(comp)
                      )
                  )
              ],

              userTileBuilder: (context, particip) => ParticipTileExtended(
                comp,
                particip,

                anythingSelected: selectedParticips.isNotEmpty,
                selected: selectedParticips.contains(particip),

                onSelectionTap: (){
                  if(!particip.profile.active&& !selectedParticips.contains(particip))
                    showAppToast(context, text: 'Pamiętaj, <b>${particip.name}</b> nie uczestniczy we współzawodnictwie. <b>Nie można mu przyznać punktów</b>.');

                  if(selectedParticips.contains(particip))
                    setState(() => selectedParticips.remove(particip));
                  else
                    setState(() => selectedParticips.add(particip));
                },
                onPointsGranted: onPointsGranted,
                heroTag: particip,
              ),

              headerTrailing: (context, userSet) => IconButton(
                icon: const Icon(MdiIcons.selectMultiple),
                onPressed: (){

                  bool allSelected = true;
                  for(IndivCompParticip particip in userSet.users)
                    if(!selectedParticips.contains(particip)){
                      allSelected = false;
                      break;
                    }

                  if(allSelected)
                    for(IndivCompParticip particip in userSet.users)
                      selectedParticips.remove(particip);
                  else
                    for(IndivCompParticip particip in userSet.users)
                      if(!selectedParticips.contains(particip)) selectedParticips.add(particip);

                  setState(() {});

                },
              ),

              bottomNavigationBar: selectedParticips.isEmpty?null:
              SimpleButton(
                margin: const EdgeInsets.only(
                    left: Dimen.defMarg,
                    right: Dimen.defMarg,
                    bottom: Dimen.defMarg,
                ),
                radius: AppCard.bigRadius,
                onTap: applyPointsToMultipleParticips,
                color: comp.colors.colorStart,
                colorEnd: comp.colors.colorEnd,
                child: TitleShortcutRowWidget(
                    icon: MdiIcons.plusCircleMultipleOutline,
                    titleColor: background_(context),
                    iconColor: background_(context),
                    title: 'Zalicz zadanie'
                ),

              ),

            ),

            if(comp.particips.length == 1 && selectedParticips.isEmpty)
              Positioned(
                  left: 2*Dimen.SIDE_MARG,
                  right: 2*Dimen.SIDE_MARG,
                  bottom: kBottomNavigationBarHeight + 2*Dimen.SIDE_MARG,
                  child: _HowToAddParticipsInfo()
              )

          ],
        );

      }
  );

  void applyPointsToMultipleParticips(){

    List<IndivCompParticip> inactiveSelParticips = this.inactiveSelParticips();

    if(inactiveSelParticips.isEmpty)
      openAcceptTaskDialog(
          context,
          comp,
          selectedParticips,
          onPointsGranted: onPointsGranted
      );
    else if(inactiveSelParticips.length == 1)
      showAlertDialog(
          context,
          title: 'Nie wszyscy chcą punktów...',
          content: '<b>${inactiveSelParticips[0].name}</b> nie uczestniczy we współzawodnictwie i nie można przyznać ${inactiveSelParticips[0].isMale?'mu':'jej'} punktów.\n\nOdznacz ${inactiveSelParticips[0].isMale?'go':'ją'}, by kontynuować.',
          actionBuilder: (context) => [

            AlertDialogButton(
                text: 'No dobrze',
                onTap: () => Navigator.pop(context)
            )

          ]
      );
    else
      showAlertDialog(
          context,
          title: 'Nie wszyscy chcą punktów...',
          content: '<b>${inactiveSelParticips[0].name}</b> i <b>${inactiveSelParticips.length - 1} innych</b> nie uczestniczą we współzawodnictwie i nie można przyznać im punktów.\n\nOddzacz ich, by kontynuować.',
          actionBuilder: (context) => [
            SimpleButton(
                child: Text('No dobrze', style: AppTextStyle(fontWeight: weight.halfBold)),
                onTap: () => Navigator.pop(context)
            )
          ]
      );


  }

}

class _HowToAddParticipsInfo extends StatelessWidget{

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    child: Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(MdiIcons.accountMultiple, size: 48.0, color: backgroundIcon_(context)),
            const SizedBox(width: Dimen.defMarg),
            Icon(MdiIcons.accountPlus, size: 68.0, color: backgroundIcon_(context)),
            const SizedBox(width: Dimen.defMarg+8),

            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(pi),
              child: Icon(MdiIcons.accountMultiple, size: 48.0, color: backgroundIcon_(context)),
            )

          ],
        ),

        //SizedBox(height: Dimen.SIDE_MARG),

        AppText(
          'Wybierz <b>+</b> w górnym prawym rogu, by <b>dodać uczestników</b> do współzawodnictwa',
          color: hintEnab_(context),
          size: Dimen.TEXT_SIZE_APPBAR,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );

}


