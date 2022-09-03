import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
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

class MemberTileExtended extends StatefulWidget{

  final Circle circle;
  final Member member;
  final PaletteGenerator? palette;
  final dynamic heroTag;

  const MemberTileExtended({
    required this.circle,
    required this.member,
    this.palette,
    this.heroTag,
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
                title: Text('Edytuj rolę uczestnika', style: AppTextStyle(color: hintEnab_(context)))
            ),

            if(member.role != CircleRole.OBSERVER)
              ListTile(
                enabled: !member.shadow,
                leading: Icon(circleRoleToIcon[CircleRole.OBSERVER], color: iconEnab_(context)),
                title: Text('Nadaj rolę uczestnika', style: AppTextStyle()),
                onTap: member.shadow?null: () async {
                  await showUpdateMemberDialog(
                      CircleRole.OBSERVER,
                      onSuccess: (){
                        if(member.key == AccountData.key)
                          Navigator.pop(context);
                      }
                  );

                  Navigator.pop(context);

                },
              ),

            if(member.role != CircleRole.EDITOR)
              ListTile(
                enabled: !member.shadow,
                leading: Icon(circleRoleToIcon[CircleRole.EDITOR], color: iconEnab_(context)),
                title: Text('Nadaj rolę redaktora', style: AppTextStyle()),
                onTap: member.shadow?null: () async {
                  await showUpdateMemberDialog(
                      CircleRole.EDITOR,
                      onSuccess: (){
                        if(member.key == AccountData.key)
                          Navigator.pop(context);
                      }
                  );
                  Navigator.pop(context);
                },
              ),

            if(member.role != CircleRole.ADMIN)
              ListTile(
                enabled: !member.shadow,
                leading: Icon(circleRoleToIcon[CircleRole.ADMIN], color: iconEnab_(context)),
                title: Text('Nadaj rolę administratora', style: AppTextStyle()),
                onTap: member.shadow?null: () async {
                  await showUpdateMemberDialog(
                      CircleRole.ADMIN,
                      onSuccess: (){
                        if(member.key == AccountData.key)
                          Navigator.pop(context);
                      }
                  );
                  Navigator.pop(context);
                },
              ),

            const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

            ListTile(
              enabled: !member.shadow,
              leading: Icon(MdiIcons.googleCirclesGroup, color: iconEnab_(context)),
              title: Text('Zarządzaj zastępem', style: AppTextStyle()),
              subtitle: member.patrol==null?null:Text(member.patrol!, style: AppTextStyle()),
              onTap: member.shadow?null: () async {
                Navigator.pop(context);
                showUpdatePatrolDialog();
              },
            ),

            const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

            if(member.key != AccountData.key)
              ListTile(
                  leading: const Icon(MdiIcons.logoutVariant, color: Colors.red),
                  title: Text('Wyproś członka', style: AppTextStyle(color: Colors.red)),
                  onTap: () => showRemoveMemberDialog()
              ),

          ],
        ),
      )
  );

  Future<void> showUpdateMemberDialog(CircleRole newRole, {void Function()? onSuccess}) async {
    showUpdateDialog(
        context: context,
        isMe: member.key == AccountData.key,
        loosingAdmin: newRole != CircleRole.ADMIN,
        currAdminCount: circle.members.where((m) => m.role == CircleRole.ADMIN).length,
        looseAdminConfMess: 'Czy na pewno chcesz zrzec się roli <b>administratora</b> kręgu <b>${circle.name}</b>?',
        handleUpdate: () async {

          showLoadingWidget(context, iconEnab_(context), 'Ostatnia prosta...');

          await ApiCircle.updateMembers(
              circleKey: circle.key,
              users: [MemberUpdateBody(member.key, role: newRole)],
              onSuccess: (List<Member> allMems){
                circle.setAllMembers(allMems, context: context);
                if(mounted) Navigator.pop(context); // Close loading widget.
                onSuccess?.call();
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
                showAppToast(context, text: 'Coś tu poszło nie tak...');
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

  Future<void> showRemoveMemberDialog() =>
    showRemoveDialog(
        context: context,
        isMe: member.key == AccountData.key,
        loosingAdmin: member.key == AccountData.key,
        currAdminCount: circle.members.where((m) => m.role == CircleRole.ADMIN).length,
        removingUserTitleMess: 'Wypraszanie członka...',
        removingUserDetailMess: '${member.name} nie będzie mieć dłużej dostępu do kręgu.\n\nNa pewno chcesz ${member.isMale?'go':'ją'} wyprosić?',
        handleRemove: () async {

          showLoadingWidget(context, CommunityCoverColors.strongColor(context, palette), 'Wypraszanie członka...');
          await ApiCircle.removeMembers(
              circleKey: circle.key,
              userKeys: [member.key],
              onSuccess: (List<String> removedMembers) async {
                circle.removeMembersByKey(removedMembers, context: context);

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
                showAppToast(context, text: 'Coś tu poszło nie tak...');
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
  void Function()? get onSuccess => widget.onSuccess;
  void Function()? get onError => widget.onError;

  late TextEditingController controller;

  late List<String> patrolNames;

  @override
  void initState(){
    controller = TextEditingController(text: member.patrol??'');

    patrolNames = [];
    for(Member mem in circle.members)
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
                  icon: const Icon(MdiIcons.check),
                  onPressed: () async {

                    showLoadingWidget(context, iconEnab_(context), 'Ostatnia prosta...');

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
                        onSuccess: (List<Member> allMems){
                          circle.setAllMembers(allMems, context: context);
                          if(mounted) Navigator.pop(context); // Close loading widget.
                          onSuccess?.call();
                        },
                        onServerMaybeWakingUp: () {
                          if(mounted) showAppToast(context, text: serverWakingUpMessage);
                          return true;
                        },
                        onError: (){
                          if(mounted) showAppToast(context, text: 'Coś tu poszło nie tak...');
                          if(mounted) Navigator.pop(context); // Close loading widget.
                          onError?.call();
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