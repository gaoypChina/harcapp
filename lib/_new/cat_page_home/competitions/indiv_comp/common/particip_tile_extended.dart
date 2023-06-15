import 'dart:async';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_loadable_page.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/indiv_comp_rank_icon.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/particip_header_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/particip_tile.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/points_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/comp_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task_compl.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tuple/tuple.dart';

import '../../../user_tile_dialogs.dart';
import '../indiv_comp_completed_task_page/completed_tasks_page.dart';
import '../indiv_comp_particip/participants_page.dart';
import '../models/show_rank_data.dart';
import '../models/indiv_comp_profile.dart';
import '../models/rank_disp_type.dart';
import '../task_accept_state.dart';
import 'accept_task_dialog.dart';

class ParticipTileExtended extends StatefulWidget{

  final IndivComp comp;
  final IndivCompParticip particip;
  final bool anythingSelected;
  final bool selected;
  final void Function()? onSelectionTap;
  final void Function(List<IndivCompCompletedTask> taskComplList, Map<String, ShowRankData> idRank)? onPointsGranted;
  final dynamic heroTag;

  const ParticipTileExtended(
      this.comp,
      this.particip,
      { required this.anythingSelected,
        this.selected=false,
        this.onSelectionTap,
        this.onPointsGranted,
        this.heroTag,
        super.key
      });

  @override
  State<StatefulWidget> createState() => ParticipTileExtendedState();

}

class ParticipTileExtendedState extends State<ParticipTileExtended>{

  IndivComp get comp => widget.comp;
  IndivCompProfile? get myProfile => comp.myProfile;

  IndivCompParticip get particip => widget.particip;
  bool get anythingSelected => widget.anythingSelected;
  bool get selected => widget.selected;
  void Function()? get onSelectionTap => widget.onSelectionTap;
  void Function(List<IndivCompCompletedTask> taskComplList, Map<String, ShowRankData> idRank)? get onPointsGranted => widget.onPointsGranted;

  get heroTag => widget.heroTag;

