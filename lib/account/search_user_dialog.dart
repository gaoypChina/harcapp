import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_app_common/accounts/account_header_widget.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/scan_qr_code.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';
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

  static const String defButtonText = 'Wybierz';

  final String? title;
  final String? buttonText;
  final void Function(UserDataNick)? onUserSelected;

  final bool Function(UserData)? isUserIllegal;
  final String? illegalAttemptMessage;

  const SearchUserWidget({this.title, this.buttonText, this.onUserSelected, this.isUserIllegal, this.illegalAttemptMessage, super.key});

  @override
  State<StatefulWidget> createState() => SearchUserWidgetState();

}

class SearchUserWidgetState extends State<SearchUserWidget>{

  String? get title => widget.title;
  String? get buttonText => widget.buttonText;
  bool get withAppBar => widget.title != null;
  void Function(UserDataNick)? get onUserSelected => widget.onUserSelected;
  bool Function(UserData) get isUserIllegal => widget.isUserIllegal??(user) => false;
  String? get illegalAttemptMessage => widget.illegalAttemptMessage;

  late TextEditingController controller;

  UserDataNick? userData;
  late bool illegalUserSelected;

  String? noSuchUser;
  _State? _state;

  void runSearch(){
    if(controller.text.isEmpty){
      showAppToast(context, text: 'Szukasz <b>nikogo</b>?');
      return;
    }

    setState((){
      noSuchUser = null;
      _state = _State.searching;
    });

    ApiUser.searchByNick(
      controller.text,
      onSuccess: (UserDataNick userData){
        this.userData = userData;
        setState(() {
          illegalUserSelected = isUserIllegal(userData);
          _state = _State.found;
        });
      },
      onError: (bool noSuchUser) => setState((){
        if(noSuchUser) {
          this.noSuchUser = controller.text;
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
    controller.addListener(() => setState((){}));

    illegalUserSelected = false;
    _state = _State.init;

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){

    Widget searchByQrButton = IconButton(
        icon: Icon(MdiIcons.qrcodeScan),
        onPressed: () async {
          if(await Permission.camera.request().isGranted) {
            String? nick = await scanQrCode();
            if(nick == null) return;
            controller.text = nick;
            runSearch();
          }
        }
    );

    Widget runTextSearchButton = IconButton(
        icon: Icon(MdiIcons.magnify),
        onPressed: runSearch
    );

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          child: Material(
            color: background_(context),
            borderRadius: BorderRadius.circular(AppCard.bigRadius),
            clipBehavior: Clip.hardEdge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [

                if(withAppBar)
                  AppBar(
                    elevation: 0,
                    title: Text(title!),
                    centerTitle: true,
                  ),

                Flexible(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
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
                          leading: withAppBar?
                          searchByQrButton:
                          IconButton(
                            icon: Icon(MdiIcons.arrowLeft),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          trailing:
                          withAppBar?
                          runTextSearchButton:
                          AnimatedChildSlider(
                              index: controller.text.isEmpty?0:1,
                              children: [

                                searchByQrButton,

                                runTextSearchButton,

                              ]
                          ),
                        ),
                      ),

                      if(_state == _State.init)
                        SizedBox(
                          height: 200,
                          child: Column(
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
                                  'Gdzie znaleźć kod publiczny?\nUżytkownik, którego szukasz ma go\nw <b>panelu konta HarcApp</b></b>.',
                                  textAlign: TextAlign.center,
                                  color: hintEnab_(context),
                                  size: Dimen.TEXT_SIZE_BIG,
                                ),
                              )

                            ],
                          ),
                        ),

                      if(_state == _State.searching)
                        SizedBox(
                          height: 200,
                          child: Center(
                            child: SpinKitChasingDots(
                              color: accent_(context),
                              size: Dimen.ICON_SIZE,
                            ),
                          ),
                        ),

                      if(_state == _State.found)
                        Padding(
                          padding: const EdgeInsets.all(Dimen.defMarg),
                          child: Material(
                            color: cardEnab_(context),
                            borderRadius: BorderRadius.circular(AppCard.bigRadius),
                            child: Padding(
                                padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                                child: AccountHeaderWidget.fromUserData(
                                    userData!,
                                    thumbnailBorderColor: background_(context),
                                    thumbnailMarkerColor: textEnab_(context)
                                )
                            ),
                          ),
                        ),

                      if(_state == _State.noSuchUser)
                        SizedBox(
                          height: 200,
                          child: EmptyMessageWidget(
                              text: 'Nie ma nikogo o kodzie:\n$noSuchUser',
                              icon: MdiIcons.accountOffOutline
                          ),
                        ),

                      if(_state == _State.error)
                        SizedBox(
                          height: 200,
                          child: EmptyMessageWidget(
                              text: 'Coś poszło nie tak...',
                              icon: MdiIcons.alertCircleOutline
                          ),
                        ),

                    ],
                  ),
                ),

                if(userData != null)
                  SimpleButton.from(
                      context: context,
                      margin: EdgeInsets.zero,
                      radius: 0,
                      iconLeading: false,
                      icon: MdiIcons.check,
                      text: buttonText??SearchUserWidget.defButtonText,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

}


Future<UserDataNick?> openSearchUserDialog(
    BuildContext context,
    { String? title,
      String? buttonText,
      bool Function(UserData)? isUserIllegal,
      String? illegalAttemptMessage
    }) async {

  UserDataNick? userData;

  await openDialog(
    context: context,
    builder: (context) => SearchUserWidget(
      title: title,
      onUserSelected: (UserDataNick data) => userData = data,
      isUserIllegal: isUserIllegal,
      illegalAttemptMessage: illegalAttemptMessage,
      buttonText: buttonText,
    )
  );

  return userData;

}