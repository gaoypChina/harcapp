import 'package:flutter/material.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/indiv_comp_particips_provider.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_loadable_page.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:provider/provider.dart';

import '../common/particip_tile.dart';
import '../comp_role.dart';
import '../models/indiv_comp.dart';

class ParticipantsPage extends StatefulWidget{

  static String adminsHeaderTitle = 'Administratorzy';
  static String moderatorsHeaderTitle = 'Moderatorzy';
  static String obsHeaderTitle = 'Pozostali';

  static const List<String> adminPersmissions = [
    'Przyznawanie punktów',
    'Rozpatrywanie wniosków o punkty',
    'Dodawanie nowych uczestników',
    'Wyrzucanie uczestników',
    'Edycja ról uczestników',
    'Zmiana ustawień współzawodnictwa'
  ];

  static const List<String> moderatorPersmissions = [
    'Przyznawanie punktów',
    'Rozpatrywanie wniosków o punkty',
  ];

  static const List<String> obsPersmissions = [
    'Pyszna zabawa i współzawodniczenie (:'
  ];

  final IndivComp comp;

  final Widget Function(List<IndivCompParticip> particips)? adminsListHeaderTrailing;
  final Widget Function(List<IndivCompParticip> particips)? modsListHeaderTrailing;
  final Widget Function(List<IndivCompParticip> particips)? obsListHeaderTrailing;

  final Widget? floatingButton;
  final Widget? bottomNavigationBar;
  final Widget? bottom;

  const ParticipantsPage({
    required this.comp,

    this.adminsListHeaderTrailing,
    this.modsListHeaderTrailing,
    this.obsListHeaderTrailing,

    this.floatingButton,
    this.bottomNavigationBar,
    this.bottom,

    super.key});

  @override
  State<StatefulWidget> createState() => ParticipantsPageState();

}

class ParticipantsPageState extends State<ParticipantsPage>{

  IndivComp get comp => widget.comp;
  List<IndivCompParticip> get particips => comp.loadedParticips;

  late IndivCompParticipsProvider indivCompParticipsProv;

  List<IndivCompParticip> participAdmins = [];
  List<IndivCompParticip> participModerators = [];
  List<IndivCompParticip> participObservers = [];

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

  void onParticipantsProviderNotified(){
    updateUserSets();
    setState((){});
  }

  @override
  void initState() {
    indivCompParticipsProv = IndivCompParticipsProvider.of(context);
    indivCompParticipsProv.addListener(onParticipantsProviderNotified);
    updateUserSets();
    super.initState();
  }

  @override
  void dispose() {
    indivCompParticipsProv.removeListener(onParticipantsProviderNotified);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Consumer<IndivCompParticipsProvider>(
      builder: (context, prov, child) => UserListManagementLoadablePage<IndivCompParticip>(
        appBarTitle: 'Uczestnicy (${comp.participCount})',
        userSets: [
          UserSet(
              icon: compRoleToIcon(CompRole.ADMIN),
              name: 'Administratorzy',
              users: participAdmins,
              permissions: ParticipantsPage.adminPersmissions
          ),

          UserSet(
              icon: compRoleToIcon(CompRole.MODERATOR),
              name: 'Moderatorzy',
              users: participModerators,
              permissions: ParticipantsPage.moderatorPersmissions
          ),

          UserSet(
              icon: compRoleToIcon(CompRole.OBSERVER),
              name: 'Pozostali',
              users: participObservers,
              permissions: ParticipantsPage.obsPersmissions
          )
        ],
        userTileBuilder: (context, particip) =>
            ParticipTile(
                particip: particip,
                heroTag: particip
            ),

        userCount: comp.participCount,
        callReload: () async {
          await ApiIndivComp.getParticipants(
            comp: comp,
            pageSize: IndivComp.participsPageSize,
            lastRole: null,
            lastUserName: null,
            lastUserKey: null,
            onSuccess: (participsPage){
              IndivCompParticip me = comp.getParticip(AccountData.key!)!;
              participsPage.removeWhere((member) => member.key == me.key);
              participsPage.insert(0, me);
              comp.setAllLoadedParticips(participsPage, context: context);
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
          return comp.loadedParticips.length;
        },
        callLoadMore: () async {
          await ApiIndivComp.getParticipants(
            comp: comp,
            pageSize: IndivComp.participsPageSize,
            lastRole: comp.loadedParticips.length==1?null:comp.loadedParticips.last.profile.role,
            lastUserName: comp.loadedParticips.length==1?null:comp.loadedParticips.last.name,
            lastUserKey: comp.loadedParticips.length==1?null:comp.loadedParticips.last.key,
            onSuccess: (participsPage){
              comp.addLoadedParticips(participsPage, context: context);
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
          return comp.loadedParticips.length;
        },
        callLoadOnInit: comp.loadedParticips.length == 1,

      )
  );

}