  double get actionExtentRation => (Dimen.ICON_FOOTPRINT + ParticipTile.horizontalPadding)/MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) => ParticipTile(
    particip: particip,
    selected: selected,
    selectedTextColor: comp.colors.avgColor,
    onLongPress: onSelectionTap,
    onTap: anythingSelected?onSelectionTap:openDetails,
    heroTag: heroTag,
    subtitle:
    particip.profile.active?
    PointsWidget(points: particip.profile.points, size: 24):
    Text('Obserwator', style: AppTextStyle(color: hintEnab_(context))),

    trailing:
    (myProfile?.role == CompRole.ADMIN || myProfile?.role == CompRole.MODERATOR) && particip.profile.active?
    AnimatedOpacity(
        opacity: anythingSelected?0:1,
        duration: const Duration(milliseconds: 300),
        child: IndivCompRankIcon(
          particip.profile,
          activeParticipCnt: comp.activeParticipCount,
          showPercent: comp.rankDispType == RankDispType.RANGE_PERC,
          colors: comp.colors,
          size: 42.0,
          key: ValueKey(Tuple2(comp.rankDispType, comp.activeParticipCount)),
        )
    ):null,
  );


  void openDetails() => showScrollBottomSheet(
      context: context,
      builder: (context) => BottomSheetDef(
        builder: (context) => Column(
          children: [

            ParticipHeaderWidget(particip.name, particip.shadow, particip.profile.role, heroTag: particip.key),

            const SizedBox(height: 2*24.0),

            ListTile(
              leading: Icon(
                MdiIcons.plusCircleMultipleOutline,
                color: particip.profile.active?textEnab_(context): hintEnab_(context),
              ),
              title: Text(
                  'Przyznaj punkty',
                  style: AppTextStyle(
                    color: particip.profile.active?textEnab_(context): hintEnab_(context),
                  )
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppCard.bigRadius)),
              onTap: particip.profile.active? () async {
                if(!await isNetworkAvailable()){
                  showAppToast(context, text: 'Brak dostępu do Internetu');
                  return;
                }

                Navigator.pop(context);

                openAcceptTaskDialog(
                    context,
                    comp,
                    [particip],
                    onPointsGranted: onPointsGranted
                );

              }:null,
            ),
            ListTile(
                leading: Icon(MdiIcons.cubeOutline),
                title: Text(
                    'Zobacz zrealizowane zadania',
                    style: AppTextStyle(color: textEnab_(context))
                ),
                trailing:  Text(
                    '${particip.profile.completedTasksAcceptedCount}',
                    style: AppTextStyle(color: textEnab_(context))
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppCard.bigRadius)),
                onTap: (){
                  Navigator.pop(context);
                  pushPage(context, builder: (context) => CompletedTasksPage(
                    comp,
                    title: 'Zrealizowane zadania',
                    particip: particip,
                    acceptState: TaskAcceptState.ACCEPTED,

                    initLoadedCompletedTasks: comp.getParticip(particip.key)!.profile.loadedCompletedTasks,
                    onCompletedTasksPageLoaded: (completedTasksPage){
                      comp.addCompletedTasksForParticip(particip.key, completedTasksPage, increaseTotalCount: false);
                    }
                  ));
                }
            ),

            if(comp.myProfile?.role == CompRole.ADMIN)
              Column(
                children: [

                  const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

                  ListTile(
                    leading: const SizedBox(width: Dimen.ICON_SIZE),
                    title: Text('Edytuj rolę uczestnika', style: AppTextStyle(color: hintEnab_(context))),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppCard.bigRadius)),
                  ),

                  if(particip.profile.role != CompRole.OBSERVER)
                    ListTile(
                      enabled: !particip.shadow,
                      leading: Icon(compRoleToIcon(CompRole.OBSERVER)),
                      title: Text('Nadaj rolę uczestnika', style: AppTextStyle()),
                      trailing: IconButton(
                        icon: Icon(MdiIcons.informationOutline, color: iconEnab_(context)),
                        onPressed: () async {
                          Navigator.pop(context);
                          await UserListManagementLoadablePage.openPermissionsDialog(
                            context: context,
                            icon: compRoleToIcon(CompRole.OBSERVER),
                            title: ParticipantsPage.obsHeaderTitle,
                            permissions: ParticipantsPage.obsPersmissions,
                          );
                          openDetails();
                        },
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppCard.bigRadius)),
                      onTap: particip.shadow?null: () async {
                        await showUpdateParticipDialog(
                            CompRole.OBSERVER,
                            particip.profile.active,
                            onSuccess: (){
                              if(particip.key == AccountData.key)
                                Navigator.pop(context);
                            }
                        );

                        if(mounted) Navigator.pop(context);

                      },
                    ),

                  if(particip.profile.role != CompRole.MODERATOR)
                    ListTile(
                      enabled: !particip.shadow,
                      leading: Icon(compRoleToIcon(CompRole.MODERATOR)),
                      title: Text('Nadaj rolę moderatora', style: AppTextStyle()),
                      trailing: IconButton(
                        icon: Icon(MdiIcons.informationOutline, color: iconEnab_(context)),
                        onPressed: () async {
                          Navigator.pop(context);
                          await UserListManagementLoadablePage.openPermissionsDialog(
                            context: context,
                            icon: compRoleToIcon(CompRole.MODERATOR),
                            title: ParticipantsPage.moderatorsHeaderTitle,
                            permissions: ParticipantsPage.moderatorPersmissions,
                          );
                          openDetails();
                        },
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppCard.bigRadius)),
                      onTap: particip.shadow?null: () async {
                        await showUpdateParticipDialog(
                            CompRole.MODERATOR,
                            particip.profile.active,
                            onSuccess: (){
                              if(particip.key == AccountData.key)
                                Navigator.pop(context);
                            }
                        );
                        if(mounted) Navigator.pop(context);
                      },
                    ),

                  if(particip.profile.role != CompRole.ADMIN)
                    ListTile(
                      enabled: !particip.shadow,
                      leading: Icon(compRoleToIcon(CompRole.ADMIN)),
                      title: Text('Nadaj rolę administratora', style: AppTextStyle()),
                      trailing: IconButton(
                        icon: Icon(MdiIcons.informationOutline, color: iconEnab_(context)),
                        onPressed: () async {
                          Navigator.pop(context);
                          await UserListManagementLoadablePage.openPermissionsDialog(
                            context: context,
                            icon: compRoleToIcon(CompRole.ADMIN),
                            title: ParticipantsPage.adminsHeaderTitle,
                            permissions: ParticipantsPage.adminPersmissions,
                          );
                          openDetails();
                        },
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppCard.bigRadius)),
                      onTap: particip.shadow?null: () async {
                        await showUpdateParticipDialog(CompRole.ADMIN, particip.profile.active);
                        if(mounted) Navigator.pop(context);
                      },
                    ),

                  ListTile(
                    enabled: !particip.shadow,
                    leading: Icon(particip.profile.active?MdiIcons.coffeeOutline:MdiIcons.run),
                    title: Text(particip.profile.active?'Unieaktywnij uczestnika':'Włącz uczestnika', style: AppTextStyle()),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppCard.bigRadius)),
                    onTap: particip.shadow?null: () async {
                      await showUpdateParticipDialog(particip.profile.role, !particip.profile.active);
                      if(mounted) Navigator.pop(context);
                    },
                  ),

                  const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

                  if(particip.key != AccountData.key)
                    ListTile(
                        leading: Icon(MdiIcons.logoutVariant, color: Colors.red),
                        title: Text('Wyproś uczestnika', style: AppTextStyle(color: Colors.red)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppCard.bigRadius)),
                        onTap: () => showRemoveParticipDialog()
                    ),

                ],
              ),

          ],
        ),
      )
  );

  Future<void> showUpdateParticipDialog(CompRole newRole, bool newActive, {FutureOr<void> Function()? onSuccess}) =>
    showUpdateDialog(
      context: context,
      isMe: particip.key == AccountData.key,
      loosingAdmin: newRole != CompRole.ADMIN,
      currAdminCount: comp.loadedParticips.where((p) => p.profile.role == CompRole.ADMIN).length,
      looseAdminConfMess: 'Czy na pewno chcesz zrzec się roli <b>administratora</b> współzawodnictwa <b>${comp.name}</b>?',
      handleUpdate: () async {

        showLoadingWidget(context, iconEnab_(context), 'Ostatnia prosta...');

        await ApiIndivComp.updateParticipants(
            comp: comp,
            users: [ParticipBody(particip.key, newRole, newActive)],
            onSuccess: (List<IndivCompParticip> updatedParticips) async {
              comp.updateLoadedParticips(updatedParticips, context: context);
              Navigator.pop(context); // Close loading widget.
              Navigator.pop(context);
              await onSuccess?.call();
            },
            onForceLoggedOut: () {
              if(!mounted) return true;
              showAppToast(context, text: forceLoggedOutMessage);
              Navigator.pop(context); // Close loading widget.
              return true;
            },
            onServerMaybeWakingUp: () {
              if(!mounted) return true;
              showServerWakingUpToast(context);
              Navigator.pop(context); // Close loading widget.
              return true;
            },
            onError: (){
              if(!mounted) return;
              showAppToast(context, text: simpleErrorMessage);
              Navigator.pop(context);  // Close loading widget.
            }
        );

      }
    );

  Future<void> showRemoveParticipDialog() async {

    showRemoveDialog(
        context: context, 
        isMe: particip.key == AccountData.key, 
        loosingAdmin: particip.key == AccountData.key,
        currAdminCount: comp.loadedParticips.where((p) => p.profile.role == CompRole.ADMIN).length,
        removingUserTitleMess: 'Wypraszanie użytkownika...',
        removingUserDetailMess: '${particip.name} nie będzie mieć dłużej dostępu do współzawodnictwa.\n\nNa pewno chcesz ${particip.isMale?'go':'ją'} wyprosić?',
        handleRemove: () async {

          showLoadingWidget(context, comp.colors.avgColor, 'Wypraszanie użytkownika...');
          await ApiIndivComp.removeParticipants(
              compKey: comp.key,
              userKeys: [particip.key],
              onSuccess: (List<String> removedParticips) async {
                comp.removeLoadedParticipsByKey(removedParticips, context: context);

                if(!mounted) return;
                showAppToast(context, text: 'Wyproszono');
                await popPage(context); // Close loading widget.
              },
              onForceLoggedOut: () {
                if(!mounted) return true;
                showAppToast(context, text: forceLoggedOutMessage);
                Navigator.pop(context); // Close loading widget.
                return true;
              },
              onServerMaybeWakingUp: () async {
                if(!mounted) return true;
                showServerWakingUpToast(context);
                await popPage(context); // Close loading widget.
                return true;
              },
              onError: () async {
                if(!mounted) return;
                showAppToast(context, text: simpleErrorMessage);
                await popPage(context); // Close loading widget.
                await popPage(context);
              }
          );
          
        }
    );

  }

}
