import 'package:dio/dio.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/api/user.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_start/input_field_controller.dart';
import 'package:harcapp/account/account_start/part_template.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../account_start/input_field_controller.dart';


class AccountNickPart extends StatefulWidget{

  final EdgeInsets? padding;

  const AccountNickPart({this.padding, super.key});

  @override
  State<StatefulWidget> createState() => AccountNickPartState();

}

class AccountNickPartState extends State<AccountNickPart>{

  InputFieldController? nickController;
  late InputFieldController nickSearchableController;

  late bool nickProcessing;
  late bool nickSearchableProcessing;

  String? errMessage;

  void onNickChanged() async {

    nickController!.errorText = '';
    nickSearchableController.errorText = '';

    setState(() => nickProcessing = true);

    await ApiUser.resetNick(
        onSuccess: (String? nick) async {
          await AccountData.writeNick(nick);
          nickController!.text = nick!;
        },
        onError: (Response? response){
          try{

            Map? errMap = response!.data['errors'];

            if(errMap != null) {
              nickSearchableController.errorText = errMap[ApiUser.UPDATE_REQ_NICK_SEARCHABLE] ?? '';
              nickController!.errorText = errMap['nick'] ?? '';
            }

            errMessage = response.data['error'];

          }catch (e){ showAppToast(context, text: 'Coś nie siadło.'); }

        }
    );

    setState(() => nickProcessing = false);

  }

  void onNickSearchableChanged() async {

    nickSearchableController.errorText = '';

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
            if(errMap != null) {
              nickSearchableController.text = errMap[ApiUser.UPDATE_REQ_NICK_SEARCHABLE] ?? '';
              nickController!.errorText = errMap['nick'] ?? '';
            }
            errMessage = response.data['error'];

          }catch (e){ showAppToast(context, text: 'Coś nie siadło.'); }

        }
    );

    setState(() => nickSearchableProcessing = false);

  }

  @override
  void initState() {
    nickController = InputFieldController(text: AccountData.nick);
    nickSearchableController = InputFieldController();

    nickProcessing = false;
    nickSearchableProcessing = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: widget.padding!,
    child: PartTemplate(
        title: 'Kod publiczny',
        heroTag: null,
        errorMessage: errMessage,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            TitleShortcutRowWidget(
                title: 'Jak mnie znaleźć',
                leading: const SizedBox(width: Dimen.SIDE_MARG),
                textAlign: TextAlign.start,
                titleColor: hintEnab_(context)
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: Dimen.SIDE_MARG,
                  right: Dimen.SIDE_MARG,
                  bottom: Dimen.SIDE_MARG
              ),
              child: AppText(
                'W celu ochrony prywatności wyszukać inne konto można jedynie po tymczasowo przypisywanym <b>kodzie publicznym</b>. Wykrywalność konta można także wyłączyć.\n\nKod publiczny można zmienić raz na 2 dni.',
                color: hintEnab_(context),
              ),
            ),

            InputField(
                hint: 'Daj się wyszukiwać:',
                hintTextColor: textEnab_(context),
                enabled: false,
                leading: Icon(
                    AccountData.nickSearchable?
                    MdiIcons.broadcast:
                    MdiIcons.broadcastOff,
                    color: iconDisab_(context)
                ),
                trailing: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: nickSearchableProcessing?0.5:1.0,
                  child: Consumer<ConnectivityProvider>(
                    builder: (context, prov, child) => Switch(
                      value: nickSearchableProcessing?!AccountData.nickSearchable:AccountData.nickSearchable,
                      onChanged: !prov.connected || nickSearchableProcessing?null:(value) => onNickSearchableChanged(),
                    ),
                  ),
                )
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            InputField(
              hint: 'Kod publiczny:',
              controller: nickController,
              textColor: nickProcessing || !AccountData.nickSearchable?textDisab_(context):textEnab_(context),
              enabled: false,
              leading: Icon(MdiIcons.podcast, color: iconDisab_(context)),
            ),

            Row(
              children: [

                Expanded(
                  child: SimpleButton.from(
                      context: context,
                      icon: MdiIcons.qrcode,
                      textColor: nickProcessing || !AccountData.nickSearchable?iconDisab_(context):iconEnab_(context),
                      text: 'Udostępnij',
                      onTap: nickProcessing || !AccountData.nickSearchable?null:() => openDialog(
                          context: context,
                          builder: (context) => Center(
                            child: Padding(
                              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                              child: Material(
                                  color: ColorPack.DEF_BACKGROUND,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  borderRadius: BorderRadius.circular(AppCard.bigRadius),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AppBar(
                                        title: const Text('Udostępnij kod publiczny'),
                                        centerTitle: true,
                                        elevation: 0,
                                      ),
                                      QrImageView(
                                        data: AccountData.nick!,
                                        version: QrVersions.auto,
                                        foregroundColor: ColorPack.DEF_ICON_ENAB,
                                      ),
                                    ],
                                  )
                              ),
                            )
                          )
                      )
                  ),
                ),

                Expanded(
                  child: Consumer<ConnectivityProvider>(
                      builder: (context, prov, child) => SimpleButton.from(
                          context: context,
                          icon: nickProcessing?null:MdiIcons.refresh,
                          iconLeading: false,
                          textColor: !prov.connected || nickProcessing || !AccountData.nickSearchable?iconDisab_(context):iconEnab_(context),
                          text: nickProcessing?'Generowanie...':'Nowy kod',
                          onTap: !prov.connected || nickProcessing || !AccountData.nickSearchable?null:() => onNickChanged()
                      )
                  ),
                )

              ],
            ),

            const SizedBox(height: 2*Dimen.SIDE_MARG),

          ],
        )
    ),
  );

}

class RotatingHarcAppLogo extends StatefulWidget{

  static const defSize = 48.0;

  final double size;
  final Color? color;

  const RotatingHarcAppLogo({this.size = defSize, this.color, super.key});

  @override
  State<StatefulWidget> createState() => RotatingHarcAppLogoState();

}

class RotatingHarcAppLogoState extends State<RotatingHarcAppLogo>{

  static const List<Color> colors = [Colors.red, Colors.orange, Colors.amber, Colors.teal, Colors.green, Colors.blue, Colors.deepPurple];

  FlipCardController? controller;

  void flip()async{
    while(true){
      if(!mounted)
        return;
      controller!.toggleCard();
      setState((){
        if(colorIdx < colors.length - 2)
          colorIdx++;
        else
          colorIdx = 0;
      });
      await Future.delayed(const Duration(milliseconds: 800));
    }
  }

  late int colorIdx;

  @override
  void initState() {
    controller = FlipCardController();
    colorIdx = 0;
    flip();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => FlipCard(
    front: HarcAppWidget(color: colors[colorIdx + 1 - (colorIdx % 2)]),
    back: HarcAppWidget(color: colors[colorIdx - (colorIdx % 2)]),
    controller: controller,
    flipOnTouch: false,
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



