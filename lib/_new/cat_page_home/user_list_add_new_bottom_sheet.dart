import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/account/search_user_dialog.dart';
import 'package:harcapp/account/shadow_user_manager_page.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UserListAddNewBottomSheet extends StatelessWidget{

  final List<String> participatingUserKeys;
  final void Function(UserDataNick userData) handleAddingUser;

  final String addUserMess; // 'Dodaj uczestnika'
  final String addUserWithHarcappAccountMess; // 'Dodaj uczestnika posiadającego konto HarcApp.'
  final String alreadyAddedMess; // 'Już uczestniczy'
  final String Function(String) userAlreadyAddedMess; // '{Name} już uczestniczy we wspolzawodnictwie!'

  final Color? backgroundColor;

  const UserListAddNewBottomSheet({
    this.participatingUserKeys = const [],
    required this.handleAddingUser,
    required this.addUserMess,
    required this.addUserWithHarcappAccountMess,
    required this.alreadyAddedMess,
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
                      showAppToast(context, text: 'Brak dostępu do Internetu');
                      return;
                    }

                    UserDataNick? userData = await openSearchUserDialog(
                        context,
                        title: addUserMess,
                        illegalUserKeys: participatingUserKeys,
                        illegalAttemptMessage: 'Że niby chcesz dodać kogoś po raz drugi?'
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
                          itemSubtitleBuilder: (UserDataNick shadowUser){
                            if(participatingUserKeys.contains(shadowUser.key))
                              return Text(
                                alreadyAddedMess,
                                style: AppTextStyle(color: hintEnab_(context)),
                              );
                            else
                              return null;
                          },
                          onTap: (UserDataNick shadowUser){
                            if(participatingUserKeys.contains(shadowUser.key)){
                              showAppToast(context, text: userAlreadyAddedMess(shadowUser.name));
                              return;
                            }

                            handleAddingUser(shadowUser);

                          },
                        )
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