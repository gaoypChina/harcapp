import 'dart:async';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_loadable_page.dart';
import 'package:harcapp/_new/cat_page_home/user_tile_dialogs.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:optional/optional_internal.dart';
import 'package:palette_generator/palette_generator.dart';

import '../circle_role.dart';
import '../model/circle.dart';
import '../model/member.dart';
import 'member_header_widget.dart';
import 'member_tile.dart';
import 'members_page.dart';

class MemberTileExtended extends StatefulWidget{

  final Circle circle;
  final Member member;
  final PaletteGenerator? palette;
  final dynamic heroTag;

  final void Function()? onUpdated;
  final void Function()? onRemoved;

  const MemberTileExtended({
    required this.circle,
    required this.member,
    this.palette,
    this.heroTag,

    this.onUpdated,
    this.onRemoved,

    super.key
  });

  @override
  State<StatefulWidget> createState() => MemberTileExtendedState();

}

class MemberTileExtendedState extends State<MemberTileExtended>{

  Circle get circle => widget.circle;
  PaletteGenerator? get palette => widget.palette;
  Member get member => widget.member;

  get heroTag => widget.heroTag;

  void Function()? get onUpdated => widget.onUpdated;
  void Function()? get onRemoved => widget.onRemoved;

  void openDetails() => showScrollBottomSheet(
      context: context,
      builder: (context) => BottomSheetDef(
        color: CommunityCoverColors.backgroundColor(context, palette),
        builder: (context) => Column(
          children: [

            MemberHeaderWidget(
                member,
                palette: palette,
                heroTag: member.key
            ),

            const SizedBox(height: 2*24.0),

            ListTile(
              leading: const SizedBox(width: Dimen.ICON_SIZE),
              title: Text('Edytuj rolę członka', style: AppTextStyle(color: hintEnab_(context))),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(communityRadius)),
            ),

            if(member.role != CircleRole.OBSERVER)
              ListTile(
                enabled: !member.shadow,
                leading: Icon(circleRoleToIcon[CircleRole.OBSERVER]),
                title: Text('Nadaj rolę obserwatora', style: AppTextStyle()),
                trailing: IconButton(
                  icon: Icon(MdiIcons.informationOutline, color: iconEnab_(context)),
                  onPressed: () async {
                    Navigator.pop(context);
                    await UserListManagementLoadablePage.openPermissionsDialog(
                      context: context,
                      icon: circleRoleToIcon[CircleRole.OBSERVER]!,
                      title: MembersPage.observersHeaderTitle,
                      permissions: MembersPage.observerPersmissions,
                      color: CommunityCoverColors.backgroundColor(context, palette),
                    );
                    openDetails();
                  },
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(communityRadius)),
                onTap: member.shadow?null: () async {
                  await showUpdateMemberDialog(
                      CircleRole.OBSERVER,
                      onSuccess: (){
                        if(member.key == AccountData.key)
                          Navigator.pop(context);
                        onUpdated?.call();
                      }
                  );

                  if(mounted) Navigator.pop(context);

                },
              ),

            if(member.role != CircleRole.EDITOR)
              ListTile(
                enabled: !member.shadow,
                leading: Icon(circleRoleToIcon[CircleRole.EDITOR]),
                title: Text('Nadaj rolę redaktora', style: AppTextStyle()),
                trailing: IconButton(
                  icon: Icon(MdiIcons.informationOutline, color: iconEnab_(context)),
                  onPressed: () async {
                    Navigator.pop(context);
                    await UserListManagementLoadablePage.openPermissionsDialog(
                      context: context,
                      icon: circleRoleToIcon[CircleRole.EDITOR]!,
                      title: MembersPage.editorsHeaderTitle,
                      permissions: MembersPage.editorPersmissions,
                      color: CommunityCoverColors.backgroundColor(context, palette),
                    );
                    openDetails();
                  },
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(communityRadius)),
                onTap: member.shadow?null: () async {
                  await showUpdateMemberDialog(
                      CircleRole.EDITOR,
                      onSuccess: (){
                        if(member.key == AccountData.key)
                          Navigator.pop(context);
                        onUpdated?.call();
                      }
                  );
                  if(mounted) Navigator.pop(context);
                },
              ),

            if(member.role != CircleRole.ADMIN)
              ListTile(
                enabled: !member.shadow,
                leading: Icon(circleRoleToIcon[CircleRole.ADMIN]),
                title: Text('Nadaj rolę administratora', style: AppTextStyle()),
                trailing: IconButton(
                  icon: Icon(MdiIcons.informationOutline, color: iconEnab_(context)),
                  onPressed: () async {
                    Navigator.pop(context);
                    await UserListManagementLoadablePage.openPermissionsDialog(
                      context: context,
                      icon: circleRoleToIcon[CircleRole.ADMIN]!,
                      title: MembersPage.adminsHeaderTitle,
                      permissions: MembersPage.adminPersmissions,
                      color: CommunityCoverColors.backgroundColor(context, palette),
                    );
                    openDetails();
                  },
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(communityRadius)),
                onTap: member.shadow?null: () async {
                  await showUpdateMemberDialog(
                      CircleRole.ADMIN,
                      onSuccess: (){
                        if(member.key == AccountData.key)
                          Navigator.pop(context);
                        onUpdated?.call();
                      }
                  );
                  if(mounted) Navigator.pop(context);
                },
              ),

            const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

            ListTile(
              enabled: !member.shadow,
              leading: Icon(MdiIcons.googleCirclesGroup),
              title: Text('Zarządzaj zastępem', style: AppTextStyle()),
              subtitle: member.patrol==null?null:Text(member.patrol!, style: AppTextStyle()),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(communityRadius)),
              onTap: member.shadow?null: () async {
                Navigator.pop(context);
                showUpdatePatrolDialog();
              },
            ),

            const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

            if(member.key != AccountData.key)
              ListTile(
                  leading: Icon(MdiIcons.logoutVariant, color: Colors.red),
                  title: Text('Wyproś członka', style: AppTextStyle(color: Colors.red)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(communityRadius)),
                  onTap: () => showRemoveMemberDialog(
                      onSuccess: onRemoved
                  )
              ),

          ],
        ),
      )
  );

  Future<void> showUpdateMemberDialog(CircleRole newRole, {FutureOr<void> Function()? onSuccess}) async {
    showUpdateDialog(
        context: context,
        isMe: member.key == AccountData.key,
        loosingAdmin: member.role == CircleRole.ADMIN && newRole != CircleRole.ADMIN,
        currAdminCount: circle.loadedMembers.where((m) => m.role == CircleRole.ADMIN).length,
        looseAdminConfMess: 'Czy na pewno chcesz zrzec się roli <b>administratora</b> kręgu <b>${circle.name}</b>?',
        handleUpdate: () async {

          showLoadingWidget(context, 'Ostatnia prosta...');

          await ApiCircle.updateMembers(
              circleKey: circle.key,
              users: [MemberUpdateBody(member.key, role: newRole)],
              onSuccess: (List<Member> updatedMems) async {
                circle.updateLoadedMembers(updatedMems, context: context);
                await onSuccess?.call();

                if(!mounted) return;
                Navigator.pop(context); // Close loading widget.
              },
              onForceLoggedOut: () {
                if(!mounted) return true;
                showAppToast(context, text: forceLoggedOutMessage);
                Navigator.pop(context); // Close loading widget.
                return true;
              },
              onServerMaybeWakingUp: () async {
                if(!mounted) return true;
                Navigator.pop(context); // Close loading widget.
                showAppToast(context, text: serverWakingUpMessage);
                return true;
              },
              onError: (){
                if(!mounted) return;
                showAppToast(context, text: simpleErrorMessage);
                Navigator.pop(context); // Close loading widget.
              }
          );

        }
    );
  }

  Future<void> showUpdatePatrolDialog({void Function()? onSuccess}) async => openDialog(
      context: context,
      builder: (context) => _EditPatrolDialog(
        circle,
        palette,
        member,
        onSuccess: () => Navigator.pop(context),
        onError: () => Navigator.pop(context),
      )
  );

  Future<void> showRemoveMemberDialog({FutureOr<void> Function()? onSuccess}) =>
    showRemoveDialog(
        context: context,
        isMe: member.key == AccountData.key,
        loosingAdmin: member.key == AccountData.key,
        currAdminCount: circle.loadedMembers.where((m) => m.role == CircleRole.ADMIN).length,
        removingUserTitleMess: 'Wypraszanie członka...',
        removingUserDetailMess: '${member.name} nie będzie mieć dłużej dostępu do kręgu.\n\nNa pewno chcesz ${member.isMale?'go':'ją'} wyprosić?',
        handleRemove: () async {

          showLoadingWidget(context, 'Wypraszanie członka...', color: CommunityCoverColors.strongColor(context, palette), );
          await ApiCircle.removeMembers(
              circleKey: circle.key,
              userKeys: [member.key],
              onSuccess: (List<String> removedMembers) async {
                circle.removeLoadedMembersByKey(removedMembers, context: context);
                await onSuccess?.call();

                if(!mounted) return;
                showAppToast(context, text: 'Wyproszono');
                await popPage(context);
              },
              onForceLoggedOut: () {
                if(!mounted) return true;
                showAppToast(context, text: forceLoggedOutMessage);
                Navigator.pop(context); // Close loading widget.
                return true;
              },
              onServerMaybeWakingUp: () {
                if(!mounted) return true;
                showAppToast(context, text: serverWakingUpMessage);
                Navigator.pop(context); // Close loading widget.

                return true;
              },
              onError: () async {
                if(!mounted) return;
                showAppToast(context, text: simpleErrorMessage);
                Navigator.pop(context); // Close loading widget.
              }
          );

        }
    );

  @override
  Widget build(BuildContext context) => MemberTile(
    member: member,
    palette: palette,
    onTap: openDetails,
    heroTag: heroTag,
  );

}

