import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/api/user.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp/account/account_tile.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:semaphore_plus/semaphore_plus.dart';

import '../../_common_classes/scan_qr_code.dart';
import '../account_start/input_field_controller.dart';

class ShadowNickInputField extends StatefulWidget{

  final bool enabled;
  final bool dimTextOnDisabled;
  final InputFieldController? controller;
  final bool asterisk;

  const ShadowNickInputField({
    this.enabled = true,
    this.dimTextOnDisabled = true,
    this.controller,
    this.asterisk = false,
    super.key
  });

  @override
  State<StatefulWidget> createState() => ShadowNickInputFieldState();

}

class ShadowNickInputFieldState extends State<ShadowNickInputField>{

  bool get enabled => widget.enabled;
  bool get dimTextOnDisabled => widget.dimTextOnDisabled;
  InputFieldController get controller => widget.controller??_controller!;
  bool get asterisk => widget.asterisk;

  InputFieldController? _controller;

  late LocalSemaphore semaphore;
  late bool isLoading;
  String? searchedShadowUserNick;
  ShadowUserData? shadowUser;
  late int runIndex;

  void onTextChanged() async {
    if(controller.text == searchedShadowUserNick) return;
    if(controller.text.isEmpty){
      runIndex++;
      isLoading = false;
      searchedShadowUserNick = null;
      shadowUser = null;
      setState(() {});
      return;
    }

    setState((){
      isLoading = true;
      searchedShadowUserNick = null;
      shadowUser = null;
    });

    await semaphore.acquire();
    String nick = controller.text;
    int thisRunIndex = ++runIndex;
    semaphore.release();

    await Future.delayed(const Duration(seconds: 2));

    await semaphore.acquire();
    if(thisRunIndex != runIndex) {
      semaphore.release();
      return;
    } else
      runIndex = 0;
    semaphore.release();

    await getShadowUser(nick);
    setState(() => isLoading = false);

  }

  Future<void> getShadowUser(String nick) async {
    await ApiUser.searchByNick(
        nick,
        searchShadow: true,
        searchReal: false,
        onError: (_){

        },
        onSuccess: (UserDataNick user){
          shadowUser = user as ShadowUserData;
        }
    );
    searchedShadowUserNick = nick;
    setState(() {});
  }

  @override
  void initState() {
    if(widget.controller == null)
      _controller = InputFieldController();

    semaphore = LocalSemaphore(1);
    isLoading = false;
    runIndex = 0;

    controller.addListener(onTextChanged);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [

      InputField(
        hint: 'Kod publ. konta widmo:${asterisk?' *':''}',
        hintTop: 'Kod publiczny konta widmo',
        controller: controller,
        enabled: enabled,
        textDisabledColor: dimTextOnDisabled?textDisab_(context):textEnab_(context),
        maxLength: ApiUser.NAME_MAX_LENGTH,
        leading: Icon(MdiIcons.alien, color: iconDisab_(context)),
        trailing: Row(
          children: [

            IconButton(
              icon: Icon(MdiIcons.qrcodeScan),
              onPressed: () async {
                String? nick = await scanQrCode();
                if(nick == null) return;
                controller.text = nick;
              },
            ),

            IconButton(
              icon: Icon(MdiIcons.helpCircleOutline),
              onPressed: () => showAlertDialog(
                  context,
                  title: 'O co chodzi?',
                  content: 'Jeżeli ktoś utworzył Ci <b>konto widmo</b> (np. by dodać Cię do współzawod. nim utworzyłeś konto), dowiedz się jaki jest <b>kod publiczny</b> tegoż konta widmo, <b>by je przejąć</b>.'
                      '\n\nJeżeli nie wiesz o co chodzi, to znak, by zostawić to pole pustym :)',
                  actionBuilder: (context) => [
                    AlertDialogButton(text: 'Wszystko jasne', onTap: () => Navigator.pop(context))
                  ]
              ),
            ),

          ],
        )
      ),

      if(isLoading || !isNullOrEmpty(searchedShadowUserNick) || shadowUser != null)
        SizedBox(
          height: AccountTile.height,
          child: Material(
            color: cardEnab_(context),
            borderRadius: BorderRadius.circular(AppCard.bigRadius),
            child: Center(
              child: Builder(
                builder: (context){

                  if(isLoading)
                    return ListTile(
                      leading: AccountThumbnailWidget(
                        verified: false,
                        elevated: false,
                        borderColor: hintEnab_(context),
                        backgroundColor: cardEnab_(context),
                        child: Center(child: SpinKitChasingDots(size: Dimen.ICON_SIZE, color: hintEnab_(context))),
                      ),
                      title: Text('Ładowanie...', style: AppTextStyle(color: hintEnab_(context), fontWeight: weight.halfBold)),
                    );
                  else if(shadowUser != null)
                    return AccountTile(
                        shadowUser!.name,
                        shadow: true,
                        thumbnailBorderColor: background_(context),
                    );
                  else if(!isNullOrEmpty(searchedShadowUserNick) && !isLoading)
                    return ListTile(
                      leading: AccountThumbnailWidget(
                        verified: false,
                        elevated: false,
                        borderColor: hintEnab_(context),
                        backgroundColor: cardEnab_(context),
                        child: Center(
                          child: Icon(MdiIcons.close, color: hintEnab_(context)),
                        ),
                      ),
                      title: Text(searchedShadowUserNick!, style: AppTextStyle(color: hintEnab_(context))),
                      subtitle: Text('Nie znaleziono konta widmo', style: AppTextStyle(color: hintEnab_(context))),
                    );

                  return Container();

                },
              ),
            ),
          ),
        ),


    ],
  );

}