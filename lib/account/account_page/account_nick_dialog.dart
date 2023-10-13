import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/api/user.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/pulsing_text.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';


class AccountNickDialog extends StatefulWidget{

  final ShadowUserData? userData;
  final bool? nickSearchable;

  const AccountNickDialog({this.userData, this.nickSearchable, super.key}):
        assert((userData != null && nickSearchable != null) || (userData == null && nickSearchable == null));

  @override
  State<StatefulWidget> createState() => AccountNickDialogState();

}

class AccountNickDialogState extends State<AccountNickDialog>{

  late bool nickProcessing;
  late bool nickSearchableProcessing;


  UserDataNick get userData => widget.userData??AccountData.toUserData();
  bool get nickSearchable => widget.nickSearchable??AccountData.nickSearchable;

  void onNickChanged() async {

    setState(() => nickProcessing = true);

    if(userData.shadow)
      await ApiUser.resetShadowNick(
          userData.key,
          onSuccess: (String nick) async {
            AccountData.loadedShadowUserMap![userData.key]!.nick = nick;
            setState(() => userData.nick = nick);
          },
          onError: (Response? response){
            try{

              Map? errMap = response!.data['errors'];

              if(errMap != null) {
                showAppToast(context, text: translate(errMap['nick']));
                // nickSearchableController.errorText = errMap[ApiUser.UPDATE_REQ_NICK_SEARCHABLE] ?? '';
                // nickController!.errorText = errMap['nick'] ?? '';
              }

            }catch (e){ showAppToast(context, text: 'Coś nie siadło.'); }

          }
      );
    else
      await ApiUser.resetNick(
          onSuccess: (String nick) async {
            await AccountData.writeNick(nick);
          },
          onError: (Response? response){
            try{

              Map? errMap = response!.data['errors'];

              if(errMap != null) {
                showAppToast(context, text: translate(errMap['nick']));
                // nickSearchableController.errorText = errMap[ApiUser.UPDATE_REQ_NICK_SEARCHABLE] ?? '';
                // nickController!.errorText = errMap['nick'] ?? '';
              }

            }catch (e){ showAppToast(context, text: 'Coś nie siadło.'); }

          }
      );

    setState(() => nickProcessing = false);

  }

  void onNickSearchableChanged() async {

    setState(() => nickSearchableProcessing = true);

    await ApiUser.nickSearchable(
        searchable: !AccountData.nickSearchable,
        onSuccess: (bool? nickSearchable) async {
            await AccountData.writeNickSearchable(nickSearchable!);
            setState((){});
        },
        onError: (Response? response){
          try{
            Map? errMap = response!.data['errors'];
            showAppToast(context, text: errMap![ApiUser.UPDATE_REQ_NICK_SEARCHABLE]??'');
          }catch (e){showAppToast(context, text: 'Coś nie siadło.');}

        }
    );

    setState(() => nickSearchableProcessing = false);

  }

  @override
  void initState() {
    nickProcessing = false;
    nickSearchableProcessing = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      child: Material(
          borderRadius: BorderRadius.circular(AppCard.bigRadius),
          clipBehavior: Clip.hardEdge,
          color: background_(context),
          child: CustomScrollView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            slivers: [

              SliverAppBar(
                title: const Text('Kod publiczny'),
                centerTitle: true,
                actions: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: nickSearchableProcessing?0.5:1.0,
                    child: Consumer<ConnectivityProvider>(
                      builder: (context, prov, child) => Switch(
                        value: nickSearchableProcessing?!nickSearchable:nickSearchable,
                        onChanged: !prov.connected || nickSearchableProcessing?null:(value) => onNickSearchableChanged(),
                      ),
                    ),
                  )
                ],
              ),

              SliverList(delegate: SliverChildListDelegate([

                const SizedBox(height: Dimen.SIDE_MARG - 3.0),

                Row(
                  children: [

                    // IconButton(
                    //   icon: Icon(MdiIcons.contentCopy),
                    //   onPressed: (){
                    //     Clipboard.setData(ClipboardData(text: userData.nick));
                    //     showAppToast(context, text: 'Skopiowano');
                    //   }
                    // ),

                    const SizedBox(width: Dimen.ICON_FOOTPRINT),

                    Expanded(
                      child: nickProcessing?
                      SelectableText(
                        'Generowanie...',
                        textAlign: TextAlign.center,
                        style: AppTextStyle(
                          fontSize: Dimen.TEXT_SIZE_APPBAR,
                          fontWeight: weight.normal,
                          color: textDisab_(context),
                        ),
                      ):
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const AppText(''),
                            const SizedBox(height: 3.0),

                            PulsingText(
                              userData.nick,
                              pulse: !nickProcessing && nickSearchable,
                              fontSize: Dimen.TEXT_SIZE_APPBAR,
                              fontColor: nickProcessing || !nickSearchable?textDisab_(context):iconEnab_(context),
                              fontWeight: weight.bold,
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 3.0),
                            AppText('Konto: <b>${userData.name}</b>')

                          ],
                        )
                      ),
                    ),

                    Consumer<ConnectivityProvider>(
                      builder: (context, prov, child) => IconButton(
                        icon: Icon(MdiIcons.refresh),
                        onPressed: !prov.connected || nickProcessing || !nickSearchable?null:() => onNickChanged(),
                      ),
                    )

                  ],
                ),

                const SizedBox(height: Dimen.SIDE_MARG),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2*Dimen.SIDE_MARG
                  ),
                  child: Material(
                    color: ColorPack.DEF_BACKGROUND,
                    borderRadius: BorderRadius.circular(AppCard.bigRadius),
                    child: Padding(
                      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                      child: QrImageView(
                        padding: EdgeInsets.zero,
                        data: userData.nick,
                        version: QrVersions.auto,
                        eyeStyle: QrEyeStyle(
                            eyeShape: QrEyeShape.square,
                            color: nickSearchable?
                            ColorPack.DEF_ICON_ENAB:
                            ColorPack.DEF_ICON_DISAB
                        ),
                        dataModuleStyle: QrDataModuleStyle(
                            dataModuleShape: QrDataModuleShape.square,
                            color: nickSearchable?
                            ColorPack.DEF_ICON_ENAB:
                            ColorPack.DEF_ICON_DISAB
                        ),
                      ),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left: Dimen.SIDE_MARG),
                  child: TitleShortcutRowWidget(title: 'O co chodzi?', textAlign: TextAlign.left),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: Dimen.SIDE_MARG,
                    right: Dimen.SIDE_MARG,
                    bottom: Dimen.SIDE_MARG
                  ),
                  child: AppText(
                    'W celu ochrony prywatności wyszukać inne konto można jedynie po <b>kodzie publicznym</b>. Wykrywalność konta można wyłączyć.\n\nKod publiczny można zmienić raz na 2 dni.',
                    size: Dimen.TEXT_SIZE_BIG,
                    color: textEnab_(context),
                  ),
                ),

              ]))

            ],
          )
      ),
    ),
  );

}

class HarcAppWidget extends StatelessWidget{

  static const defSize = 48.0;

  final double size;
  final Color? color;

  const HarcAppWidget({this.size = defSize, this.color, super.key});

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    'assets/images/harcapp_logo.svg',
    width: size,
    height: size,
    color: color??iconEnab_(context),
  );

}



