import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:harcapp/_common_classes/blur.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/api/user.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';


class AccountNickDialog extends StatefulWidget{

  const AccountNickDialog({super.key});

  @override
  State<StatefulWidget> createState() => AccountNickDialogState();

}

class AccountNickDialogState extends State<AccountNickDialog>{

  late bool nickProcessing;
  late bool nickSearchableProcessing;

  void onNickChanged() async {

    setState(() => nickProcessing = true);

    await ApiUser.resetNick(
        onSuccess: (String? nick) async {
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

  static const pulseDuration = Duration(milliseconds: 600);
  late bool pulseVisible;

  void runOpacityPulser() async {
    while(true){
      await Future.delayed(pulseDuration);
      if(!mounted) return;
      setState(() => pulseVisible = true);
      await Future.delayed(pulseDuration);
      if(!mounted) return;
      setState(() => pulseVisible = false);
    }
  }

  @override
  void initState() {
    nickProcessing = false;
    nickSearchableProcessing = false;

    pulseVisible = false;
    post(() => runOpacityPulser());

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
                        value: nickSearchableProcessing?!AccountData.nickSearchable:AccountData.nickSearchable,
                        onChanged: !prov.connected || nickSearchableProcessing?null:(value) => onNickSearchableChanged(),
                      ),
                    ),
                  )
                ],
              ),

              SliverList(delegate: SliverChildListDelegate([

                const SizedBox(height: Dimen.SIDE_MARG),

                Row(
                  children: [

                    const SizedBox(width: Dimen.ICON_FOOTPRINT),

                    Expanded(
                      child: Stack(
                        children: [

                          if(!nickProcessing && AccountData.nickSearchable)
                            AnimatedOpacity(
                              opacity: pulseVisible?1:0,
                              duration: pulseDuration,
                              child: Text(
                                AccountData.nick!,
                                textAlign: TextAlign.center,
                                style: AppTextStyle(
                                  fontSize: Dimen.TEXT_SIZE_APPBAR,
                                  fontWeight: weight.bold,
                                  color: textEnab_(context),
                                ),
                              ),
                            ),

                          Positioned.fill(child: Blur(sigma: 3, child: Container())),

                          SelectableText(
                            nickProcessing?'Generowanie...':AccountData.nick!,
                            textAlign: TextAlign.center,
                            style: AppTextStyle(
                              fontSize: Dimen.TEXT_SIZE_APPBAR,
                              fontWeight: nickProcessing || !AccountData.nickSearchable?weight.normal:weight.bold,
                              color: nickProcessing || !AccountData.nickSearchable?textDisab_(context):iconEnab_(context),
                            ),
                          ),


                        ],
                      ),
                    ),

                    Consumer<ConnectivityProvider>(
                      builder: (context, prov, child) => IconButton(
                        icon: Icon(MdiIcons.refresh),
                        onPressed: !prov.connected || nickProcessing || !AccountData.nickSearchable?null:() => onNickChanged(),
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
                        data: AccountData.nick!,
                        version: QrVersions.auto,
                        eyeStyle: QrEyeStyle(
                            eyeShape: QrEyeShape.square,
                            color: AccountData.nickSearchable?
                            ColorPack.DEF_ICON_ENAB:
                            ColorPack.DEF_ICON_DISAB
                        ),
                        dataModuleStyle: QrDataModuleStyle(
                            dataModuleShape: QrDataModuleShape.square,
                            color: AccountData.nickSearchable?
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



