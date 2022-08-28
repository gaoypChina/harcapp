
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/account/account_start/input_field_controller.dart';
import 'package:harcapp/main.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../_app_common/accounts/user_data.dart';

class SexInputField extends StatelessWidget{

  static const String male = 'Mężczyzna';
  static const String female = 'Kobieta';

  static const IconData maleIcon = MdiIcons.faceMan;
  static const IconData femaleIcon = MdiIcons.faceWoman;

  final Sex? sex;
  final bool? enabled;
  final InputFieldController? controller;
  final void Function(Sex)? onSexChanged;

  const SexInputField(this.sex, {this.enabled = true, this.controller, this.onSexChanged, super.key});

  @override
  Widget build(BuildContext context) {

    final GlobalKey _widgetKey = GlobalKey();

    InputFieldController _controller = controller??InputFieldController();

    void Function() onTap = () async {

      final RenderBox renderBoxRed = _widgetKey.currentContext!.findRenderObject() as RenderBox;
      final position = renderBoxRed.localToGlobal(Offset.zero);

      Sex? selSex = await showChooseSexDialog(
          context,
          position.dy - App.statusBarHeight,
          sex
      );

      if(selSex != null){
        onSexChanged?.call(selSex);
        _controller.errorDimed = true;
      }
    };

    return Stack(
      key: _widgetKey,
      children: [

        GestureDetector(
          onTap: enabled!?onTap:null,
          child: InputField(
            hint: 'Płeć:',
            controller: _controller,
            hintTextColor: enabled! && sex != null?textEnab_(context):textDisab_(context),
            enabled: false,
            leading: Icon(MdiIcons.genderMaleFemale, color: iconDisab_(context)),
          ),
        ),

        Positioned(
          right: 0,
          child: SimpleButton.from(
              context: context,
              margin: EdgeInsets.zero,
              textColor: enabled!?iconEnab_(context):iconDisab_(context),
              icon: sex==null?MdiIcons.circleOutline:(sex==Sex.male?maleIcon:femaleIcon),
              text: sex==null?'Wybierz':(sex==Sex.male?male:female),
              iconLeading: false,
              onTap: enabled!?onTap:null
          ),
        )

      ],
    );
  }

}

class ChooseSexDialog extends StatelessWidget{

  final Sex? sex;
  final double top;
  final void Function(Sex)? onSelected;

  const ChooseSexDialog(this.sex, this.top, {this.onSelected, super.key});

  @override
  Widget build(BuildContext context) {

    Widget womanButton = SimpleButton.from(
        margin: EdgeInsets.zero,
        context: context,
        icon: MdiIcons.faceWoman,
        textColor: sex == Sex.female?iconEnab_(context):iconDisab_(context),
        iconLeading: false,
        text: SexInputField.female,
        onTap: () => onSelected?.call(Sex.female)
    );

    Widget manButton = SimpleButton.from(
        margin: EdgeInsets.zero,
        context: context,
        icon: MdiIcons.faceMan,
        textColor: sex == Sex.male?iconEnab_(context):iconDisab_(context),
        iconLeading: false,
        text: SexInputField.male,
        onTap: () => onSelected?.call(Sex.male)
    );

    return Stack(
      children: [

        Positioned(
            top: top,
            right: 2*Dimen.SIDE_MARG,
            child: Material(
              borderRadius: BorderRadius.circular(AppCard.bigRadius),
              child: SizedBox(
                //width: (MediaQuery.of(context).size.width - 4*Dimen.SIDE_MARG)/2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children:
                  sex == Sex.male?[
                  manButton,
                  womanButton
                  ]:[
                  womanButton,
                  manButton,
                  ],
                ),
              ),
            )
        )

      ],
    );
  }

}

Future<Sex?> showChooseSexDialog(BuildContext context, double top, Sex? sex) async {

  Sex? selectedSex;

  await openDialog(
      context: context,
      builder: (context) => ChooseSexDialog(
          sex,
          top,
          onSelected: (sex){
            selectedSex = sex;
            Navigator.pop(context);
          }
      )
  );

  return selectedSex;

}