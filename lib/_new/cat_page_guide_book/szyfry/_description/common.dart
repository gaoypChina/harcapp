import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';

class DescOnlyWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return TitleShortcutRowWidget(title: 'Karta zawiera jedynie opis.');

  }

}