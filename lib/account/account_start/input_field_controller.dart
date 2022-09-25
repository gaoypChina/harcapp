import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class InputFieldController extends TextEditingController{

  String? _errorText = '';
  String? get errorText => _errorText;
  set errorText(String? value){
    _errorText = value;
    _errorDimed = false;

    for(void Function() listener in errorTextListeners)
      listener.call();
  }

  bool _errorDimed = false;
  bool get errorDimed => _errorDimed;
  set errorDimed(bool value){
    _errorDimed = value;

    for(void Function() listener in errorTextListeners)
      listener.call();
  }

  late List<void Function()> errorTextListeners;

  InputFieldController({String? text}):super(text: text??''){
    errorTextListeners = [];
  }

  void _addErrorListener(void Function() listener) => errorTextListeners.add(listener);
  void _removeErrorListener(void Function() listener) => errorTextListeners.remove(listener);

  @override
  void dispose() {
    errorTextListeners.clear();
    super.dispose();
  }

}

class InputField extends StatefulWidget{

  static const double height = 2*Dimen.TEXT_FIELD_PADD + Dimen.TEXT_SIZE_BIG;

  final String? hintTop;
  final String hint;
  final InputFieldController? controller;
  final Widget? leading;
  final Widget? trailing;
  final Color? hintTextColor;
  final Color? textColor;
  final bool? isPassword;
  final bool noUnderline;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  final bool? enabled;
  final bool autofocus;

  const InputField({
    this.hintTop,
    required this.hint,
    this.controller,
    this.leading,
    this.trailing,
    this.hintTextColor,
    this.textColor,
    this.enabled = true,
    this.autofocus = false,
    this.isPassword = false,
    this.noUnderline = true,
    this.maxLength,
    this.inputFormatters,
    super.key});

  @override
  State<StatefulWidget> createState() => InputFieldState();
}

class InputFieldState extends State<InputField>{

  String? oldError;

  InputFieldController? _controller;

  InputFieldController? get controller => widget.controller??_controller;

  void onErrorChanged(){
    setState((){});
  }

  @override
  void initState() {
    if(widget.controller == null)
      _controller = InputFieldController();

    controller!._addErrorListener(onErrorChanged);

    super.initState();
  }

  @override
  void dispose() {
    controller!._removeErrorListener(onErrorChanged);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    child: Stack(
      children: <Widget>[

        Row(
          children: <Widget>[
            const SizedBox(width: Dimen.ICON_MARG),
            if(widget.leading != null)
              widget.leading!,
            if(widget.leading != null)
              const SizedBox(width: Dimen.ICON_MARG),
            Expanded(
                child: AppTextFieldHint(
                  hintTop: widget.hintTop,
                  hint: widget.hint,
                  controller: widget.controller,
                  enabled: widget.enabled,
                  style: AppTextStyle(color: widget.textColor??(widget.enabled!?textEnab_(context):textDisab_(context)), fontSize: Dimen.TEXT_SIZE_BIG),
                  hintStyle: AppTextStyle(color: widget.hintTextColor??hintEnab_(context), fontSize: Dimen.TEXT_SIZE_BIG),
                  showUnderline: !widget.noUnderline,
                  onAnyChanged: (text) => setState(() => controller!.errorDimed = true),
                  inputFormatters: widget.inputFormatters,
                  obscureText: widget.isPassword!,
                  autofocus: widget.autofocus,
                )
            ),
            if(widget.trailing != null)
              widget.trailing!
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Align(
            alignment: Alignment.topRight,
            child: AnimatedOpacity(
              opacity: controller!.errorText!=null?(controller!.errorDimed?0.3:1):0,
              duration: const Duration(milliseconds: 350),
              child: Text(
                translate(controller!.errorText??''),
                style: AppTextStyle(color: Colors.red, fontSize: Dimen.TEXT_SIZE_TINY),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

class InputFieldPassword extends StatefulWidget{

  final String? hintTop;
  final String hint;
  final InputFieldController? controller;
  final Widget? leading;
  final Color? hintTextColor;
  final Color? textColor;
  final bool noUnderline;
  final int? maxLength;
  final bool autofocus;

  final bool enabled;

  const InputFieldPassword({
    this.hintTop,
    required this.hint,
    this.controller,
    this.leading,
    this.hintTextColor,
    this.textColor,
    this.noUnderline = true,
    this.maxLength,
    this.autofocus = false,

    this.enabled = true,
    super.key});

  @override
  State<StatefulWidget> createState() => InputFieldPasswordState();

}

class InputFieldPasswordState extends State<InputFieldPassword>{

  bool? hidePass;

  @override
  void initState() {
    hidePass = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InputField(
      hintTop: widget.hintTop,
      hint: widget.hint,
      controller: widget.controller,
      leading: widget.leading,
      hintTextColor: widget.hintTextColor,
      textColor: widget.textColor,
      noUnderline: widget.noUnderline,
      enabled: widget.enabled,
      autofocus: widget.autofocus,
      isPassword: hidePass,
      inputFormatters:[
        LengthLimitingTextInputFormatter(widget.maxLength),
      ],
      trailing: IconButton(
        icon: Icon(hidePass!?MdiIcons.eyeOutline:MdiIcons.eyeOffOutline),
        onPressed: widget.enabled?() => setState(() => hidePass = !hidePass!):null,
      ),
    );
  }

}