import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/harc_map.dart';
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

import '../model/marker_role.dart';
import '../model/marker_data.dart';
import '../model/marker_manager.dart';
import 'manager_header_widget.dart';
import 'manager_tile.dart';
import 'managers_page.dart';

class MarkerManagerTileExtended extends StatefulWidget{

  final MarkerData marker;
  final MarkerManager manager;
  final dynamic heroTag;

  const MarkerManagerTileExtended({
    required this.marker,
    required this.manager,
    this.heroTag,
    super.key
  });

  @override
  State<StatefulWidget> createState() => MarkerManagerTileExtendedState();

}

class MarkerManagerTileExtendedState extends State<MarkerManagerTileExtended>{

  MarkerData get marker => widget.marker;
  MarkerManager get manager => widget.manager;

  get heroTag => widget.heroTag;

  void openDetails() => showScrollBottomSheet(
      context: context,
      builder: (context) => BottomSheetDef(
        builder: (context) => Column(
          children: [

            ManagerHeaderWidget(
              manager,
              heroTag: manager.key
            ),

            const SizedBox(height: 2*24.0),

            ListTile(
              leading: const SizedBox(width: Dimen.ICON_SIZE),
              title: Text('Edytuj rolę ogarniacza', style: AppTextStyle(color: hintEnab_(context))),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(communityRadius)),
            ),

            if(manager.role == MarkerRole.ADMIN)
              ListTile(
                enabled: !manager.shadow,
                leading: Icon(markerRoleToIcon[MarkerRole.COMMUNITY_MODERATOR]),
                title: Text('Nadaj rolę przedstawiciela środowisk', style: AppTextStyle()),
                trailing: IconButton(
                  icon: Icon(MdiIcons.informationOutline, color: iconEnab_(context)),
                  onPressed: () async {
                    Navigator.pop(context);
                    await UserListManagementLoadablePage.openPermissionsDialog(
                      context: context,
                      icon: markerRoleToIcon[MarkerRole.COMMUNITY_MODERATOR]!,
                      title: MarkerManagersPage.regularsHeaderTitle,
                      permissions: MarkerManagersPage.regularPersmissions,
                    );
                    openDetails();
                  },
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(communityRadius)),
                onTap: manager.shadow?null: () async {
                  await showUpdateManagerDialog(
                      MarkerRole.COMMUNITY_MODERATOR,
                      onSuccess: (){
                        if(manager.key == AccountData.key)
                          Navigator.pop(context);
                      }
                  );

                  if(mounted) Navigator.pop(context);

                },
              ),

            if(manager.role ==MarkerRole.COMMUNITY_MODERATOR)
              ListTile(
                enabled: !manager.shadow,
                leading: Icon(markerRoleToIcon[MarkerRole.COMMUNITY_MODERATOR]),
                title: Text('Nadaj rolę administratora', style: AppTextStyle()),
                trailing: IconButton(
                  icon: Icon(MdiIcons.informationOutline, color: iconEnab_(context)),
                  onPressed: () async {
                    Navigator.pop(context);
                    await UserListManagementLoadablePage.openPermissionsDialog(
                      context: context,
                      icon: markerRoleToIcon[MarkerRole.ADMIN]!,
                      title: MarkerManagersPage.adminsHeaderTitle,
                      permissions: MarkerManagersPage.adminPersmissions,
                    );
                    openDetails();
                  },
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(communityRadius)),
                onTap: manager.shadow?null: () async {
                  await showUpdateManagerDialog(
                      MarkerRole.ADMIN,
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

  Future<void> showUpdateManagerDialog(MarkerRole newRole, {void Function()? onSuccess}) =>
    showUpdateDialog(
        context: context,
        isMe: manager.key == AccountData.key,
        loosingAdmin: newRole != MarkerRole.ADMIN,
        currAdminCount: marker.managers.where((m) => m.role == MarkerRole.ADMIN).length,
        looseAdminConfMess: 'Czy na pewno chcesz zrzec się roli <b>administratora</b> środowiska <b>${marker.name}</b>?',
        handleUpdate: () async {

          showLoadingWidget(context, iconEnab_(context), 'Ostatnia prosta...');

          await ApiHarcMap.updateManagers(
              markerKey: marker.key,
              users: [MarkerManagerUpdateBody(manager.key, role: Optional.of(newRole))],
              onSuccess: (List<MarkerManager> allManagers){
                marker.setAllManagers(allManagers, context: context);
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
                showAppToast(context, text: 'Coś tu poszło nie tak...');
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
        currAdminCount: marker.managers.where((m) => m.role == MarkerRole.ADMIN).length,
        removingUserTitleMess: 'Wypraszanie ogarniacza...',
        removingUserDetailMess: '${manager.name} nie będzie mieć dłużej dostępu do zarządzania forum.\n\nNa pewno chcesz ${manager.isMale?'go':'ją'} wyprosić?',
        handleRemove: () async {

          showLoadingWidget(context, iconEnab_(context), 'Wypraszanie ogarniacza...');
          await ApiHarcMap.removeManagers(
              markerKey: marker.key,
              userKeys: [manager.key],
              onSuccess: (List<String> removedManagers) async {
                marker.removeManagersByKey(removedManagers, context: context);

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
                showAppToast(context, text: 'Coś tu poszło nie tak...');
                await popPage(context);
              }
          );

        }
    );

  }

  @override
  Widget build(BuildContext context) => MarkerManagerTile(
    manager: manager,
    onTap: openDetails,
    heroTag: heroTag,
  );

}