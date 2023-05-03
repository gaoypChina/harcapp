import 'dart:async';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_users_page/trop_user_tile.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_users_page/trop_users_page.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_loadable_page.dart';
import 'package:harcapp/_new/cat_page_home/user_tile_dialogs.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:optional/optional_internal.dart';

import '../model/trop.dart';
import '../model/trop_role.dart';
import '../model/trop_user.dart';
import 'trop_user_header_widget.dart';

class TropUserTileExtended extends StatefulWidget{

  final Trop trop;
  final TropUser user;
  final dynamic heroTag;

  const TropUserTileExtended({
    required this.trop,
    required this.user,
    this.heroTag,
    super.key
  });

  @override
  State<StatefulWidget> createState() => TropUserTileExtendedState();

}

class TropUserTileExtendedState extends State<TropUserTileExtended>{

  Trop get trop => widget.trop;
  TropUser get user => widget.user;

  get heroTag => widget.heroTag;

  void openDetails() => showScrollBottomSheet(
      context: context,
      builder: (context) => BottomSheetDef(
        builder: (context) => Column(
          children: [

            TropUserHeaderWidget(
              user,
              heroTag: user.key
            ),

            const SizedBox(height: 2*24.0),

            ListTile(
              leading: const SizedBox(width: Dimen.ICON_SIZE),
              title: Text('Edytuj rolę człowieka tropu', style: AppTextStyle(color: hintEnab_(context))),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(communityRadius)),
            ),

            if(user.role == TropRole.OWNER)
              ListTile(
                enabled: !user.shadow,
                leading: Icon(tropRoleToIcon[TropRole.REGULAR]),
                title: Text('Nadaj rolę uczestnika', style: AppTextStyle()),
                trailing: IconButton(
                  icon: Icon(MdiIcons.informationOutline, color: iconEnab_(context)),
                  onPressed: () async {
                    Navigator.pop(context);
                    await UserListManagementLoadablePage.openPermissionsDialog(
                      context: context,
                      icon: tropRoleToIcon[TropRole.REGULAR]!,
                      title: TropUsersPage.regularsHeaderTitle,
                      permissions: TropUsersPage.regularPersmissions,
                    );
                    openDetails();
                  },
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(communityRadius)),
                onTap: user.shadow?null: () async {
                  await showUpdateUserDialog(
                      TropRole.REGULAR,
                      onSuccess: (){
                        if(user.key == AccountData.key)
                          Navigator.pop(context);
                      }
                  );

                  if(mounted) Navigator.pop(context);

                },
              ),

            if(user.role == TropRole.REGULAR)
              ListTile(
                enabled: !user.shadow,
                leading: Icon(tropRoleToIcon[TropRole.REGULAR]),
                title: Text('Nadaj rolę administratora', style: AppTextStyle()),
                trailing: IconButton(
                  icon: Icon(MdiIcons.informationOutline, color: iconEnab_(context)),
                  onPressed: () async {
                    Navigator.pop(context);
                    await UserListManagementLoadablePage.openPermissionsDialog(
                      context: context,
                      icon: tropRoleToIcon[TropRole.OWNER]!,
                      title: TropUsersPage.ownersHeaderTitle,
                      permissions: TropUsersPage.ownerPersmissions,
                    );
                    openDetails();
                  },
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(communityRadius)),
                onTap: user.shadow?null: () async {
                  await showUpdateUserDialog(
                      TropRole.OWNER,
                      onSuccess: (){
                        if(user.key == AccountData.key)
                          Navigator.pop(context);
                      }
                  );
                  if(mounted) Navigator.pop(context);
                },
              ),

            const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

            if(user.key != AccountData.key)
              ListTile(
                  leading: const Icon(MdiIcons.logoutVariant, color: Colors.red),
                  title: Text('Wyproś ogarniacza', style: AppTextStyle(color: Colors.red)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(communityRadius)),
                  onTap: () => showRemoveManagerDialog()
              ),

          ],
        ),
      )
  );

  Future<void> showUpdateUserDialog(TropRole newRole, {FutureOr<void> Function()? onSuccess}) =>
    showUpdateDialog(
        context: context,
        isMe: user.key == AccountData.key,
        loosingAdmin: newRole != TropRole.OWNER,
        currAdminCount: trop.loadedUsers.where((m) => m.role == TropRole.OWNER).length,
        looseAdminConfMess: 'Czy na pewno chcesz zrzec się roli <b>koordynatora</b> tropu <b>${trop.name}</b>?',
        handleUpdate: () async {

          showLoadingWidget(context, iconEnab_(context), 'Ostatnia prosta...');

          await ApiTrop.updateUsers(
              tropUniqName: trop.uniqName,
              users: [TropUserUpdateBody(user.key, role: Optional.of(newRole))],
              onSuccess: (List<TropUser> updatedUsers) async {
                trop.updateLoadedUsers(updatedUsers, context: context);
                trop.updateAssignedUsers(updatedUsers, context: context);
                trop.save(localOnly: true, synced: true);
                Navigator.pop(context); // Close loading widget
                await onSuccess?.call();
              },
              onServerMaybeWakingUp: () {
                if(!mounted) return true;
                showServerWakingUpToast(context);
                Navigator.pop(context); // Close loading widget
                return true;
              },
              onError: (){
                if(!mounted) return;
                showAppToast(context, text: simpleErrorMessage);
                Navigator.pop(context); // Close loading widget
              }
          );

        }
    );

  Future<void> showRemoveManagerDialog() async {

    showRemoveDialog(
        context: context,
        isMe: user.key == AccountData.key,
        loosingAdmin: user.key == AccountData.key,
        currAdminCount: trop.loadedUsers.where((u) => u.role == TropRole.OWNER).length,
        removingUserTitleMess: 'Wypraszanie ogarniacza...',
        removingUserDetailMess: '${user.name} nie będzie mieć dłużej dostępu do zarządzania tropem.\n\nNa pewno chcesz ${user.isMale?'go':'ją'} wyprosić?',
        handleRemove: () async {

          showLoadingWidget(context, iconEnab_(context), 'Wypraszanie koordynatora...');
          await ApiTrop.removeUsers(
              tropUniqName: trop.uniqName,
              userKeys: [user.key],
              onSuccess: (List<String> removedUsers) async {
                trop.removeLoadedUsersByKey(removedUsers, context: context);
                trop.save(localOnly: true, synced: true);

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
                if(mounted) showServerWakingUpToast(context);
                return true;
              },
              onError: () async {
                if(!mounted) return;
                showAppToast(context, text: simpleErrorMessage);
                await popPage(context);
              }
          );

        }
    );

  }

  @override
  Widget build(BuildContext context) => TropUserTile(
    user: user,
    onTap: openDetails,
    heroTag: heroTag,
  );

}