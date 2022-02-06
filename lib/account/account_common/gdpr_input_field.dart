
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/main_page_new.dart';
import 'package:harcapp/account/account_start/input_field_controller.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class GDPRInputField extends StatelessWidget{

  static const String accepted = 'Wyrażam zgodę';
  static const String notAccepted = 'Nie wyrażam zgody';

  static const IconData acceptedIcon = MdiIcons.checkboxMarkedCircleOutline;
  static const IconData notAcceptedIcon = MdiIcons.closeCircleOutline;

  final bool gdprAccepted;
  final bool enabled;
  final InputFieldController controller;
  final void Function(bool) onAcceptChanged;

  const GDPRInputField(this.gdprAccepted, {this.enabled = true, this.controller, this.onAcceptChanged});

  @override
  Widget build(BuildContext context) {

    final GlobalKey _widgetKey = GlobalKey();

    InputFieldController _controller = controller??InputFieldController();

    void Function() onTap = () async {

      final RenderBox renderBoxRed = _widgetKey.currentContext.findRenderObject();
      final position = renderBoxRed.localToGlobal(Offset.zero);

      bool selGdprAccepted = await showChooseGdprAcceptDialog(
          context,
          position.dy - Provider.of<MainProvider>(context, listen: false).statusBarHeight,
          gdprAccepted
      );

      if(selGdprAccepted != null){
        onAcceptChanged?.call(selGdprAccepted);
        _controller.errorDimed = true;
      }
    };

    return Stack(
      children: [

        GestureDetector(
          onTap: enabled?() => showContent(context):null,
          child: InputField(
            hint: 'Polityka prywatności *',
            controller: _controller,
            hintTextColor: enabled && gdprAccepted != null?textEnab_(context):textDisab_(context),
            enabled: false,
            leading: Icon(MdiIcons.lockCheckOutline, color: iconDisab_(context)),
          ),
        ),

        Row(
          children: [
            Expanded(child: Container()),
            IconButton(
                key: _widgetKey,
                icon: Icon(gdprAccepted==null?MdiIcons.circleOutline:(gdprAccepted?acceptedIcon:notAcceptedIcon)),
                onPressed: enabled?onTap:null
            )
          ],
        ),

      ],
    );
  }

}

class ChooseGdprAcceptDialog extends StatelessWidget{

  final bool gdprAccept;
  final double top;
  final void Function(bool) onSelected;

  const ChooseGdprAcceptDialog(this.gdprAccept, this.top, {this.onSelected});

  @override
  Widget build(BuildContext context) {

    Widget yesButton = SimpleButton.from(
        margin: EdgeInsets.zero,
        context: context,
        icon: GDPRInputField.acceptedIcon,
        textColor: gdprAccept == true?iconEnab_(context):iconDisab_(context),
        iconLeading: false,
        text: GDPRInputField.accepted,
        onTap: () => onSelected?.call(true)
    );

    Widget noButton = SimpleButton.from(
        margin: EdgeInsets.zero,
        context: context,
        icon: GDPRInputField.notAcceptedIcon,
        textColor: gdprAccept == false?iconEnab_(context):iconDisab_(context),
        iconLeading: false,
        text: GDPRInputField.notAccepted,
        onTap: () => onSelected?.call(false)
    );

    return Stack(
      children: [

        Positioned(
            top: top,
            right: 2*Dimen.SIDE_MARG,
            child: Material(
              borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
              child: SizedBox(
                //width: (MediaQuery.of(context).size.width - 4*Dimen.SIDE_MARG)/2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children:
                  gdprAccept == true?[
                  yesButton,
                  noButton
                  ]:[
                  noButton,
                  yesButton,
                  ],
                ),
              ),
            )
        )

      ],
    );
  }

}

Future<bool> showChooseGdprAcceptDialog(BuildContext context, double top, bool gdprAccept) async {

  bool _gdprAccept;

  await openDialog(
      context: context,
      builder: (context) => ChooseGdprAcceptDialog(
          gdprAccept,
          top,
          onSelected: (selGdprAccept){
            _gdprAccept = selGdprAccept;
            Navigator.pop(context);
          }
      )
  );

  return _gdprAccept;

}

Future<void> showContent(BuildContext context) async {

  String content = await readStringFromAssets('assets/account/gdpr_v1');

  await openDialog(
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.all(Dimen.SIDE_MARG),
        child: Material(
            color: background_(context),
            borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  floating: true,
                  title: Text('Polityka prywatności'),
                  centerTitle: true,
                ),

                SliverPadding(
                  padding: EdgeInsets.all(Dimen.SIDE_MARG),
                  sliver: SliverList(delegate: SliverChildListDelegate([
                    Text(content, style: AppTextStyle())
                  ])),
                )

              ],
            )
        ),
      )
  );

}