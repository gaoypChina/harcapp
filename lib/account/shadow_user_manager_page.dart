import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_app_common/accounts/account_header_widget.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_common_widgets/paging_loadable_page/paging_loadable_base_scroll_view_page.dart';
import 'package:harcapp/_new/api/user.dart';
import 'package:harcapp/account/account_common/sex_input_field.dart';
import 'package:harcapp/account/search_user_dialog.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../_common_widgets/empty_message_widget.dart';
import 'account.dart';
import 'account_page/account_nick_dialog.dart';
import 'account_tile.dart';

class ShadowUserManagerPage extends StatefulWidget{

  static const String shadowAccountExplanation =
      'Jeżeli ktoś nie posiada konta HarcApp, stwórz na jego miejsce konto widmo.'
      '\n\nKonto widmo można połączyć z dowolnym istniejącym kontem w dowolnym momencie.';

  final String? appBarTitle;

  final Widget? Function(int, UserDataNick)? itemSubtitleBuilder;
  final Widget? Function(int, UserDataNick)? itemTrailingBuilder;
  // final void Function(UserDataNick)? onTap;
  final bool openDetailsOnTap;
  final void Function(UserDataNick)? handleAddNewlyCreatedUser;
  final String Function(UserDataNick)? selectAddedUserMessage;

  const ShadowUserManagerPage({this.appBarTitle, this.itemSubtitleBuilder, this.itemTrailingBuilder, this.openDetailsOnTap = true, this.handleAddNewlyCreatedUser, this.selectAddedUserMessage, super.key});

  @override
  State<StatefulWidget> createState() => ShadowUserManagerPageState();

}

class ShadowUserManagerPageState extends State<ShadowUserManagerPage>{

  Widget? Function(int, UserDataNick)? get itemSubtitleBuilder => widget.itemSubtitleBuilder;
  Widget? Function(int, UserDataNick)? get itemTrailingBuilder => widget.itemTrailingBuilder;
  // void Function(UserDataNick)? get onTap => widget.onTap;
  bool get openDetailsOnTap => widget.openDetailsOnTap;
  void Function(UserDataNick)? get handleAddNewlyCreatedUser => widget.handleAddNewlyCreatedUser;
  String Function(UserDataNick)? get selectAddedUserMessage => widget.selectAddedUserMessage;

  List<ShadowUserData> get loadedShadowUsers => AccountData.loadedShadowUsers;

  bool get moreToLoad => AccountData.shadowUserCount > loadedShadowUsers.length;

