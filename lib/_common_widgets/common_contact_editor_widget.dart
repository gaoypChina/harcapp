import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common_contact_data.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/multi_text_field.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class CommonContactEditorWidget extends StatefulWidget{

  final CommonContactData? initContactData;
  final void Function(List<String>)? onEmailsChanged;
  final void Function(List<String>)? onPhonesChanged;
  final void Function(List<String>)? onWebsitesChanged;
  final void Function(String)? onOtherChanged;

  const CommonContactEditorWidget({
    this.initContactData,

    this.onEmailsChanged,
    this.onPhonesChanged,
    this.onWebsitesChanged,
    this.onOtherChanged,

    super.key
  });

  @override
  State<StatefulWidget> createState() => CommonContactEditorWidgetState();

}

class CommonContactEditorWidgetState extends State<CommonContactEditorWidget>{

  CommonContactData? get initContactData => widget.initContactData;
  void Function(List<String>)? get onEmailsChanged => widget.onEmailsChanged;
  void Function(List<String>)? get onPhonesChanged => widget.onPhonesChanged;
  void Function(List<String>)? get onWebsitesChanged => widget.onWebsitesChanged;
  void Function(String)? get onOtherChanged => widget.onOtherChanged;

  late MultiTextFieldController emailController;
  late MultiTextFieldController phoneController;
  late MultiTextFieldController websiteController;
  late TextEditingController otherController;

  @override
  void initState() {

    emailController = MultiTextFieldController(texts: initContactData?.email??[]);
    phoneController = MultiTextFieldController(texts: initContactData?.phone??[]);
    websiteController = MultiTextFieldController(texts: initContactData?.website??[]);
    otherController = TextEditingController(text: initContactData?.other);

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [

      AppTextFieldHint(
        hint: 'Email:',
        hintTop: 'Email',
        multiHintTop: 'Emaile',
        multi: true,
        multiExpanded: true,
        multiAddIcon: MdiIcons.plus,
        multiController: emailController,
        style: AppTextStyle(),
        onAnyChanged: (emails) => onEmailsChanged?.call(emails),
      ),

      AppTextFieldHint(
        hint: 'Telefon:',
        hintTop: 'Telefon',
        multiHintTop: 'Telefony',
        multi: true,
        multiExpanded: true,
        multiAddIcon: MdiIcons.plus,
        multiController: phoneController,
        style: AppTextStyle(),
        onAnyChanged: (phones) => onPhonesChanged?.call(phones),
      ),

      AppTextFieldHint(
        hint: 'Strona:',
        hintTop: 'Strona internetowa',
        multiHintTop: 'Strony internetowe',
        multi: true,
        multiExpanded: true,
        multiAddIcon: MdiIcons.plus,
        multiController: websiteController,
        style: AppTextStyle(),
        onAnyChanged: (websites) => onWebsitesChanged?.call(websites),
      ),

      AppTextFieldHint(
        hint: 'Uwaga na marginesie:',
        hintTop: 'Uwaga na marginesie',
        controller: otherController,
        onAnyChanged: (other) => onOtherChanged?.call(other[0]),
        maxLines: null,
      ),

    ],
  );

}