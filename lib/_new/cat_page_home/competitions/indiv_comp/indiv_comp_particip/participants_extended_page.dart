import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/check_box.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_particip/participants_page.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_loadable_page.dart';
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
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../common/accept_task_dialog.dart';
import '../common/particip_tile_extended.dart';
import '../indiv_comp_participants_loader.dart';
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

  List<IndivCompParticip> get particips => comp.loadedParticips;

  late IndivCompParticipsProvider indivCompParticipsProv;
  late IndivCompParticipantsLoaderListener participsLoaderListener;

  late List<IndivCompParticip> selectedParticips;

  List<IndivCompParticip> participAdmins = [];
  List<IndivCompParticip> participModerators = [];
  List<IndivCompParticip> participObservers = [];

  late RefreshController controller;

  void updateUserSets(){
    participAdmins.clear();
    participModerators.clear();
    participObservers.clear();
    for(IndivCompParticip particip in particips) {
      switch(particip.profile.role){
        case CompRole.ADMIN:
          participAdmins.add(particip);
          break;
        case CompRole.MODERATOR:
          participModerators.add(particip);
          break;
        case CompRole.OBSERVER:
          participObservers.add(particip);
          break;
      }
    }
  }

  void onParticipProviderNotified(){
    updateUserSets();
    if(mounted) setState((){});
  }

  @override
  void initState() {

    IndivCompProvider indivCompProv = IndivCompProvider.of(context);
    IndivCompListProvider indivCompListProv = IndivCompListProvider.of(context);

    participsLoaderListener = IndivCompParticipantsLoaderListener(
      onNoInternet: (){
        if(!mounted) return;
        showAppToast(context, text: noInternetMessage);
      },
      onParticipantsLoaded: (participsPage, reloaded){
        updateUserSets();
        IndivComp.callProvidersWithParticips(indivCompProv, indivCompListProv, indivCompParticipsProv);
        if(reloaded) selectedParticips.clear();
      },
      onForceLoggedOut: (){
        if(!mounted) return true;
        showAppToast(context, text: forceLoggedOutMessage);
        return true;
      },
      onServerMaybeWakingUp: (){
        if(!mounted) return true;
        showServerWakingUpToast(context);
        return true;
      },
      onError: (_){
        if(!mounted) return;
        showAppToast(context, text: simpleErrorMessage);
      },
      onEnd: (_, __){
        if(!mounted) return;
        controller.loadComplete();
        controller.refreshCompleted();
        post(() => mounted?setState(() {}):null);
      }
    );

    indivCompParticipsProv = IndivCompParticipsProvider.of(context);
    indivCompParticipsProv.addListener(onParticipProviderNotified);

    comp.addParticipLoaderListener(participsLoaderListener);
    updateUserSets();

    controller = RefreshController(
      initialRefresh: comp.loadedParticips.length == 1 && comp.participCount > 1 && !comp.isParticipsLoading(),
    );
    post((){
      // `initialRefreshStatus` and `initialLoadStatus` in RefreshController don't work.
      if(!mounted) return;
      if(comp.loadedParticips.length == 1 && comp.isParticipsLoading())
        controller.headerMode!.value = RefreshStatus.refreshing;
      if(comp.loadedParticips.length > 1 && comp.isParticipsLoading())
        controller.footerMode!.value = LoadStatus.loading;
    });

    selectedParticips = [];

    super.initState();
  }

  @override
  void dispose() {
    indivCompParticipsProv.removeListener(onParticipProviderNotified);
    comp.removeParticipLoaderListener(participsLoaderListener);
    controller.dispose();
    super.dispose();
  }

  List<IndivCompParticip> inactiveSelParticips(){
    List<IndivCompParticip> result = [];
    for(IndivCompParticip particip in selectedParticips)
      if(!particip.profile.active) result.add(particip);

    return result;
  }

  void onPointsGranted(List<IndivCompCompletedTask> complTasks, Map<String, ShowRankData> newRanks){
    selectedParticips.clear();

    comp.handleNewTasksCompleted(complTasks, newRanks);

    IndivCompProvider.notify_(context);
    IndivCompListProvider.notify_(context);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) => Consumer<IndivCompParticipsProvider>(
      builder: (context, prov, child) => Stack(
        children: [

          UserListManagementLoadablePage<IndivCompParticip>(
            appBarTitle: selectedParticips.isEmpty?
            'Uczestnicy (${comp.participCount})':
            'Zaznaczono: ${selectedParticips.length}',

            userSets: [
              UserSet(
                  icon: compRoleToIcon(CompRole.ADMIN),
                  name: ParticipantsPage.adminsHeaderTitle,
                  users: participAdmins,
                  permissions: ParticipantsPage.adminPersmissions
              ),

              UserSet(
                  icon: compRoleToIcon(CompRole.MODERATOR),
                  name: ParticipantsPage.moderatorsHeaderTitle,
                  users: participModerators,
                  permissions: ParticipantsPage.moderatorPersmissions
              ),

              UserSet(
                  icon: compRoleToIcon(CompRole.OBSERVER),
                  name: ParticipantsPage.obsHeaderTitle,
                  users: participObservers,
                  permissions: ParticipantsPage.obsPersmissions
              )
            ],

            appBarLeading: selectedParticips.isEmpty?
            null:
            SizedBox(
              width: Dimen.APPBAR_LEADING_WIDTH,
              child: IconButton(
                  icon: Icon(MdiIcons.close),
                  onPressed: () => setState(() => selectedParticips.clear())
              ),
            ),

            appBarActions: [
              if(selectedParticips.isNotEmpty)
                // Padding(
                //   padding: const EdgeInsets.only(right: Dimen.defMarg + BorderMaterial.defBorderWidth + Dimen.LIST_TILE_TRAILING_MARGIN_VAL),
                //   child: CheckBox(
                //     value: selectedParticips.length == particips.length,
                //     activeColor: comp.colors.avgColor,
                //     unselectedWidgetColor: comp.colors.avgColor,
                //     checkColor: background_(context),
                //     onChanged: (_){
                //       if(selectedParticips.length == particips.length)
                //         selectedParticips.clear();
                //       else {
                //         selectedParticips.clear();
                //         selectedParticips.addAll(particips);
                //       }
                //       setState(() {});
                //     }
                //   )
                //
                //   // IconButton(
                //   //     icon: Icon(MdiIcons.selectMultiple),
                //   //     onPressed: (){
                //   //       selectedParticips.clear();
                //   //       selectedParticips.addAll(particips);
                //   //       setState(() {});
                //   //     }
                //   // )
                // )
                Container()
              else if(comp.myProfile?.role == CompRole.ADMIN)
                IconButton(
                    icon: Icon(MdiIcons.plus),
                    onPressed: () => showScrollBottomSheet(
                        context: context,
                        builder: (_) => AddUserBottomSheet(comp, context: context)
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

            headerTrailing: (context, userSet) => Padding(
              padding: const EdgeInsets.only(right: Dimen.LIST_TILE_TRAILING_MARGIN_VAL),
              child: CheckBox(
                value: Set.of(selectedParticips).containsAll(Set.of(userSet.users)),
                activeColor: comp.colors.avgColor,
                unselectedWidgetColor: comp.colors.avgColor,
                checkColor: background_(context),
                onChanged: (value){
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
            ),

            // IconButton(
            //   icon: Icon(MdiIcons.selectMultiple),
            //   onPressed: (){
            //
            //     bool allSelected = true;
            //     for(IndivCompParticip particip in userSet.users)
            //       if(!selectedParticips.contains(particip)){
            //         allSelected = false;
            //         break;
            //       }
            //
            //     if(allSelected)
            //       for(IndivCompParticip particip in userSet.users)
            //         selectedParticips.remove(particip);
            //     else
            //       for(IndivCompParticip particip in userSet.users)
            //         if(!selectedParticips.contains(particip)) selectedParticips.add(particip);
            //
            //     setState(() {});
            //
            //   },
            // ),

            bottomNavigationBar: selectedParticips.isEmpty?null:
            SimpleButton(
              margin: const EdgeInsets.only(
                left: Dimen.defMarg,
                right: Dimen.defMarg,
                bottom: Dimen.defMarg,
              ),
              padding: const EdgeInsets.all(Dimen.SIDE_MARG - Dimen.ICON_MARG),
              radius: AppCard.bigRadius,
              onTap: applyPointsToMultipleParticips,
              elevation: AppCard.bigElevation,
              color: comp.colors.colorStart,
              colorEnd: comp.colors.colorEnd,
              child: TitleShortcutRowWidget(
                icon: IndivComp.pointsIcon,
                titleColor: background_(context),
                iconColor: background_(context),
                title: 'Zalicz zadanie'
              ),

            ),

            userCount: comp.participCount,
            callReload: () async {
              await comp.reloadParticipsPage(awaitFinish: true);
              return comp.loadedParticips.length;
            },
            callLoadMore: () async {
              await comp.loadParticipsPage(awaitFinish: true);
              return comp.loadedParticips.length;

            },
            controller: controller,

          ),

          if(comp.participCount == 1 && selectedParticips.isEmpty)
            Positioned(
                left: 2*Dimen.SIDE_MARG,
                right: 2*Dimen.SIDE_MARG,
                bottom: kBottomNavigationBarHeight + 2*Dimen.SIDE_MARG,
                child: _HowToAddParticipsInfo()
            )

        ],
      )
  );

  void applyPointsToMultipleParticips(){

    if(comp.openTaskCount == 0){
      showAppToast(context, text: 'Brak zadań we współzawodnictwie');
      return;
    }

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


