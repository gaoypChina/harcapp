import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/forum.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/model/forum_manager.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/search_user_dialog.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:optional/optional_internal.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../forum_role.dart';
import '../../model/forum.dart';
import 'manager_header_widget.dart';
import 'manager_tile.dart';
import 'managers_page_templ.dart';

class ManagersAdminPage extends StatefulWidget{

  final Forum forum;
  final PaletteGenerator? palette;

  const ManagersAdminPage(this.forum, this.palette, {super.key});

  @override
  State<StatefulWidget> createState() => ManagersAdminPageState();

}

class ManagersAdminPageState extends State<ManagersAdminPage>{

  Forum get forum => widget.forum;
  PaletteGenerator? get palette => widget.palette;

  late List<ForumManager?> selectedManagers;

  void onManagerProviderNotified() => setState((){});

  @override
  void initState() {

    ForumManagersProvider.addOnNotifyListener(onManagerProviderNotified);
    selectedManagers = [];

    super.initState();
  }

  @override
  void dispose() {
    ForumManagersProvider.removeOnNotifyListener(onManagerProviderNotified);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
    children: [

      MembersPageTempl(
        forum: forum,
        palette: palette,

        adminsListHeaderTrailing: (managerAdmins) => IconButton(
          icon: const Icon(MdiIcons.selectMultiple),
          onPressed: (){

            bool allSelected = true;
            for(ForumManager mem in managerAdmins)
              if(!selectedManagers.contains(mem)){
                allSelected = false;
                break;
              }

            if(allSelected)
              for(ForumManager mem in managerAdmins)
                selectedManagers.remove(mem);
            else
              for(ForumManager mem in managerAdmins)
                if(!selectedManagers.contains(mem)) selectedManagers.add(mem);

            setState(() {});

          },
        ),

        editorsListHeaderTrailing: (managerEditors) => IconButton(
          icon: const Icon(MdiIcons.selectMultiple),
          onPressed: (){

            bool allSelected = true;
            for(ForumManager m in managerEditors)
              if(!selectedManagers.contains(m)){
                allSelected = false;
                break;
              }

            if(allSelected)
              for(ForumManager m in managerEditors)
                selectedManagers.remove(m);
            else
              for(ForumManager m in managerEditors)
                if(!selectedManagers.contains(m)) selectedManagers.add(m);

            setState(() {});

          },
        ),
        
        customAppBar:
        selectedManagers.isEmpty?
        SliverAppBar(
          title: const Text('Lista ogarniaczy'),
          centerTitle: true,
          floating: true,
          backgroundColor: CommunityCoverColors.appBarColor(context, palette),
          actions: [
            if(forum.myRole == ForumRole.ADMIN)
              IconButton(
                  icon: const Icon(MdiIcons.plus),
                  onPressed: () async {
                    if(!await isNetworkAvailable()){
                      showAppToast(context, text: 'Brak dostępu do Internetu');
                      return;
                    }

                    UserDataNick? userData = await openSearchUserDialog(
                        context,
                        title: 'Dodaj uczestnika',
                        illegalUserKeys: forum.managers.map((m) => m.key).toList(),
                        illegalAttemptMessage: 'Że niby chcesz dodać kogoś po raz drugi?'
                    );

                    if(userData == null) return;

                    addManager(context, userData);
                  }
              )
          ],
        ):
        SelectedAppBar(
          forum,
          selectedManagers,
          backgroundColor: CommunityCoverColors.appBarColor(context, palette),
          onSelectAll: () => setState((){
            selectedManagers.clear();
            selectedManagers.addAll(forum.managers);
          }),
          onUnselectAll: () => setState(() => selectedManagers.clear()),
        ),

        itemBuilder: (context, member) => _ManagerTile(
          forum,
          palette,
          member,

          anythingSelected: selectedManagers.isNotEmpty,
          selected: selectedManagers.contains(member),

          onSelectionTap: (){
            if(selectedManagers.contains(member))
              setState(() => selectedManagers.remove(member));
            else
              setState(() => selectedManagers.add(member));
          },

          heroTag: member,
        ),

      ),

      if(forum.managers.length == 1 && selectedManagers.isEmpty)
        Positioned(
            left: 2*Dimen.SIDE_MARG,
            right: 2*Dimen.SIDE_MARG,
            bottom: kBottomNavigationBarHeight + 2*Dimen.SIDE_MARG,
            child: Material(
              color: Colors.transparent,
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(MdiIcons.accountMultiple, size: 48.0, color: backgroundIcon_(context)),
                      const SizedBox(width: Dimen.DEF_MARG),
                      Icon(MdiIcons.accountPlus, size: 68.0, color: backgroundIcon_(context)),
                      const SizedBox(width: Dimen.DEF_MARG+8),

                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(pi),
                        child: Icon(MdiIcons.accountMultiple, size: 48.0, color: backgroundIcon_(context)),
                      )

                    ],
                  ),

                  //SizedBox(height: Dimen.SIDE_MARG),

                  AppText(
                    'Wybierz <b>+</b> w górnym prawym rogu, by <b>dodać ogarniaczy</b> do forum',
                    color: hintEnab_(context),
                    size: Dimen.TEXT_SIZE_APPBAR,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
        )

    ],
  );

  void addManager(BuildContext context, UserDataNick userData) async {

    showLoadingWidget(context, CommunityCoverColors.strongColor(context, palette), 'Dodawanie uczestnika');

    await ApiForum.addManagers(
        forumKey: forum.key,
        users: [ManagerRespBodyNick(userData.key, ForumRole.EDITOR, userData.nick)],
        onSuccess: (List<ForumManager> allManagers){
          forum.setAllManagers(context, allManagers);
          Navigator.pop(context);
          Navigator.pop(context);
          showAppToast(context, text: '${userData.name} ${userData.isMale?'dodany':'dodana'}.');
        },
        onServerMaybeWakingUp: () {
          showServerWakingUpToast(context);
          return true;
        },
        onError: (){
          Navigator.pop(context);
          showAppToast(context, text: simpleErrorMessage);
        }
    );

  }

}

