import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_app_common/accounts/account_header_widget.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/scan_qr_code.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/api/user.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

enum _State{
  init,
  searching,
  found,
  noSuchUser,
  error,
}

class SearchUserWidget extends StatefulWidget{

  final String? title;
  final void Function(UserDataNick)? onUserSelected;

  final List<String>? illegalUserKey;
  final String? illegalAttemptMessage;

  const SearchUserWidget({this.title, this.onUserSelected, this.illegalUserKey, this.illegalAttemptMessage, super.key});

  @override
  State<StatefulWidget> createState() => SearchUserWidgetState();

}

class SearchUserWidgetState extends State<SearchUserWidget>{

  String? get title => widget.title;
  void Function(UserDataNick)? get onUserSelected => widget.onUserSelected;
  List<String> get illegalUserKey => widget.illegalUserKey??[];
  String? get illegalAttemptMessage => widget.illegalAttemptMessage;

  TextEditingController? controller;

  UserDataNick? userData;
  late bool illegalUserSelected;

  String? noSuchUser;
  _State? _state;

  void runSearch(){
    if(controller!.text.isEmpty){
      showAppToast(context, text: 'Szukasz <b>nikogo</b>?');
      return;
    }

    setState((){
      noSuchUser = null;
      _state = _State.searching;
    });

    ApiUser.searchByNick(
      controller!.text,
      onSuccess: (UserDataNick userData){
        this.userData = userData;
        setState(() {
          illegalUserSelected = illegalUserKey.contains(userData.key);
          _state = _State.found;
        });
      },
      onError: ({bool? noSuchUser}) => setState((){
        if(noSuchUser!) {
          this.noSuchUser = controller!.text;
          _state = _State.noSuchUser;
        }else{
          _state = _State.error;
        }
      })
    );
  }

  @override
  void initState() {
    controller = TextEditingController();

    illegalUserSelected = false;
    _state = _State.init;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: MediaQuery.of(context).viewInsets,
    child: Center(
      child: SizedBox(
        height: 360,
        child: Padding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          child: Material(
            borderRadius: BorderRadius.circular(AppCard.bigRadius),
            clipBehavior: Clip.hardEdge,
            child: Scaffold(
              resizeToAvoidBottomInset : false,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(
                      top: Dimen.defMarg,
                      left: Dimen.defMarg,
                      right: Dimen.defMarg,
                    ),
                    child:
                    SearchField(
                      controller: controller,
                      hint: 'Szukaj po kodzie publicznym',
                      elevation: 0,
                      margin: EdgeInsets.zero,
                      leading: IconButton(
                        icon: const Icon(MdiIcons.arrowLeft),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      trailing: IconButton(
                          icon: const Icon(MdiIcons.qrcodeScan),
                          onPressed: () async {
                            if(await Permission.camera.request().isGranted) {
                              String? nick = await scanQrCode();
                              if(nick == null) return;
                              controller!.text = nick;
                              runSearch();
                            }
                          }
                      ),
                    ),
                  ),

                  if(_state == _State.init)
                    Expanded(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        const SizedBox(height: Dimen.SIDE_MARG),
                        Icon(MdiIcons.radar, color: backgroundIcon_(context), size: Dimen.ICON_EMPTY_INFO_SIZE),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: Dimen.SIDE_MARG,
                            horizontal: Dimen.SIDE_MARG,
                          ),
                          child: AppText(
                            'Gdzie znaleźć kod publiczny?\nUżytkownik, którego szukasz ma go\nw <b>panelu konta HarcApp</b>,\nw zakładce <b>kod publiczny</b>.',
                            textAlign: TextAlign.center,
                            color: hintEnab_(context),
                            size: Dimen.TEXT_SIZE_BIG,
                          ),
                        )

                      ],
                    )),

                  if(_state == _State.searching)
                    Expanded(child: Center(
                      child: SpinKitChasingDots(
                        color: accent_(context),
                        size: Dimen.ICON_SIZE,
                      ),
                    )),

                  if(_state == _State.found)
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: Dimen.SIDE_MARG,
                              left: Dimen.SIDE_MARG,
                              right: Dimen.SIDE_MARG
                          ),
                          child: AccountHeaderWidget(userData!.name)

                        /*
                          Row(
                            mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                              AccountThumbnailWidget(userData.name, elevated: false),
                              SizedBox(width: Dimen.ICON_MARG),
                              Expanded(child: Text(userData.name, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold))),
                              IconButton(
                                icon: Icon(MdiIcons.check),
                                onPressed: (){
                                  if(illegalUserSelected){
                                    if(illegalAttemptMessage != null)
                                      showAppToast(context, text: illegalAttemptMessage);
                                    return;
                                  }

                                  onUserSelected?.call(userData);
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                           */
                      ),
                    ),

                  if(_state == _State.noSuchUser)
                    Expanded(child: EmptyMessageWidget(
                        text: noSuchUser,
                        icon: MdiIcons.accountOffOutline
                    )),

                  if(_state == _State.error)
                    const Expanded(child: EmptyMessageWidget(
                        text: 'Coś poszło nie tak...',
                        icon: MdiIcons.alertCircleOutline
                    )),

                  Row(
                    children: [

                      Expanded(
                        child: SimpleButton.from(
                            context: context,
                            margin: EdgeInsets.zero,
                            icon: MdiIcons.accountSearch,
                            text: 'Szukaj',
                            onTap: runSearch
                        ),
                      ),

                      if(userData != null)
                        Expanded(
                          child: SimpleButton.from(
                              context: context,
                              margin: EdgeInsets.zero,
                              iconLeading: false,
                              icon: MdiIcons.check,
                              text: 'Dodaj',
                              textColor: illegalUserSelected?hintEnab_(context):iconEnab_(context),
                              onTap: (){
                                if(illegalUserSelected){
                                  if(illegalAttemptMessage != null)
                                    showAppToast(context, text: illegalAttemptMessage!);
                                  return;
                                }

                                onUserSelected?.call(userData!);
                                Navigator.pop(context);
                              }
                          ),
                        )

                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );

}


Future<UserDataNick?> openSearchUserDialog(BuildContext context, {String? title, List<String>? illegalUserKeys, String? illegalAttemptMessage}) async {

  UserDataNick? userData;

  await openDialog(
    context: context,
    builder: (context) => SearchUserWidget(
      title: title,
      onUserSelected: (UserDataNick data) => userData = data,
      illegalUserKey: illegalUserKeys,
      illegalAttemptMessage: illegalAttemptMessage,
    )
  );

  return userData;

}