  // TODO: Dorobić shadow user loadera tak jak participants loadera.
  @override
  Widget build(BuildContext context) => PagingLoadableBaseScrollViewPage(
    appBarTitle: widget.appBarTitle??'Moi użytkownicy widmo',
    appBarActions: [
      IconButton(
        icon: Icon(MdiIcons.plus),
        onPressed: () => openDialog(
          context: context,
          builder: (context) => AddShadowUserDialog(
            onSuccess: (user){
              setState((){});
              showAlertDialog(
                  context,
                  title: 'Dobrze myślę?',
                  content: selectAddedUserMessage?.call(user)??'Czy chcesz użyć stworzonego właśnie konta widmo użytkownika <b>${user.name}</b>?',
                  actionBuilder: (context) => [
                    AlertDialogButton(
                      text: 'Nie',
                      onTap: () => Navigator.pop(context)
                    ),
                    AlertDialogButton(
                        text: 'Tak',
                        onTap: (){
                          Navigator.pop(context);
                          handleAddNewlyCreatedUser?.call(user);
                        }
                    ),
                  ]
              );
            }
          )
        )
      )
    ],
    totalItemsCount: AccountData.shadowUserCount,
    loadedItemsCount: loadedShadowUsers.length,
    callReload: () async {
      await ApiUser.getShadowUsers(
        pageSize: AccountData.shadowUsersPageSize,
        lastUserName: null,
        lastUserKey: null,
        onSuccess: (List<ShadowUserData> users) async {
          await AccountData.setLoadedShadowUsers(users);
          setState((){});
        }
      );
      return loadedShadowUsers.length;
    },
    callLoadMore: () async {
      await ApiUser.getShadowUsers(
          pageSize: AccountData.shadowUsersPageSize,
          lastUserName: loadedShadowUsers.isEmpty?null:loadedShadowUsers.last.name,
          lastUserKey: loadedShadowUsers.isEmpty?null:loadedShadowUsers.last.key,
          onSuccess: (List<ShadowUserData> users) async {
            await AccountData.addLoadedShadowUsers(users);
            setState((){});
          }
      );
      return loadedShadowUsers.length;
    },
    sliverBody: (context, isLoading){

      if(loadedShadowUsers.isEmpty)
        return SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(
                  child: Center(
                    child: SimpleButton(
                        radius: AppCard.bigRadius,
                        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                        child: EmptyMessageWidget(
                          icon: MdiIcons.alienOutline,
                          text: 'Kliknij, by stworzyć pierwsze\nkonto widmo',
                        ),
                        onTap: (){
                          openDialog(
                              context: context,
                              builder: (context) => AddShadowUserDialog(
                                onSuccess: (user) => setState((){}),
                              )
                          );
                        }
                    ),
                  )
                ),

                Padding(
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: backgroundIcon_(context),
                        width: 8,
                      ),
                      borderRadius: BorderRadius.circular(AppCard.bigRadius),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'O co chodzi?',
                            style: AppTextStyle(
                                fontSize: Dimen.TEXT_SIZE_BIG,
                                color: hintEnab_(context),
                                fontWeight: weight.bold
                            ),
                          ),

                          const SizedBox(height: Dimen.SIDE_MARG),

                          Text(
                            ShadowUserManagerPage.shadowAccountExplanation,
                            style: AppTextStyle(
                              fontSize: Dimen.TEXT_SIZE_BIG,
                              color: hintEnab_(context),
                            ),
                          )
                        ],
                      ),
                    )
                  ),
                )

              ]
          ),
        );
      else
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ShadowUserTile(
              loadedShadowUsers[index],
              openDetailsOnTap: openDetailsOnTap,
              onRemoved: () => setState((){}),
              onEdited: () => setState((){}),
              subtitle: itemSubtitleBuilder?.call(index, loadedShadowUsers[index]),
              trailing: itemTrailingBuilder?.call(index, loadedShadowUsers[index]),
              key: ValueKey(loadedShadowUsers[index].hashCode),
            ),
            childCount: loadedShadowUsers.length,
          ),
        );

    }
  );

}

class ShadowUserTile extends StatefulWidget{

  final ShadowUserData shadowUser;
  final Widget? subtitle;
  final Widget? trailing;
  final bool openDetailsOnTap;
  final void Function()? onEdited;
  final void Function()? onRemoved;

  const ShadowUserTile(this.shadowUser, {this.subtitle, this.trailing, this.openDetailsOnTap = true, this.onEdited, this.onRemoved, super.key});

  @override
  State<StatefulWidget> createState() => ShadowUserTileState();

}

class ShadowUserTileState extends State<ShadowUserTile>{
  
  ShadowUserData get shadowUser => widget.shadowUser;
  Widget? get subtitle => widget.subtitle;
  Widget? get trailing => widget.trailing;
  bool get openDetailsOnTap => widget.openDetailsOnTap;
  void Function()? get onEdited => widget.onEdited;
  void Function()? get onRemoved => widget.onRemoved;

  void openEditBottomSheet() => showScrollBottomSheet(
      context: context,
      builder: (_) => BottomSheetDef(
          builder: (_) => Column(
              children: [

                AccountHeaderWidget.fromUserData(
                  shadowUser,
                  heroTag: shadowUser.key,
                  shadow: true,
                ),

                const SizedBox(height: 2*Dimen.SIDE_MARG),

                ListTile(
                  leading: Icon(MdiIcons.shareVariant),
                  title: Text('Kod publiczny', style: AppTextStyle()),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppCard.bigRadius)),
                  onTap: (){
                    Navigator.pop(context);
                    openDialog(
                        context: context,
                        builder: (context) => AccountNickDialog(
                            userData: shadowUser,
                            nickSearchable: shadowUser.nickSearchable,
                        )
                    );
                  },
                ),

                ListTile(
                  leading: Icon(MdiIcons.accountMultiplePlusOutline),
                  title: Text('Połącz konto widmo', style: AppTextStyle()),
                  subtitle: Text('Połącz z istniejącym kontem HarcApp', style: AppTextStyle()),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppCard.bigRadius)),
                  onTap: () async {
                    Navigator.pop(context);
                    UserDataNick? userData = await openSearchUserDialog(
                      context,
                      title: 'Z kim łączysz konto widmo?',
                      buttonText: 'Połącz',
                    );
                    if(userData == null) return;
                    if(!mounted) return;
                    showLoadingWidget(context, 'Łączenie...');
                    await ApiUser.mergeShadow(
                      shadowUser.key,
                      userData.nick,
                      onSuccess: (){
                        AccountData.removeShadowUser(shadowUser);
                        showAppToast(context, text: 'Konto widmo <b>${shadowUser.name}</b> zostało połączone z kontem <b>${userData.name}</b>');
                      },
                      onError: (){
                        if(!mounted) return;
                        showAppToast(context, text: simpleErrorMessage);
                      }
                    );
                    if(!mounted) return;
                    Navigator.pop(context); // Close loading widget.
                  },
                ),

