import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/_new/cat_page_home/community/circle/members_page/member_tile_extended.dart';
import 'package:harcapp/_new/cat_page_home/community/circle/model/member.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_loadable_page.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

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

  List<Member> memberAdmins = [];
  List<Member> memberEditors = [];
  List<Member> memberObservers = [];

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
    setState((){});
  }

  @override
  void initState() {
    circleMembersProv = CircleMembersProvider.of(context);
    circleMembersProv.addListener(onMembersProviderNotified);
    updateUserSets();
    super.initState();
  }

  @override
  void dispose() {
    circleMembersProv.removeListener(onMembersProviderNotified);
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
                icon: const Icon(MdiIcons.plus),
                onPressed: () => showScrollBottomSheet(
                    context: context,
                    builder: (_) => AddUserBottomSheet(circle, palette, context: context)
                )
            )
        ],

        userCount: circle.memberCount,
        callReload: () async {
          await ApiCircle.getMembers(
            circleKey: circle.key,
            pageSize: Circle.memberPageSize,
            lastRole: null,
            lastUserName: null,
            lastUserKey: null,
            onSuccess: (membersPage){
              Member me = circle.loadedMembersMap[AccountData.key]!;
              membersPage.removeWhere((member) => member.key == me.key);
              membersPage.insert(0, me);
              circle.setAllLoadedMembers(membersPage, context: context);
              updateUserSets();
              if(mounted) setState((){});
            },
            onForceLoggedOut: (){
              if(!mounted) return true;
              showAppToast(context, text: forceLoggedOutMessage);
              setState(() {});
              return true;
            },
            onServerMaybeWakingUp: (){
              if(!mounted) return true;
              showServerWakingUpToast(context);
              return true;
            },
            onError: (){
              if(!mounted) return;
              showAppToast(context, text: simpleErrorMessage);
            },
          );
          return circle.loadedMembers.length;
        },
        callLoadMore: () async {
          await ApiCircle.getMembers(
            circleKey: circle.key,
            pageSize: Circle.memberPageSize,
            lastRole: circle.loadedMembers.length==1?null:circle.loadedMembers.last.role,
            lastUserName: circle.loadedMembers.length==1?null:circle.loadedMembers.last.name,
            lastUserKey: circle.loadedMembers.length==1?null:circle.loadedMembers.last.key,
            onSuccess: (membersPage){
              circle.addLoadedMembers(membersPage, context: context);
              updateUserSets();
              setState((){});
            },
            onForceLoggedOut: (){
              if(!mounted) return true;
              showAppToast(context, text: forceLoggedOutMessage);
              setState(() {});
              return true;
            },
            onServerMaybeWakingUp: (){
              if(!mounted) return true;
              showServerWakingUpToast(context);
              return true;
            },
            onError: (){
              if(!mounted) return;
              showAppToast(context, text: simpleErrorMessage);
            },
          );
          return circle.loadedMembers.length;
        },
        callLoadOnInit: circle.loadedMembers.length == 1,

      )
  );

}
