import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/comp_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/account/search_user_dialog.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../account/shadow_user_manager_page.dart';

class AddUserBottomSheet extends StatelessWidget{

  final IndivComp comp;

  const AddUserBottomSheet(this.comp, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BottomSheetDef(
      title: 'Dodaj uczestnika',
      childMargin: EdgeInsets.zero,
      builder: (context) => Stack(
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
                  title: 'Dodaj uczestnika',
                  icon: MdiIcons.accountOutline,
                  onOpen: (context) async {
                    Navigator.pop(context);

                    if(!await isNetworkAvailable()){
                      showAppToast(context, text: 'Brak dostępu do Internetu');
                      return;
                    }

                    UserDataNick? userData = await openSearchUserDialog(
                        context,
                        title: 'Dodaj uczestnika',
                        illegalUserKeys: comp.particips.map((p) => p.key).toList(),
                        illegalAttemptMessage: 'Że niby chcesz dodać kogoś po raz drugi?'
                    );

                    if(userData == null) return;

                    addUser(context, userData);

                  },
                ),

                Padding(
                  padding: const EdgeInsets.all(Dimen.ICON_MARG),
                  child: Text(
                    'Dodaj uczestnika posiadającego konto HarcApp.',
                    style: AppTextStyle(color: hintEnab_(context)),
                  ),
                ),

                const SizedBox(height: 42),

                TitleShortcutRowWidget(
                  title: 'Dodaj konto widmo',
                  icon: MdiIcons.alienOutline,
                  onOpen: (context) async {
                    Navigator.pop(context);

                    pushPage(
                        context,
                        builder: (context) => ShadowUserManagerPage(
                          itemSubtitleBuilder: (UserDataNick shadowUser){
                            if(comp.participMap.containsKey(shadowUser.key))
                              return Text(
                                'Już uczestniczy',
                                style: AppTextStyle(color: hintEnab_(context)),
                              );
                            else
                              return null;
                          },
                          onTap: (UserDataNick shadowUser){
                            if(comp.participMap[shadowUser.key] != null){
                              showAppToast(context, text: '${shadowUser.name} już uczestniczy we współzawodnictwie!');
                              return;
                            }
                            addUser(context, shadowUser);

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

  void addUser(BuildContext context, UserDataNick userData) async {

    showLoadingWidget(context, comp.colors.avgColor, 'Dodawanie uczestnika');

    await ApiIndivComp.addUsers(
        compKey: comp.key,
        users: [ParticipBodyNick(userData.key, CompRole.OBSERVER, true, userData.nick)],
        onSuccess: (List<IndivCompParticip> allParticips){
          comp.participMap.clear();
          comp.particips.clear();
          comp.addParticips(context, allParticips);
          Navigator.pop(context);
          Navigator.pop(context);
          showAppToast(context, text: '${userData.name} ${userData.isMale?'dodany':'dodana'}.');
        },
        onError: (){
          Navigator.pop(context);
          showAppToast(context, text: 'Coś poszło nie tak...');
        }
    );

  }

}