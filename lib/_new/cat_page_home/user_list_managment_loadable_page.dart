import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserSet<T extends UserData>{

  final IconData? icon;
  final String? name;
  final List<T> users;
  final List<String> permissions;

  const UserSet({required this.icon, required this.name, required this.users, required this.permissions});

}

class UserListManagementLoadablePage<T extends UserData> extends StatefulWidget{

  final List<UserSet<T>> userSets;
  final Widget Function(BuildContext, T) userTileBuilder;

  final Color? strongColor;
  final Color? backgroundColor;
  final Color? appBottomNavColor;
  final String appBarTitle;
  final Widget? appBarLeading;
  final List<Widget>? appBarActions;
  final Widget Function(BuildContext, UserSet<T>)? headerTrailing;
  final bool showIfEmpty;
  final Widget? bottom;
  final Widget? bottomNavigationBar;
  
  final int userCount;
  final FutureOr<void> Function() callReload;
  final FutureOr<bool> Function() callLoadMore;
  final bool callLoadOnInit;

  const UserListManagementLoadablePage({
    required this.userSets,
    required this.userTileBuilder,

    this.strongColor,
    this.backgroundColor,
    this.appBottomNavColor,
    this.appBarTitle = 'Lista ludzi',
    this.appBarLeading,
    this.appBarActions,
    this.headerTrailing,
    this.showIfEmpty = false,
    this.bottom,

    this.bottomNavigationBar,

    required this.userCount,
    required this.callReload,
    required this.callLoadMore,
    required this.callLoadOnInit,

    super.key
  });

  @override
  State<StatefulWidget> createState() => UserListManagementLoadablePageState<T>();

  static Future<void> openPermissionsDialog({
    required BuildContext context,
    required IconData icon,
    required String title,
    required List<String> permissions,
    Color? color,
  }) => openDialog(
      context: context,
      builder: (context) => PermissionsDialog(
        icon: icon,
        title: title,
        permissions: permissions,
        color: color,
      )
  );

}

class UserListManagementLoadablePageState<T extends UserData> extends State<UserListManagementLoadablePage<T>>{

  List<UserSet<T>> get userSets => widget.userSets;
  Widget Function(BuildContext, T) get userTileBuilder => widget.userTileBuilder;

  Color? get strongColor => widget.strongColor;
  Color? get backgroundColor => widget.backgroundColor;
  Color? get appBottomNavColor => widget.appBottomNavColor;
  String get appBarTitle => widget.appBarTitle;
  Widget? get appBarLeading => widget.appBarLeading;
  List<Widget>? get appBarActions => widget.appBarActions;
  Widget Function(BuildContext, UserSet<T>)? get headerTrailing => widget.headerTrailing;
  bool get showIfEmpty => widget.showIfEmpty;
  Widget? get bottom => widget.bottom;
  Widget? get bottomNavigationBar => widget.bottomNavigationBar;

  int get userCount => widget.userCount;
  FutureOr<void> Function() get callReload => widget.callReload;
  FutureOr<bool> Function() get callLoadMore => widget.callLoadMore;
  bool get callLoadOnInit => widget.callLoadOnInit;

  late RefreshController refreshController;
  
  bool get moreToLoad{
    int allLoaded = 0;
    for(UserSet userSet in userSets)
      allLoaded += userSet.users.length;
      
    return allLoaded < userCount;
  }

  @override
  void initState() {
    refreshController = RefreshController(
        initialLoadStatus: callLoadOnInit?LoadStatus.loading:LoadStatus.idle
    );
    if(callLoadOnInit)
      onLoading();

    super.initState();
  }

  void onLoading() async {

    if(!moreToLoad) {
      refreshController.loadComplete();
      return;
    }

    if(!await isNetworkAvailable()){
      showAppToast(context, text: 'Brak dostępu do Internetu');
      refreshController.loadComplete();
      return;
    }

    bool success = await callLoadMore.call();

    refreshController.loadComplete();

  }

  @override
  Widget build(BuildContext context){

    List<Widget> userSetWidgets = [];

    for(UserSet<T> userSet in userSets)
      if(userSet.users.isNotEmpty || showIfEmpty)
        userSetWidgets.add(_Border(
          backgroundColor: backgroundColor,
          header: userSet.icon == null && userSet.name == null?
          null:
          _ListHeader(
            icon: userSet.icon!,
            title: userSet.name!,
            trailing: headerTrailing?.call(context, userSet),
            permissions: userSet.permissions,
            color: backgroundColor,
          ),
          body: Builder(
            builder: (context){

              List<Widget> children = [];

              for(T userData in userSet.users)
                children.add(userTileBuilder(context, userData));

              return Column(mainAxisSize: MainAxisSize.min, children: children);

            },
          )
        ));

    return BottomNavScaffold(
      backgroundColor: backgroundColor,
      appBottomNavColor: appBottomNavColor,
      body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: !refreshController.isRefresh,
          physics: const BouncingScrollPhysics(),
          header: MaterialClassicHeader(
              backgroundColor: cardEnab_(context),
              color: strongColor
          ),
          footer: CustomFooter(
            height: moreToLoad?55:0,
            builder: (BuildContext context, LoadStatus? mode){

              Widget body;
              if(!moreToLoad)
                // This doesn't matter - `enablePullUp` is off anyway.
                body = Container();

              else if(mode == LoadStatus.idle)
                body = Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(MdiIcons.arrowUp),
                    const SizedBox(width: Dimen.ICON_MARG),
                    Text(
                        'Przeciągnij, by załadować kolejne',
                        style: AppTextStyle()
                    ),
                  ],
                );

              else if(mode == LoadStatus.loading)
                body = SpinKitChasingDots(
                  color: strongColor??iconEnab_(context),
                  size: Dimen.ICON_SIZE,
                );

              else if(mode == LoadStatus.failed)
                body = Text("Coś poszło nie tak!", style: AppTextStyle());

              else if(mode == LoadStatus.canLoading)
                body = Text("Puść, by załadować", style: AppTextStyle());

              else
                body = Text(
                  'Nie wiem co tu wyświtlić. Pozdrawiam mamę!',
                  style: AppTextStyle(),
                );

              return SizedBox(
                height: 55.0,
                child: Center(child: body),
              );

            },
          ),
          controller: refreshController,
          onRefresh: () async {

            callReload.call();
            refreshController.refreshCompleted();

          },
          onLoading: onLoading,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [

              SliverAppBar(
                title: Text(appBarTitle),
                centerTitle: true,
                floating: true,
                backgroundColor: backgroundColor,
                leading: appBarLeading,
                actions: appBarActions,
              ),

              SliverList(delegate: SliverChildListDelegate(userSetWidgets)),

              SliverList(delegate: SliverChildListDelegate([

                if(bottom != null)
                  bottom!,

              ])),

            ],
          )
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }

}

