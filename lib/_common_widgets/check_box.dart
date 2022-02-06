import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';

import '../_common_classes/color_pack.dart';

class CheckBox extends StatelessWidget{

  final bool value;
  final Function onChanged;

  final Color checkColor;
  final Color activeColor;
  final Color unselectedWidgetColor;

  final bool enabled;
  final bool tristate;

  const CheckBox({this.value, this.onChanged, this.checkColor, this.activeColor, this.unselectedWidgetColor, this.enabled: true, this.tristate: false});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor:
        unselectedWidgetColor != null?
        unselectedWidgetColor:
        accent_(context)
      ),
      child: Checkbox(
        checkColor: checkColor??cardEnab_(context).withAlpha(enabled?255:127),
        activeColor: activeColor!=null?activeColor.withAlpha(enabled?255:127):null,
        value: value,
        onChanged: enabled?onChanged:null,
        tristate: tristate,
      ),
    );
  }

}