class SelectedAppBar extends SliverAppBar{

  final Forum? forum;
  final List<ForumManager?> selectedManagers;

  @override
  final Color? backgroundColor;

  final void Function()? onSelectAll;
  final void Function()? onUnselectAll;

  SelectedAppBar(this.forum, this.selectedManagers, {Key? key, this.backgroundColor, this.onSelectAll, this.onUnselectAll}):super(key: key,
    leadingWidth: Dimen.APPBAR_LEADING_WIDTH + Dimen.ICON_FOOTPRINT,
    leading: Row(
      children: [
        SizedBox(
          width: Dimen.APPBAR_LEADING_WIDTH,
          child: IconButton(
              icon: const Icon(MdiIcons.close),
              onPressed: onUnselectAll
          ),
        ),

      ],
    ),
    title: Text('Zaznaczono: ${selectedManagers.length}'),
    centerTitle: true,
    floating: true,
    pinned: true,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 2*Dimen.DEF_MARG),
        child: IconButton(
            icon: const Icon(MdiIcons.selectMultiple),
            onPressed: onSelectAll
        ),
      )
    ],
  );


}

class _ManagerTile extends StatefulWidget{

  final Forum forum;
  final PaletteGenerator? palette;
  final ForumManager manager;
  final bool anythingSelected;
  final bool selected;
  final void Function()? onSelectionTap;
  final dynamic heroTag;

  const _ManagerTile(
      this.forum,
      this.palette,
      this.manager,
      { required this.anythingSelected,
        this.selected=false,
        this.onSelectionTap,
        this.heroTag,
        super.key
      });

  @override
  State<StatefulWidget> createState() => _ManagerTileState();

}

class _ManagerTileState extends State<_ManagerTile>{

  Forum? get forum => widget.forum;
  PaletteGenerator? get palette => widget.palette;
  ForumManager get manager => widget.manager;

  bool get anythingSelected => widget.anythingSelected;
  bool get selected => widget.selected;
  void Function()? get onSelectionTap => widget.onSelectionTap;

  get heroTag => widget.heroTag;

  void openParticipantDetails() => showScrollBottomSheet(
      context: context,
      builder: (context) => BottomSheetDef(
        color: CommunityCoverColors.backgroundColor(context, palette),
        builder: (context) => Column(
          children: [

            ManagerHeaderWidget(
                manager.name,
                manager.shadow,
                manager.role,
                thumbnailColor: CommunityCoverColors.backgroundColor(context, palette),
                thumbnailBorderColor: CommunityCoverColors.cardColor(context, palette),
                heroTag: manager.key),

            const SizedBox(height: 2*24.0),

            ListTile(
              leading: const SizedBox(width: Dimen.ICON_SIZE),
              title: Text('Edytuj rolę ogarniacza', style: AppTextStyle(color: hintEnab_(context)))
            ),

            if(manager.role == ForumRole.ADMIN)
              ListTile(
                enabled: !manager.shadow,
                leading: Icon(forumRoleToIcon[ForumRole.EDITOR], color: iconEnab_(context)),
                title: Text('Nadaj rolę redaktora', style: AppTextStyle()),
                onTap: manager.shadow?null: () async {
                  await showUpdateRoleDialog(
                    ForumRole.EDITOR,
                    onSuccess: (){
                      if(manager.key == AccountData.key)
                        Navigator.pop(context);
                    }
                  );

                  Navigator.pop(context);

                },
              ),

            if(manager.role == ForumRole.EDITOR)
              ListTile(
                enabled: !manager.shadow,
                leading: Icon(forumRoleToIcon[ForumRole.ADMIN], color: iconEnab_(context)),
                title: Text('Nadaj rolę administratora', style: AppTextStyle()),
                onTap: manager.shadow?null: () async {
                  await showUpdateRoleDialog(
                      ForumRole.ADMIN,
                      onSuccess: (){
                        if(manager.key == AccountData.key)
                          Navigator.pop(context);
                      }
                  );
                  Navigator.pop(context);
                },
              ),

            const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

            ListTile(
              leading: const Icon(MdiIcons.logoutVariant, color: Colors.red),
              title: Text('Wyproś ogarniacza', style: AppTextStyle(color: Colors.red)),
              onTap: () => showRemoveDialog([manager], forum!.managers)
            ),

          ],
        ),
      )
  );

