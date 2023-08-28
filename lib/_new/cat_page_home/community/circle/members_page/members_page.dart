import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_home/community/circle/members_page/member_tile_extended.dart';
import 'package:harcapp/_new/cat_page_home/community/circle/model/member.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_loadable_page.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../circle_members_loader.dart';
import '../circle_role.dart';
import '../model/circle.dart';
import 'add_user_bottom_sheet.dart';
import 'member_tile.dart';

class MembersPage extends StatefulWidget{

  static String adminsHeaderTitle = 'Administratorzy';
  static String editorsHeaderTitle = 'Redaktorzy';
  static String observersHeaderTitle = 'Obserwatorzy';

  static List<String> adminPersmissions = [
    'Dodawanie ogłoszeń',
    'Dodawanie nowych uczestników',
    'Wyrzucanie uczestników',
    'Edycja ról uczestników',
    'Zmiana ustawień kręgu'
  ];

  static List<String> editorPersmissions = [
    'Dodawanie ogłoszeń',
  ];

  static List<String> observerPersmissions = [
    'Śledzenie wiadomości (:',
  ];

  final Circle circle;
  final PaletteGenerator? palette;

  final Widget Function(List<Member> members)? adminsListHeaderTrailing;
  final Widget Function(List<Member> members)? modsListHeaderTrailing;
  final Widget Function(List<Member> members)? obsListHeaderTrailing;

  final Widget? floatingButton;
  final Widget? bottomNavigationBar;
  final Widget? bottom;

  const MembersPage({
    required this.circle,
    required this.palette,

    this.adminsListHeaderTrailing,
    this.modsListHeaderTrailing,
    this.obsListHeaderTrailing,

    this.floatingButton,
    this.bottomNavigationBar,
    this.bottom,

    super.key});

  @override
  State<StatefulWidget> createState() => MembersPageState();

}

class MembersPageState extends State<MembersPage>{
  
  Circle get circle => widget.circle;
  PaletteGenerator? get palette => widget.palette;
  List<Member> get members => circle.loadedMembers;

  late CircleMembersProvider circleMembersProv;
  late CircleMembersLoaderListener membersLoaderListener;

  List<Member> memberAdmins = [];
  List<Member> memberEditors = [];
  List<Member> memberObservers = [];

  late RefreshController controller;

  void updateUserSets(){
    memberAdmins.clear();
    memberEditors.clear();
    memberObservers.clear();
    for(Member member in members) {
      switch(member.role){
        case CircleRole.ADMIN:
          memberAdmins.add(member);
          break;
        case CircleRole.EDITOR:
          memberEditors.add(member);
          break;
        case CircleRole.OBSERVER:
          memberObservers.add(member);
          break;
      }
    }
  }

  void onMembersProviderNotified(){
    updateUserSets();
    if(mounted) setState((){});
  }

  @override
  void initState() {

    CircleProvider circleProv = CircleProvider.of(context);
    CircleListProvider circleListProv = CircleListProvider.of(context);

    membersLoaderListener = CircleMembersLoaderListener(
      onNoInternet: (){
        if(!mounted) return;
        showAppToast(context, text: noInternetMessage);
      },
      onMembersLoaded: (usersPage, reloaded){
        updateUserSets();
        Circle.callProvidersWithMembers(circleProv, circleListProv, circleMembersProv);
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
    
    circleMembersProv = CircleMembersProvider.of(context);
    circleMembersProv.addListener(onMembersProviderNotified);

    circle.addMembersLoaderListener(membersLoaderListener);
    updateUserSets();

    controller = RefreshController(
      initialRefresh: circle.loadedMembers.length == 1 && !circle.isMembersLoading(),
    );
    post((){
      // `initialRefreshStatus` and `initialLoadStatus` in RefreshController don't work.
      if(!mounted) return;
      if(circle.loadedMembers.length == 1 && circle.isMembersLoading())
        controller.headerMode!.value = RefreshStatus.refreshing;
      if(circle.loadedMembers.length > 1 && circle.isMembersLoading())
        controller.footerMode!.value = LoadStatus.loading;
    });

    super.initState();
  }

  @override
  void dispose() {
    circleMembersProv.removeListener(onMembersProviderNotified);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Consumer<CircleMembersProvider>(
      builder: (context, prov, child) => UserListManagementLoadablePage<Member>(
        appBarTitle: 'Członkowie (${circle.memberCount})',
        userSets: [
          UserSet(
              icon: circleRoleToIcon[CircleRole.ADMIN]!,
              name: MembersPage.adminsHeaderTitle,
              users: memberAdmins,
              permissions: MembersPage.adminPersmissions
          ),

          UserSet(
              icon: circleRoleToIcon[CircleRole.EDITOR]!,
              name: MembersPage.editorsHeaderTitle,
              users: memberEditors,
              permissions: MembersPage.editorPersmissions
          ),

          UserSet(
              icon: circleRoleToIcon[CircleRole.OBSERVER]!,
              name: MembersPage.observersHeaderTitle,
              users: memberObservers,
              permissions: MembersPage.observerPersmissions
          )
        ],
        userTileBuilder: (context, member) => circle.myRole == CircleRole.ADMIN?
        MemberTileExtended(
            circle: circle,
            member: member,
            palette: palette,
            heroTag: member
        ):
        MemberTile(
            member: member,
            palette: palette,
            heroTag: member
        ),

        strongColor: CommunityCoverColors.strongColor(context, palette),
        backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
        appBottomNavColor: CommunityCoverColors.backgroundColor(context, palette),

        appBarActions: [
          if(circle.myRole == CircleRole.ADMIN)
            IconButton(
                icon: Icon(MdiIcons.plus),
                onPressed: () => showScrollBottomSheet(
                    context: context,
                    builder: (_) => AddUserBottomSheet(circle, palette, context: context)
                )
            )
        ],

        userCount: circle.memberCount,
        callReload: () async {
          await circle.reloadMembersPage(awaitFinish: true);
          return circle.loadedMembers.length;
        },
        callLoadMore: () async {
          await circle.loadMembersPage(awaitFinish: true);
          return circle.loadedMembers.length;
        },
        controller: controller,

      )
  );

}