                ListTile(
                    leading: Icon(MdiIcons.pencilOutline),
                    title: Text('Edytuj konto widmo', style: AppTextStyle()),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppCard.bigRadius)),
                    onTap: (){
                      Navigator.pop(context);
                      openDialog(
                          context: context,
                          builder: (context) => AddShadowUserDialog(
                            user: shadowUser,
                            onSuccess: (user){
                              onEdited?.call();
                              setState((){});
                            },
                          )
                      );
                    }
                ),

                ListTile(
                    leading: Icon(MdiIcons.nuke, color: Colors.red),
                    title: Text('Usuń konto widmo', style: AppTextStyle(color: Colors.red)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppCard.bigRadius)),
                    onTap: () => showAppToast(context, text: 'Przytrzymaj, by usunąć'),
                    onLongPress: () async {
                    Navigator.pop(context);
                    showLoadingWidget(context, 'Ewakuacja konta widmo...');
                    await ApiUser.deleteShadow(
                        shadowUser.key,
                        onSuccess: (bool? removed) async {
                          AccountData.removeShadowUser(shadowUser);
                          await AccountData.writeShadowUserCount(AccountData.shadowUserCount - 1);
                          setState(() {});
                          onRemoved?.call();
                        },
                        onError: (){
                          if(mounted) showAppToast(context, text: simpleErrorMessage);
                        }
                    );
                    if(mounted) Navigator.pop(context); // Close loading widget

                  },
                ),

              ]
          )
      )
  );
  
  @override
  Widget build(BuildContext context) => AccountTile(
    shadowUser.name,
    subtitle: subtitle,
    shadow: true,
    onTap: openDetailsOnTap?() => openEditBottomSheet():null,
    trailing: trailing,

    // Row(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //
    //     IconButton(
    //         icon:
    //         processingUpdate?
    //         SpinKitChasingDots(
    //           size: Dimen.ICON_SIZE,
    //           color: iconEnab_(context)
    //         ):Icon(MdiIcons.pencilOutline),
    //         onPressed: processing?null:(){
    //           openDialog(
    //               context: context,
    //               builder: (context) => AddShadowUserDialog(
    //                 user: shadowUser,
    //                 onSuccess: (user){
    //                   onEdited?.call();
    //                   setState((){});
    //                 },
    //               )
    //           );
    //         }
    //     ),
    //
    //     AppButton(
    //       icon:
    //       processingRemove?
    //       SpinKitChasingDots(
    //           size: Dimen.ICON_SIZE,
    //           color: iconEnab_(context)
    //       ):Icon(MdiIcons.close),
    //       onTap: () => showAppToast(context, text: 'Przytrzymaj, by usunąć'),
    //       onLongPress: processing?null:() async {
    //         setState(() => processingRemove = true);
    //         showLoadingWidget(context, 'Ewakuacja konta widmo...');
    //         await ApiUser.deleteShadow(
    //             shadowUser.key,
    //             onSuccess: (bool? removed) async {
    //               AccountData.removeShadowUser(shadowUser);
    //               await AccountData.writeShadowUserCount(AccountData.shadowUserCount - 1);
    //               setState(() {});
    //               onRemoved?.call();
    //             },
    //             onError: (){
    //               if(mounted) showAppToast(context, text: simpleErrorMessage);
    //             }
    //         );
    //         if(mounted) Navigator.pop(context);
    //         if(mounted) setState(() => processingRemove = false);
    //
    //       },
    //     )
    //
    //   ],
    // ),
  );
  
}

class AddShadowUserDialog extends StatefulWidget{

  final ShadowUserData? user;
  final FutureOr<void> Function(ShadowUserData user)? onSuccess;

  const AddShadowUserDialog({this.user, this.onSuccess, super.key});

  @override
  State<StatefulWidget> createState() => AddShadowUserDialogState();

}