  Future<void> showUpdateRoleDialog(ForumRole newRole, {void Function()? onSuccess}) async {
    bool close = false;

    if(manager.key == AccountData.key && newRole != ForumRole.ADMIN)
      await showAlertDialog(
        context,
        title: 'Chwileczkę!',
        content: 'Czy na pewno chcesz zrzec się roli <b>administratora</b> kręgu <b>${forum!.name}</b>?',
        actionBuilder: (context) => [
          AlertDialogButton(
            text: 'Tak',
            onTap: () => Navigator.pop(context)
          ),
          AlertDialogButton(
            text: 'Nie',
            onTap: (){
              close = true;
              Navigator.pop(context);
            },
          ),
        ],
      );

    if(close) return;

    showLoadingWidget(context, iconEnab_(context), 'Ostatnia prosta...');

    await ApiForum.updateManagers(
        forumKey: forum!.key,
        users: [ManagerUpdateBody(manager.key, role: Optional.of(newRole))],
        onSuccess: (List<ForumManager> allManagers){
          forum!.setAllManagers(context, allManagers);
          Navigator.pop(context);
          onSuccess?.call();
        },
        onServerMaybeWakingUp: () {
          if(mounted) showServerWakingUpToast(context);
          return true;
        },
        onError: (){
          if(!mounted) return;
          showAppToast(context, text: 'Coś tu poszło nie tak...');
          Navigator.pop(context);
        }
    );
  }

  Future<void> showRemoveDialog(List<ForumManager> managersToRemove, List<ForumManager> allManagers) async {

    if(!await isNetworkAvailable()){
      showAppToast(context, text: 'Brak dostępu do Internetu');
      return;
    }

    int allAdminCount = 0;
    int remAdminCount = 0;
    for(ForumManager? m in allManagers) if(m!.role == ForumRole.ADMIN) allAdminCount++;
    for(ForumManager m in managersToRemove) if(m.role == ForumRole.ADMIN) remAdminCount++;

    if(allAdminCount == remAdminCount){
      await showAlertDialog(
          context,
          title: 'Hola, hola...',
          content: 'Zamierzasz usunąć ostatniego administratora?\n\nTak nie wolno.',
          actionBuilder: (context) => [
            AlertDialogButton(
                text: 'No dobrze',
                onTap: () => Navigator.pop(context)
            )
          ]
      );
      return;
    }

    bool plural;

    String managersString = '';
    if(managersToRemove.isEmpty)
      return;
    else if(managersToRemove.length == 1) {
      managersString = managersToRemove[0].name;
      plural = false;
    }else {
      managersString = '${managersToRemove.length} ogarniaczy';
      plural = true;
    }

    await showAlertDialog(
        context,
        title: 'Wypraszanie ${plural?'ogarniaczy':'ogarniacza'}...',
        content: '$managersString nie będzie mieć dłużej dostępu do zarządzania forum.\n\nNa pewno chcesz ${plural?'ich':'go'} wyprosić?',
        actionBuilder: (_context) => [

          AlertDialogButton(
              text: 'Nie',
              onTap: () => Navigator.pop(_context)
          ),

          AlertDialogButton(
              text: 'Tak',
              onTap: () async {
                Navigator.pop(context);
                Navigator.pop(context);

                showLoadingWidget(context, CommunityCoverColors.strongColor(context, palette), 'Wypraszanie ${plural?'ogarniaczy':'ogarniacza'}...');
                await ApiForum.removeManagers(
                    forumKey: forum!.key,
                    userKeys: managersToRemove.map((p) => p.key).toList(),
                    onSuccess: (List<String> removedManagers) async {
                      forum!.removeManagersByKey(context, removedManagers);

                      if(!mounted) return;
                      showAppToast(context, text: 'Wyproszono');
                      await popPage(context);
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
          )
        ]
    );

  }

  @override
  Widget build(BuildContext context) => ManagerTile(
    userKey: manager.key,
    name: manager.name,
    shadow: manager.shadow,
    role: manager.role,
    anythingSelected: anythingSelected,
    selected: selected,
    selectedColor: CommunityCoverColors.cardColor(context, palette),
    selectedTextColor: CommunityCoverColors.strongColor(context, palette),
    thumbnailColor: CommunityCoverColors.backgroundColor(context, palette),
    thumbnailBorderColor: CommunityCoverColors.cardColor(context, palette),
    onLongPress: onSelectionTap,
    onTap: anythingSelected?onSelectionTap:(forum!.myRole == ForumRole.ADMIN?openParticipantDetails:null),
    heroTag: heroTag,
  );

}