class _ListHeader extends StatelessWidget{

  final IconData icon;
  final String title;
  final Widget? trailing;
  final List<String> permissions;
  final Color? color;

  const _ListHeader({
    required this.icon,
    required this.title,
    required this.trailing,
    required this.permissions,
    required this.color,
    super.key
  });

  @override
  Widget build(BuildContext context) => Row(
    children: [

      const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG),

      Expanded(
        child: SimpleButton(
          radius: 10.0,
            onTap: () => UserListManagementLoadablePage.openPermissionsDialog(
              context: context,
              icon: icon,
              title: title,
              permissions: permissions,
              color: color,
            ),
            child: Row(
              children: [

                const SizedBox(width: Dimen.ICON_MARG),

                const SizedBox(height: Dimen.ICON_FOOTPRINT),

                SizedBox(
                  width: AccountThumbnailWidget.defSize,
                  child: Center(
                    child: Icon(icon, color: hintEnab_(context)),
                  ),
                ),

                const SizedBox(width: Dimen.SIDE_MARG),

                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyle(
                      fontWeight: weight.bold,
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      color: hintEnab_(context)
                    ),
                  )
                ),

              ],
            )
        ),
      ),

      const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG),

      if(trailing != null)
        trailing!

    ],
  );

}

class PermissionsDialog extends StatelessWidget{

  final IconData icon;
  final String title;
  final List<String> permissions;
  final Color? color;

  const PermissionsDialog({
    required this.icon,
    required this.title,
    required this.permissions,
    required this.color,
    super.key
  });

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        child: Material(
            borderRadius: BorderRadius.circular(AppCard.bigRadius),
            clipBehavior: Clip.hardEdge,
            color: color??background_(context),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              slivers: [

                SliverList(delegate: SliverChildListDelegate([

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: Dimen.ICON_MARG),
                    child: Row(
                      children: [

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimen.ICON_MARG),
                          child: Icon(icon),
                        ),

                        Expanded(
                          child: Column(
                            children: [

                              Text(
                                title,
                                style: AppTextStyle(
                                    fontSize: Dimen.TEXT_SIZE_APPBAR,
                                    color: iconEnab_(context),
                                    fontWeight: weight.halfBold
                                ),
                              ),

                              Text(
                                '(uprawnienia)',
                                style: AppTextStyle(
                                    fontSize: Dimen.TEXT_SIZE_BIG,
                                    color: iconEnab_(context)
                                ),
                              ),

                            ],
                          ),
                        ),

                        const SizedBox(width: Dimen.ICON_FOOTPRINT)

                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      top: Dimen.ICON_MARG,
                      left: 2*Dimen.ICON_MARG,
                      right: 2*Dimen.ICON_MARG,
                      bottom: Dimen.ICON_MARG
                    ),
                    child: Container(height: 3.0, color: backgroundIcon_(context)),
                  )

                ])),

                SliverList(delegate: SliverChildBuilderDelegate(
                    (context, index) => ListTile(
                      leading: Text(
                          '${index + 1}.',
                          style: AppTextStyle(
                              fontSize: Dimen.TEXT_SIZE_APPBAR,
                              fontWeight: weight.halfBold
                          )
                      ),
                      title: Text(
                          permissions[index],
                          style: AppTextStyle(
                            fontSize: Dimen.TEXT_SIZE_BIG
                          )
                      ),
                    ),
                    childCount: permissions.length
                )),

                SliverList(delegate: SliverChildListDelegate([

                  SimpleButton.from(
                    context: context,
                    text: 'Zamknij',
                    icon: MdiIcons.check,
                    radius: AppCard.bigRadius - 2,
                    onTap: () => Navigator.pop(context)
                  )

                ])),

              ],
            )
        )
    ),
  );

}

class _Border extends StatelessWidget{

  final Widget? header;
  final Widget body;
  final Color? backgroundColor;

  const _Border({
    required this.header,
    required this.body,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(Dimen.defMarg),
    child: Material(
      color: backgroundIcon_(context),
      borderRadius: BorderRadius.circular(AppCard.bigRadius),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Material(
          borderRadius: BorderRadius.circular(AppCard.bigRadius-6),
          clipBehavior: Clip.hardEdge,
          color: backgroundColor??background_(context),
          child: header==null?
          body:
          Column(
            children: [
              const SizedBox(height: Dimen.defMarg),
              header!,
              const SizedBox(height: Dimen.defMarg),
              body
            ],
          ),
        )
      ),
    )
  );

}
