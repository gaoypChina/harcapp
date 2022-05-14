import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NetImagePickerWidget extends StatefulWidget{

  final TextEditingController? controller;

  const NetImagePickerWidget({this.controller, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NetImagePickerWidgetState();

}

class NetImagePickerWidgetState extends State<NetImagePickerWidget>{

  TextEditingController? _controller;

  TextEditingController? get controller => widget.controller??_controller;

  @override
  void initState() {
    if(widget.controller == null)
      _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [

      Image.network(
        controller!.text,
        fit: BoxFit.cover,
        height: 200,
        errorBuilder: (context, __, _) => SizedBox(
          height: 200,
          child: Material(
            color: backgroundIcon_(context),
            child: Icon(
              MdiIcons.linkOff,
              color: background_(context),
              size: 100,
            ),
          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.all(Dimen.ICON_MARG),
        child: AppTextFieldHint(
          hint: 'Link do zdjęcia:',
          hintTop: 'Link do zdjęcia',
          controller: controller,
          onAnyChanged: (_) => setState((){}),
        ),
      )

    ],
  );

}