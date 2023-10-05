import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/account/search_user_dialog.dart';
import 'package:harcapp/account/shadow_user_manager_page.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UserListAddNewBottomSheet extends StatelessWidget{

  final List<String> participatingUserKeys;
  final void Function(UserDataNick userData) handleAddingUser;

  final Color? selectButtonColor;
  final Color? selectButtonTextColor;
  final Color? selectedButtonColor;
  final Color? selectedButtonTextColor;

  final String addUserMess; // 'Dodaj uczestnika'
  final String addUserWithHarcappAccountMess; // 'Dodaj uczestnika posiadającego konto HarcApp.'
  // final String alreadyAddedMess; // 'Już uczestniczy'
  final String selectSearchedUserButtonText;
  final String Function(String) userAlreadyAddedMess; // '{Name} już uczestniczy we wspolzawodnictwie!'

  final Color? backgroundColor;

  const UserListAddNewBottomSheet({
    this.participatingUserKeys = const [],
    required this.handleAddingUser,

    this.selectButtonColor,
    this.selectButtonTextColor,
    this.selectedButtonColor,
    this.selectedButtonTextColor,

    required this.addUserMess,
    required this.addUserWithHarcappAccountMess,
    // required this.alreadyAddedMess,
    this.selectSearchedUserButtonText = SearchUserWidget.defButtonText,
    required this.userAlreadyAddedMess,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) => BottomSheetDef(
      color: backgroundColor,
      title: addUserMess,
      childMargin: EdgeInsets.zero,
      builder: (_) => Stack(
        children: [

          Positioned(
            bottom: -.07*MediaQuery.of(context).size.width,
            right: -.07*MediaQuery.of(context).size.width,
            child: Icon(
              MdiIcons.accountPlusOutline,
              color: backgroundIcon_(context),
              size: 0.7*MediaQuery.of(context).size.width,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(Dimen.BOTTOM_SHEET_MARG + Dimen.ICON_MARG),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                TitleShortcutRowWidget(
                  title: addUserMess,
                  icon: MdiIcons.accountOutline,
                  onOpen: () async {
                    Navigator.pop(context); // Close bottom sheet.

                    if(!await isNetworkAvailable()){
                      showAppToast(context, text: noInternetMessage);
                      return;
                    }

                    UserDataNick? userData = await openSearchUserDialog(
                        context,
                        title: addUserMess,
                        buttonText: selectSearchedUserButtonText,
                        illegalUserKeys: participatingUserKeys,
                        illegalAttemptMessage: 'Że niby chcesz dodać kogoś po raz drugi?',
                    );

                    if(userData == null) return;

                    handleAddingUser(userData);

                  },
                ),

                Padding(
                  padding: const EdgeInsets.all(Dimen.ICON_MARG),
                  child: Text(
                    addUserWithHarcappAccountMess,
                    style: AppTextStyle(color: hintEnab_(context)),
                  ),
                ),

                const SizedBox(height: 42),

                TitleShortcutRowWidget(
                  title: 'Dodaj konto widmo',
                  icon: MdiIcons.alienOutline,
                  onOpen: () async {
                    Navigator.pop(context); // Close bottom sheet

                    pushPage(
                        context,
                        builder: (context) => ShadowUserManagerPage(
                          appBarTitle: 'Wybierz użytkownika widmo',
                          // itemSubtitleBuilder: (int index, UserDataNick shadowUser){
                          //   if(participatingUserKeys.contains(shadowUser.key))
                          //     return Text(
                          //       alreadyAddedMess,
                          //       style: AppTextStyle(color: hintEnab_(context)),
                          //     );
                          //   else
                          //     return null;
                          // },
                          itemTrailingBuilder: (int index, UserDataNick shadowUser){
                            if(participatingUserKeys.contains(shadowUser.key))
                              return SimpleButton.from(
                                color: selectedButtonColor??backgroundIcon_(context),
                                textColor: selectedButtonTextColor??iconEnab_(context),
                                icon: MdiIcons.check,
                                text: shadowUser.isMale?'Dodany':'Dodana',
                                onTap: (){
                                  if(participatingUserKeys.contains(shadowUser.key))
                                    showAppToast(context, text: userAlreadyAddedMess(shadowUser.name));
                                },
                                padding: const EdgeInsets.only(
                                  top: Dimen.defMarg,
                                  bottom: Dimen.defMarg,
                                  right: Dimen.defMarg,
                                  left: 1.5*Dimen.defMarg
                                ),
                                dense: true,
                              );
                            else
                              return SimpleButton.from(
                                color: selectButtonColor??backgroundIcon_(context),
                                textColor: selectButtonTextColor??iconEnab_(context),
                                icon: MdiIcons.plus,
                                text: 'Wybierz',
                                onTap: () => handleAddingUser(shadowUser),
                                padding: const EdgeInsets.only(
                                    top: Dimen.defMarg,
                                    bottom: Dimen.defMarg,
                                    right: Dimen.defMarg,
                                    left: 1.5*Dimen.defMarg
                                ),
                                dense: true,
                              );
                          },
                          openDetailsOnTap: false,
                          handleAddNewlyCreatedUser: handleAddingUser,
                          selectAddedUserMessage: (user) => 'Czy chcesz dodać stworzone właśnie konto widmo użytkownika <b>${user.name}</b> do współzawodnictwa?',
                        ),
                    );

                  },
                ),

                Padding(
                  padding: const EdgeInsets.all(Dimen.ICON_MARG),
                  child: Text(
                    ShadowUserManagerPage.shadowAccountExplanation,
                    style: AppTextStyle(color: hintEnab_(context)),
                  ),
                ),

                const SizedBox(height: Dimen.ICON_MARG),

              ],
            ),
          ),

        ],
      )
  );

}