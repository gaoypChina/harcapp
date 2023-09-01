import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/paging_loadable_page/paging_loadable_base_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_users_loader.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_users_page/trop_user_tile.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import 'model/trop.dart';
import 'model/trop_user.dart';


class LoadableTropUserSelector extends StatefulWidget{

  final Trop trop;
  final void Function(TropUser)? onUserSelected;

  const LoadableTropUserSelector(this.trop, {required this.onUserSelected, super.key});

  @override
  State<StatefulWidget> createState() => LoadableTropUserSelectorState();

}

class LoadableTropUserSelectorState extends State<LoadableTropUserSelector>{

  Trop get trop => widget.trop;
  void Function(TropUser)? get onUserSelected => widget.onUserSelected;

  late TropUsersLoaderListener usersLoaderListener;

  late RefreshController controller;

  @override
  void initState() {

    TropProvider tropProv = TropProvider.of(context);
    TropListProvider tropListProv = TropListProvider.of(context);
    TropLoadedUsersProvider tropUsersProv = TropLoadedUsersProvider.of(context);

    usersLoaderListener = TropUsersLoaderListener(
        onNoInternet: (){
          if(!mounted) return;
          showAppToast(context, text: noInternetMessage);
        },
        onUsersLoaded: (usersPage, reloaded){
          Trop.callProvidersWithLoadedUsers(tropProv, tropListProv, tropUsersProv);
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

    trop.addUsersLoaderListener(usersLoaderListener);

    controller = RefreshController(
      initialRefresh: trop.loadedUsers.length == 1 && !trop.isUsersLoading(),
    );
    post((){
      // `initialRefreshStatus` and `initialLoadStatus` in RefreshController don't work.
      if(!mounted) return;
      if(trop.loadedUsers.length == 1 && trop.isUsersLoading())
        controller.headerMode!.value = RefreshStatus.refreshing;
      if(trop.loadedUsers.length > 1 && trop.isUsersLoading())
        controller.footerMode!.value = LoadStatus.loading;
    });
    super.initState();
  }

  @override
  void dispose() {
    trop.removeUsersLoaderListener(usersLoaderListener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PagingLoadableBaseWidget(
      loadingIndicatorColor: AppColors.zhpTropColor,

      totalItemsCount: trop.userCount,
      loadedItemsCount: trop.loadedUsers.length,
      callReload: () async {

        if(trop.key == null){
          logger.e("Registered a failed attempt to call `getUsers` on trop with no trop key.");
          return trop.assignedUsers.length + trop.loadedUsers.length;
        }

        await trop.reloadUsersPage(awaitFinish: true);
        return trop.loadedUsers.length;
      },
      callLoadMore: () async {

        if(trop.key == null){
          logger.e("Registered a failed attempt to call `getUsers` on trop with no trop key.");
          return trop.loadedUsers.length;
        }

        await trop.loadUsersPage(awaitFinish: true);
        return trop.loadedUsers.length;
      },
      controller: controller,

    sliversBuilder: (context, isLoading, innerScrollViewKey) => [

      const SliverAppBar(
        floating: true,
        title: Text('Wybierz ogarniacza'),
        centerTitle: true,
      ),

      Container(
          key: innerScrollViewKey,
          child: SliverList(delegate: SliverChildBuilderDelegate(
                  (context, index) => TropUserTile(
                user: trop.loadedUsers[index],
                onTap: () => onUserSelected?.call(trop.loadedUsers[index]),
              ),
              childCount: trop.loadedUsers.length
          )),
      )

    ],

  );

}

Future<TropUser?> selectTropUser({
  required BuildContext context,
  required Trop trop,
}) async {

  TropUser? selected;

  await openDialog(
  context: context,
  builder: (context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.defMarg),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: background_(context),
        borderRadius: BorderRadius.circular(AppCard.bigRadius),
        child: LoadableTropUserSelector(
            trop,
            onUserSelected: (user){
              selected = user;
              Navigator.pop(context);
            }
        ),
      ),
    ),
  )
  );

  return selected;

}