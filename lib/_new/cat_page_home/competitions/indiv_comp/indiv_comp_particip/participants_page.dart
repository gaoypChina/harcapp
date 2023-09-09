import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/indiv_comp_particips_provider.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_loadable_page.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../common/particip_tile.dart';
import '../comp_role.dart';
import '../indiv_comp_participants_loader.dart';
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
  late IndivCompParticipantsLoaderListener participsLoaderListener;

  List<IndivCompParticip> participAdmins = [];
  List<IndivCompParticip> participModerators = [];
  List<IndivCompParticip> participObservers = [];

  late RefreshController controller;

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
    if(mounted) setState((){});
  }

  @override
  void initState() {

    IndivCompProvider indivCompProv = IndivCompProvider.of(context);
    IndivCompListProvider indivCompListProv = IndivCompListProvider.of(context);

    participsLoaderListener = IndivCompParticipantsLoaderListener(
      onNoInternet: (){
        if(!mounted) return;
        showAppToast(context, text: noInternetMessage);
      },
      onParticipantsLoaded: (participsPage, reloaded){
        updateUserSets();
        IndivComp.callProvidersWithParticips(indivCompProv, indivCompListProv, indivCompParticipsProv);
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

    indivCompParticipsProv = IndivCompParticipsProvider.of(context);
    indivCompParticipsProv.addListener(onParticipantsProviderNotified);

    comp.addParticipLoaderListener(participsLoaderListener);
    updateUserSets();

    controller = RefreshController(
      initialRefresh: comp.loadedParticips.length == 1 && comp.participCount > 1 && !comp.isParticipsLoading(),
    );
    post((){
      // `initialRefreshStatus` and `initialLoadStatus` in RefreshController don't work.
      if(comp.loadedParticips.length == 1 && comp.isParticipsLoading())
        controller.headerMode!.value = RefreshStatus.refreshing;
      if(comp.loadedParticips.length > 1 && comp.isParticipsLoading())
        controller.footerMode!.value = LoadStatus.loading;
    });

    super.initState();
  }

  @override
  void dispose() {
    indivCompParticipsProv.removeListener(onParticipantsProviderNotified);
    comp.removeParticipLoaderListener(participsLoaderListener);
    controller.dispose();
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
          await comp.reloadParticipsPage(awaitFinish: true);
          return comp.loadedParticips.length;
        },
        callLoadMore: () async {
          await comp.loadParticipsPage(awaitFinish: true);
          return comp.loadedParticips.length;
        },
        controller: controller,
      )
  );

}