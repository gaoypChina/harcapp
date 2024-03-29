import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';

class CheckBox extends StatelessWidget{

  final bool? value;
  final void Function(bool?)? onChanged;

  final Color? checkColor;
  final Color? activeColor;
  final Color? unselectedWidgetColor;

  final bool enabled;
  final bool tristate;

  const CheckBox({super.key, this.value, this.onChanged, this.checkColor, this.activeColor, this.unselectedWidgetColor, this.enabled = true, this.tristate = false});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: unselectedWidgetColor ?? accent_(context)
      ),
      child: Checkbox(
        checkColor: checkColor??cardEnab_(context)!.withAlpha(enabled?255:127),
        activeColor: activeColor!=null?activeColor!.withAlpha(enabled?255:127):null,
        value: value,
        onChanged: enabled?onChanged:null,
        tristate: tristate,
      ),
    );
  }

}