class _EditPatrolDialog extends StatefulWidget{

  final Circle circle;
  final PaletteGenerator? palette;
  final Member member;
  final void Function()? onSuccess;
  final void Function()? onError;

  const _EditPatrolDialog(this.circle, this.palette, this.member, {this.onSuccess, this.onError});

  @override
  State<StatefulWidget> createState() => _EditPatrolDialogState();

}

class _EditPatrolDialogState extends State<_EditPatrolDialog>{

  Circle get circle => widget.circle;
  PaletteGenerator? get palette => widget.palette;
  Member get member => widget.member;
  FutureOr<void> Function()? get onSuccess => widget.onSuccess;
  FutureOr<void> Function()? get onError => widget.onError;

  late TextEditingController controller;

  late List<String> patrolNames;

  @override
  void initState(){
    controller = TextEditingController(text: member.patrol??'');

    patrolNames = [];
    for(Member mem in circle.loadedMembers)
      if(mem.patrol != null && !patrolNames.contains(mem.patrol))
        patrolNames.add(mem.patrol!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG).add(MediaQuery.of(context).viewInsets),
      child: Material(
        borderRadius: BorderRadius.circular(AppCard.bigRadius),
        clipBehavior: Clip.hardEdge,
        color: CommunityCoverColors.backgroundColor(context, palette),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              title: const Text('Przypisz do zastępu'),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [

                IconButton(
                  icon: Icon(MdiIcons.check),
                  onPressed: () async {

                    showLoadingWidget(context, 'Ostatnia prosta...');

                    await ApiCircle.updateMembers(
                        circleKey: circle.key,
                        users: [MemberUpdateBody(
                            member.key,
                            patrol: Optional.ofNullable(
                                controller.text.isEmpty?
                                null:
                                controller.text
                            )
                        )],
                        onSuccess: (List<Member> updatedMems) async {
                          circle.updateLoadedMembers(updatedMems, context: context);
                          if(mounted) Navigator.pop(context); // Close loading widget.
                          await onSuccess?.call();
                        },
                        onServerMaybeWakingUp: () {
                          if(mounted) showAppToast(context, text: serverWakingUpMessage);
                          return true;
                        },
                        onError: () async {
                          if(mounted) showAppToast(context, text: simpleErrorMessage);
                          if(mounted) Navigator.pop(context); // Close loading widget.
                          await onError?.call();
                        }
                    );

                  },
                )

              ],
            ),

            Padding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              child: AppTextFieldHint(
                hint: 'Nazwa zastępu:',
                hintTop: 'Nazwa zastępu',
                controller: controller,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: Dimen.ICON_MARG,
                  right: Dimen.ICON_MARG,
                  bottom: Dimen.ICON_MARG
              ),
              child: Wrap(
                spacing: Dimen.ICON_MARG,
                runSpacing: Dimen.ICON_MARG,
                children: patrolNames.map(
                        (patrol) => SimpleButton.from(
                      context: context,
                      text: patrol,
                      margin: EdgeInsets.zero,
                      color: backgroundIcon_(context),
                      onTap: () => controller.text = patrol,
                    )
                ).toList(),
              ),
            )

          ],
        ),
      ),
    ),
  );

}