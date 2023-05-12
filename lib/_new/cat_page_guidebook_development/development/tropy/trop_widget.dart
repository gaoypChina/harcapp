import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/border_material.dart';
import 'package:harcapp/_common_widgets/duration_date_widget.dart';
import 'package:harcapp/_new/api/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop_role.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_users_page/trop_users_page.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp/values/app_values.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_editor_page/_main.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_icon.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_task_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_tile.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp/account/account_thumbnail_row_widget.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'model/trop_user.dart';


class TropWidget extends StatefulWidget{

  final Trop trop;
  final double iconSize;
  final bool showBack;
  final void Function(bool wasShared)? onUserAdded;

  const TropWidget(
      this.trop,
      { this.iconSize = TropIcon.defSize,
        this.showBack = true,
        this.onUserAdded,
        super.key
      });

  @override
  State<StatefulWidget> createState() => TropWidgetState();

}

class TropWidgetState extends State<TropWidget>{

  Trop get trop => widget.trop;
  double get iconSize => widget.iconSize;
  bool get showBack => widget.showBack;

  void Function(bool wasShared)? get onUserAdded => widget.onUserAdded;

  List<TropUser> get loadedUsers => trop.loadedUsers;

  @override
  Widget build(BuildContext context) => Consumer<TropProvider>(
      builder: (context, prov, child) => CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          if(showBack)
            SliverAppBar(
              title: Text(trop.name),
              centerTitle: true,
              floating: true,
              actions: [
                if(!trop.isShared || (trop.isShared && trop.myRole == TropRole.OWNER))
                  IconButton(
                    icon: const Icon(MdiIcons.pencilOutline),
                    onPressed: () {

                      pushPage(context, builder: (context) => TropEditorPage(
                          initTrop: trop,
                          allCategories:
                          trop.isCategoryHarc?
                          allHarcTropCategories:
                          allZuchTropCategories,
                          onSaved: (updatedTrop){
                            trop.update(updatedTrop);
                            showAppToast(context, text: 'Trop poprawiony');
                            prov.notify();
                          }
                      ));

                    },
                  )
              ],
            ),

          SliverPadding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            sliver: SliverList(delegate: SliverChildListDelegate([

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  DurationDateWidget(
                    startDate: trop.startDate,
                    endDate: trop.endDate,
                    color: AppColors.zhpTropColor,
                  ),

                  const SizedBox(height: Dimen.SIDE_MARG),

                  TropTile(
                    name: trop.name,
                    category: trop.category,
                    zuchTropName: trop.customIconTropName,
                    trailing: TropTileProgressWidget(trop.completenessPercent),
                    iconSize: iconSize,
                  ),

                  if(account)
                    const SizedBox(height: Dimen.SIDE_MARG),

                  if(account)
                    TropUsersWidget(
                      trop,
                      onUserAdded: (wasShared){
                        if(!wasShared) showAppToast(context, text: 'Trop przeniesiony z <b>lokalnych<b> do <b>udostępnionych</b>');
                        onUserAdded?.call(wasShared);
                      },
                    ),

                  if(trop.aims.isNotEmpty)
                    const SizedBox(height: Dimen.SIDE_MARG),

                  if(trop.aims.isNotEmpty)
                    const TitleShortcutRowWidget(
                      title: 'Cele',
                      textAlign: TextAlign.left,
                    ),

                  if(trop.aims.isNotEmpty)
                    ListView.separated(
                      itemBuilder: (context, index) => TropAimWidget(trop.aims[index], index: index),
                      separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
                      itemCount: trop.aims.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),

                  const SizedBox(height: Dimen.SIDE_MARG),

                  const TitleShortcutRowWidget(
                    title: 'Zadania',
                    textAlign: TextAlign.left,
                  ),

                  ListView.separated(
                    itemBuilder: (context, index) => TropTaskWidget(trop, trop.tasks[index], index: index),
                    separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
                    itemCount: trop.tasks.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),

                  if(trop.hasNotesForLeaders)
                    const SizedBox(height: Dimen.SIDE_MARG),

                  if(trop.hasNotesForLeaders)
                    const TitleShortcutRowWidget(
                      title: 'Wskazówki dla drużynowego',
                      textAlign: TextAlign.left,
                    ),

                  if(trop.hasNotesForLeaders)
                    BorderMaterial(
                      child: Padding(
                          padding: const EdgeInsets.all(Dimen.ICON_MARG),
                          child: Text(
                            trop.notesForLeaders!,
                            style: AppTextStyle(
                                fontSize: Dimen.TEXT_SIZE_BIG
                            ),
                          )
                      ),
                    ),

                ],
              )

            ])),
          )

        ],
      )
  );

}