class AddShadowUserDialogState extends State<AddShadowUserDialog>{

  ShadowUserData? get user => widget.user;
  FutureOr<void> Function(ShadowUserData user)? get onSuccess => widget.onSuccess;

  String? name;
  Sex? sex;

  TextEditingController? nameController;

  late bool processing;
  bool get clickable => name==null || sex==null;

  @override
  void initState() {
    if(user != null){
      name = user!.name;
      nameController = TextEditingController(text: name);
      sex = user!.sex;
    }else{
      nameController = TextEditingController();
    }
    processing = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: MediaQuery.of(context).viewInsets,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        child: Material(
            borderRadius: BorderRadius.circular(AppCard.bigRadius),
            color: background_(context),
            clipBehavior: Clip.hardEdge,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                AppBar(
                  title: Text(
                      user == null?
                      'Stwórz konto widmo':
                      'Edytuj konto widmo'
                  ),
                  centerTitle: true,
                  elevation: 0,
                ),

                Padding(
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      AppTextFieldHint(
                        leading: Padding(
                          padding: const EdgeInsets.all(Dimen.ICON_MARG),
                          child: Icon(MdiIcons.account, color: hintEnab_(context)),
                        ),
                        hint: 'Imię i nazwisko:',
                        style: AppTextStyle(),
                        controller: nameController,
                        textCapitalization: TextCapitalization.words,
                        hintStyle: AppTextStyle(color: hintEnab_(context)),
                        autofocus: user == null,
                        onChanged: (_, value) => setState(() => name = value),
                      ),

                      SexInputField(
                        sex,
                        onChanged: (value) => setState(() => sex = value),
                      ),

                      const SizedBox(height: Dimen.SIDE_MARG),

                      Row(
                        children: [
                          Expanded(child: Container()),
                          AnimatedChildSlider(
                            index: processing?1:0,
                            alignment: Alignment.centerRight,
                            children: [

                              SimpleButton.from(
                                  context: context,
                                  textColor:
                                  clickable?
                                  iconDisab_(context):
                                  iconEnab_(context),

                                  icon: MdiIcons.arrowRight,
                                  margin: EdgeInsets.zero,
                                  iconLeading: false,
                                  text: user==null?'Stwórz':'Aktualizuj',
                                  onTap: clickable || processing?null:() async {

                                    setState(() => processing = true);
                                    if(user == null) {
                                      for(UserDataNick shadowUser in AccountData.loadedShadowUsers)
                                        if(shadowUser.name == name) {
                                          showAppToast(context, text: 'Użytkownik o takim imieniu i nazwisku już istnieje!');
                                          if(mounted) setState(() => processing = false);
                                          return;
                                        }
                                      await ApiUser.createShadow(
                                          name,
                                          sex,
                                          onSuccess: (ShadowUserData user) async {
                                            await AccountData.addLoadedShadowUser(user);
                                            await AccountData.writeShadowUserCount(AccountData.shadowUserCount + 1);
                                            Navigator.pop(context);
                                            await onSuccess?.call(user);
                                          },
                                          onError: () =>
                                              showAppToast(context,
                                                  text: simpleErrorMessage)
                                      );
                                    }else {
                                      for(UserDataNick shadowUser in AccountData.loadedShadowUsers)
                                        if(user!.key != shadowUser.key && shadowUser.name == name) {
                                          showAppToast(context, text: 'Użytkownik o takim imieniu i nazwisku już istnieje!');
                                          if(mounted) setState(() => processing = false);
                                          return;
                                        }

                                      await ApiUser.updateShadow(
                                          user!,
                                          name,
                                          sex,
                                          onSuccess: (ShadowUserData user) async {
                                            await AccountData.updateShadowUser(user);
                                            Navigator.pop(context);
                                            onSuccess?.call(user);
                                          },
                                          onError: () =>
                                              showAppToast(context,
                                                  text: simpleErrorMessage)
                                      );
                                    }

                                    if(mounted) setState(() => processing = false);
                                  }
                              ),

                              Row(
                                children: [

                                  Text(
                                    user==null?'Tworzenie':'Aktualizacja',
                                    style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold, color: hintEnab_(context)),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(Dimen.ICON_MARG),
                                    child: SpinKitChasingDots(size: Dimen.ICON_SIZE, color: hintEnab_(context)),
                                  ),
                                ],
                              )

                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),

              ],
            )
        ),
      ),
    ),
  );

}