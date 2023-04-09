import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/api/user.dart';
import 'package:harcapp/account/account_common/sex_input_field.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';
import 'package:harcapp_core/comm_widgets/app_button.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../_common_widgets/bottom_nav_scaffold.dart';
import '../_common_widgets/empty_message_widget.dart';
import 'account.dart';
import 'account_tile.dart';

class ShadowUserManagerPage extends StatefulWidget{

  static const String shadowAccountExplanation =
      'Jeżeli ktoś nie posiada konta HarcApp, stwórz na jego miejsce konto widmo.'
      '\n\nKonto widmo można połączyć z dowolnym istniejącym kontem w dowolnym momencie.';

  final Widget? Function(UserDataNick)? itemSubtitleBuilder;
  final void Function(UserDataNick)? onTap;

  const ShadowUserManagerPage({this.itemSubtitleBuilder, this.onTap, super.key});

  @override
  State<StatefulWidget> createState() => ShadowUserManagerPageState();

}

class ShadowUserManagerPageState extends State<ShadowUserManagerPage>{

  Widget? Function(UserDataNick)? get itemSubtitleBuilder => widget.itemSubtitleBuilder;
  void Function(UserDataNick)? get onTap => widget.onTap;

  late RefreshController refreshController;

  List<UserDataNick> get shadowUsers => AccountData.shadowUsers;

  @override
  void initState() {

    refreshController = RefreshController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
      body: SmartRefresher(
        enablePullDown: true,
        physics: const BouncingScrollPhysics(),
        header: MaterialClassicHeader(backgroundColor: cardEnab_(context), color: accent_(context)),
        controller: refreshController,
        onRefresh: () async {

          if(!await isNetworkAvailable()){
            showAppToast(context, text: 'Brak dostępu do Internetu');
            refreshController.refreshCompleted();
            return;
          }

          await ApiUser.getAllShadows(
            onSuccess: (List<UserDataNick> users) async {
              AccountData.shadowUsers = users;
              setState((){});
            }
          );
          refreshController.refreshCompleted();
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [

            SliverAppBar(
              title: const Text('Moi użytkownicy widmo'),
              centerTitle: true,
              floating: true,
              pinned: shadowUsers.isEmpty,
              actions: [
                IconButton(
                    icon: const Icon(MdiIcons.plus),
                    onPressed: () => openDialog(
                        context: context,
                        builder: (context) => AddShadowUserDialog(
                          onSuccess: (user) async => setState((){})
                        )
                    )
                )
              ],
            ),

            if(shadowUsers.isEmpty)
              SliverFillRemaining(
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
                              child: const EmptyMessageWidget(
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
              )
            else
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ShadowUserTile(
                    shadowUsers[index],
                    onTap: onTap,
                    onRemoved: () => setState((){}),
                    onEdited: () => setState((){}),
                    subtitle: itemSubtitleBuilder?.call(shadowUsers[index]),
                    key: ValueKey(shadowUsers[index].hashCode),
                  ),
                  childCount: shadowUsers.length,
                ),
              )

          ],
        ),
      )
  );


}

class ShadowUserTile extends StatefulWidget{

  final UserDataNick shadowUser;
  final Widget? subtitle;
  final void Function(UserDataNick)? onTap;
  final void Function()? onEdited;
  final void Function()? onRemoved;

  const ShadowUserTile(this.shadowUser, {this.subtitle, this.onTap, this.onEdited, this.onRemoved, super.key});

  @override
  State<StatefulWidget> createState() => ShadowUserTileState();

}

class ShadowUserTileState extends State<ShadowUserTile>{
  
  UserDataNick get shadowUser => widget.shadowUser;
  Widget? get subtitle => widget.subtitle;
  void Function(UserDataNick)? get onTap => widget.onTap;
  void Function()? get onEdited => widget.onEdited;
  void Function()? get onRemoved => widget.onRemoved;

  late bool processingRemove;
  late bool processingUpdate;

  bool get processing => processingRemove || processingUpdate; 
  
  @override
  void initState() {
    processingRemove = false;
    processingUpdate = false;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) => AccountTile(
    shadowUser.name,
    subtitle: subtitle,
    shadow: true,
    onTap: () => onTap?.call(shadowUser),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        IconButton(
            icon:
            processingUpdate?
            SpinKitChasingDots(
              size: Dimen.ICON_SIZE,
              color: iconEnab_(context)
            ):const Icon(MdiIcons.pencilOutline),
            onPressed: processing?null:(){
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

        AppButton(
          icon:
          processingRemove?
          SpinKitChasingDots(
              size: Dimen.ICON_SIZE,
              color: iconEnab_(context)
          ):const Icon(MdiIcons.close),
          onTap: () => showAppToast(context, text: 'Przytrzymaj, by usunąć'),
          onLongPress: processing?null:(){
            setState(() => processingRemove = true);
            ApiUser.deleteShadow(
                shadowUser.key,
                onSuccess: (bool? removed){
                  AccountData.removeShadowUser(shadowUser);
                  setState(() {});
                  onRemoved?.call();
                },
                onError: (){

                }
            );
            if(mounted) setState(() => processingRemove = false);

          },
        )

      ],
    ),
  );
  
}

class AddShadowUserDialog extends StatefulWidget{

  final UserDataNick? user;
  final FutureOr<void> Function(UserDataNick user)? onSuccess;

  const AddShadowUserDialog({this.user, this.onSuccess, super.key});

  @override
  State<StatefulWidget> createState() => AddShadowUserDialogState();

}

class AddShadowUserDialogState extends State<AddShadowUserDialog>{

  UserDataNick? get user => widget.user;
  FutureOr<void> Function(UserDataNick user)? get onSuccess => widget.onSuccess;

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
                        onChanged: (_, value) => setState(() => name = value),
                      ),

                      SexInputField(
                        sex,
                        onSexChanged: (value) => setState(() => sex = value),
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
                                    if(user == null)
                                      await ApiUser.createShadow(
                                          name,
                                          sex,
                                          onSuccess: (UserDataNick user) async {
                                            await AccountData.addShadowUser(user);
                                            Navigator.pop(context);
                                            await onSuccess?.call(user);
                                          },
                                          onError: () => showAppToast(context, text: simpleErrorMessage)
                                      );
                                    else
                                      await ApiUser.updateShadow(
                                          user,
                                          name,
                                          sex,
                                          onSuccess: (UserDataNick user) async {
                                            await AccountData.updateShadowUser(user);
                                            Navigator.pop(context);
                                            onSuccess?.call(user);
                                          },
                                          onError: () => showAppToast(context, text: simpleErrorMessage)
                                      );
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