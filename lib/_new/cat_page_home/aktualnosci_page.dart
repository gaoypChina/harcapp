import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AktualnosciPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [

        TitleShortcutRowWidget(title: 'Moje punkty'),
        ListTile(
          leading: Icon(MdiIcons.musicNotePlus, color: ColorPackSongBook.ACCENT_COLOR),
          title: Text('Dodane piosenki:', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR),),
          trailing: Text('12', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.halfBold),),
        ),
        ListTile(
          leading: Icon(MdiIcons.foodVariant, color: Colors.teal),
          title: Text('Dodane posiłki:', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR),),
          trailing: Text('2', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.halfBold),),
        )

      ],
    );
  }

}