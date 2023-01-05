import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/community.dart';
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
import 'package:palette_generator/palette_generator.dart';

import '../common/community_cover_colors.dart';
import '../model/community_role.dart';
import '../model/community.dart';
import '../model/community_manager.dart';
import 'manager_header_widget.dart';
import 'manager_tile.dart';
import 'managers_page.dart';

class CommunityManagerTileExtended extends StatefulWidget{

  final Community community;
  final CommunityManager manager;
  final PaletteGenerator? palette;
  final dynamic heroTag;

  const CommunityManagerTileExtended({
    required this.community,
    required this.manager,
    this.palette,
    this.heroTag,
    super.key
  });

  @override
  State<StatefulWidget> createState() => CommunityManagerTileExtendedState();

}

class CommunityManagerTileExtendedState extends State<CommunityManagerTileExtended>{

  Community get community => widget.community;
  PaletteGenerator? get palette => widget.palette;
  CommunityManager get manager => widget.manager;

  get heroTag => widget.heroTag;

  void openDetails() => showScrollBottomSheet(
      context: context,
      builder: (context) => BottomSheetDef(
        color: CommunityCoverColors.backgroundColor(context, palette),
        builder: (context) => Column(
          children: [

            ManagerHeaderWidget(
              manager,
              palette: palette,
              heroTag: manager.key
            ),

            const SizedBox(height: 2*24.0),

            ListTile(
              leading: const SizedBox(width: Dimen.ICON_SIZE),
              title: Text('Edytuj rolę ogarniacza', style: AppTextStyle(color: hintEnab_(context))),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(communityRadius)),
            ),

            if(manager.role == CommunityRole.ADMIN)
              ListTile(
                enabled: !manager.shadow,
                leading: Icon(communityRoleToIcon[CommunityRole.REGULAR]),
                title: Text('Nadaj rolę parobka', style: AppTextStyle()),
                trailing: IconButton(
                  icon: Icon(MdiIcons.informationOutline, color: iconEnab_(context)),
                  onPressed: () async {
                    Navigator.pop(context);
                    await UserListManagementLoadablePage.openPermissionsDialog(
                      context: context,
                      icon: communityRoleToIcon[CommunityRole.REGULAR]!,
                      title: CommunityManagersPage.regularsHeaderTitle,
                      permissions: CommunityManagersPage.regularPersmissions,
                      color: CommunityCoverColors.backgroundColor(context, palette),
                    );
                    openDetails();
                  },
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(communityRadius)),
                onTap: manager.shadow?null: () async {
                  await showUpdateManagerDialog(
                      CommunityRole.REGULAR,
                      onSuccess: (){
                        if(manager.key == AccountData.key)
                          Navigator.pop(context);
                      }
                  );

                  if(mounted) Navigator.pop(context);

                },
              ),

            if(manager.role == CommunityRole.REGULAR)
              ListTile(
                enabled: !manager.shadow,
                leading: Icon(communityRoleToIcon[CommunityRole.REGULAR]),
                title: Text('Nadaj rolę administratora', style: AppTextStyle()),
                trailing: IconButton(
                  icon: Icon(MdiIcons.informationOutline, color: iconEnab_(context)),
                  onPressed: () async {
                    Navigator.pop(context);
                    await UserListManagementLoadablePage.openPermissionsDialog(
                      context: context,
                      icon: communityRoleToIcon[CommunityRole.ADMIN]!,
                      title: CommunityManagersPage.adminsHeaderTitle,
                      permissions: CommunityManagersPage.adminPersmissions,
                      color: CommunityCoverColors.backgroundColor(context, palette),
                    );
                    openDetails();
                  },
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(communityRadius)),
                onTap: manager.shadow?null: () async {
                  await showUpdateManagerDialog(
                      CommunityRole.ADMIN,
                      onSuccess: (){
                        if(manager.key == AccountData.key)
                          Navigator.pop(context);
                      }
                  );
                  if(mounted) Navigator.pop(context);
                },
              ),

            const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

            if(manager.key != AccountData.key)
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

  Future<void> showUpdateManagerDialog(CommunityRole newRole, {void Function()? onSuccess}) =>
    showUpdateDialog(
        context: context,
        isMe: manager.key == AccountData.key,
        loosingAdmin: newRole != CommunityRole.ADMIN,
        currAdminCount: community.loadedManagers.where((m) => m.role == CommunityRole.ADMIN).length,
        looseAdminConfMess: 'Czy na pewno chcesz zrzec się roli <b>administratora</b> środowiska <b>${community.name}</b>?',
        handleUpdate: () async {

          showLoadingWidget(context, iconEnab_(context), 'Ostatnia prosta...');

          await ApiCommunity.updateManagers(
              communityKey: community.key,
              users: [CommunityManagerUpdateBody(manager.key, role: Optional.of(newRole))],
              onSuccess: (List<CommunityManager> allManagers){
                community.setAllLoadedManagers(allManagers, context: context);
                Navigator.pop(context); // Close loading widget
                onSuccess?.call();
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
        isMe: manager.key == AccountData.key,
        loosingAdmin: manager.key == AccountData.key,
        currAdminCount: community.loadedManagers.where((m) => m.role == CommunityRole.ADMIN).length,
        removingUserTitleMess: 'Wypraszanie ogarniacza...',
        removingUserDetailMess: '${manager.name} nie będzie mieć dłużej dostępu do zarządzania środowiskiem.\n\nNa pewno chcesz ${manager.isMale?'go':'ją'} wyprosić?',
        handleRemove: () async {

          showLoadingWidget(context, CommunityCoverColors.strongColor(context, palette), 'Wypraszanie ogarniacza...');
          await ApiCommunity.removeManagers(
              communityKey: community.key,
              userKeys: [manager.key],
              onSuccess: (List<String> removedManagers) async {
                community.removeLoadedManagersByKey(removedManagers, context: context);

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
  Widget build(BuildContext context) => CommunityManagerTile(
    manager: manager,
    onTap: openDetails,
    heroTag: heroTag,
  );

}