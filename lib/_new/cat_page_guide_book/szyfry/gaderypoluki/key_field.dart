import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../providers.dart';

class KeyField extends StatefulWidget{

  final bool backButton;
  final FocusNode? focusNode;
  final void Function(String key, bool isKeyValid)? onChanged;
  final Widget? trailing;
  final bool enabled;

  const KeyField({
    this.backButton = false,
    this.focusNode,
    this.onChanged,
    this.trailing,
    this.enabled = true,
    super.key});

  @override
  State<StatefulWidget> createState() => KeyFieldState();

}

class KeyFieldState extends State<KeyField>{

  void Function(String key, bool isKeyValid)? get onChanged => widget.onChanged;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SearchField(
      onChanged: (text){

        GaderypolukiProvider prov = Provider.of<GaderypolukiProvider>(context, listen: false);
        prov.input = text;

        if(onChanged != null)
          onChanged!(text, prov.isValid);
      },
      focusNode: widget.focusNode,
      controller: Provider.of<GaderypolukiProvider>(context, listen: false).keyController,
      enabled: widget.enabled,
      hint: 'Klucz szyfru:',
      leading: widget.backButton?
      IconButton(
        icon: Icon(MdiIcons.arrowLeft),
        onPressed: () => Navigator.pop(context),
      ): null,
      trailing: widget.trailing
    );
  }

}