class TropUsersWidget extends StatefulWidget{

  final Trop trop;
  final EdgeInsets padding;
  final void Function(bool wasShared)? onUserAdded;

  const TropUsersWidget(this.trop, {this.padding=EdgeInsets.zero, this.onUserAdded, super.key});

  @override
  State<StatefulWidget> createState() => TropUsersWidgetState();

}

class TropUsersWidgetState extends State<TropUsersWidget>{

  Trop get trop => widget.trop;
  EdgeInsets get padding => widget.padding;
  void Function(bool)? get onUserAdded => widget.onUserAdded;

  List<TropUser> get loadedUsers => trop.loadedUsers;

  late bool isLoading;

  Future<void> loadMoreUsers() async{
    if(trop.key == null){
      logger.e("Registered a failed attempt to call `getUsers` on trop with no trop key.");
      return;
    }
    setState(() => isLoading = true);
    if(!await isNetworkAvailable()){
      setState(() => isLoading = false);
      return;
    }
    await ApiTrop.getUsers(
      tropKey: trop.key!,
      pageSize: Trop.userPageSize,
      lastRole: loadedUsers.length<=1?null:loadedUsers.last.role,
      lastUserName: loadedUsers.length<=1?null:loadedUsers.last.name,
      lastUserKey: loadedUsers.length<=1?null:loadedUsers.last.key,
      onSuccess: (observersPage){
        trop.addLoadedUsers(observersPage, context: context);
        trop.saveOwn(localOnly: true, synced: true);
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
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    isLoading = AccountData.loggedIn && loadedUsers.length <= 1 && trop.userCount > 1;
    if(isLoading) loadMoreUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Padding(
      padding: padding,
      child: Consumer<TropLoadedUsersProvider>(
          builder: (context, prov, child) => Row(
            children: [

              Expanded(child: AccountThumbnailLoadableRowWidget(
                loadedUsers.map((p) => p.name).toList(),
                onLoadMore: loadMoreUsers,
                isLoading: isLoading,
                isMoreToLoad: loadedUsers.length < trop.userCount,
                  onTap: (){
                    if(AccountData.loggedIn) openTropUsersPage(context);
                    else AccountPage.open(context);
                  }
              )),

              if(!trop.isShared || (trop.userCount <= 1 && trop.myRole == TropRole.OWNER))
                Align(
                  alignment: Alignment.centerRight,
                  child: SimpleButton.from(
                      context: context,
                      color: AppColors.zhpTropColor,
                      textColor: Colors.white,
                      icon: MdiIcons.accountPlusOutline,
                      text: 'Zaproś kumpli',
                      onTap: (){
                        if(AccountData.loggedIn) openTropUsersPage(context);
                        else AccountPage.open(context);
                      }
                  ),
                ),

            ],
          )
      )
  );

  void openTropUsersPage(BuildContext context) => pushPage(
      context,
      builder: (context) => TropUsersPage(
        trop: trop,
        onUserAdded: onUserAdded,
      )
  );

}

class TropAimWidget extends StatelessWidget{

  final String aim;
  final int index;

  const TropAimWidget(this.aim, {required this.index, super.key});

  @override
  Widget build(BuildContext context) => BorderMaterial(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.ICON_MARG),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Text(
            'Cel ${index+1}',
            style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG,
                fontWeight: weight.halfBold,
                color: hintEnab_(context)
            ),
          ),

          const SizedBox(height: Dimen.ICON_MARG),

          Text(
            aim,
            style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG
            ),
          )

        ],
      ),
    ),
  );

}