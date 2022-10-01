import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'folder_edit_page.dart';

class AddFolderWidget extends StatelessWidget{

  final String text;
  final void Function(String, String, String) onSave;

  const AddFolderWidget({
    required this.text,
    required this.onSave,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      Icon(
        MdiIcons.folderPlusOutline,
        size: 84,
        color: hintEnab_(context),
      ),

      const SizedBox(height: 24.0),

      AppText(
        text,
        size: Dimen.TEXT_SIZE_BIG,
        color: hintEnab_(context),
        height: 1.2,
      ),

      const SizedBox(height: 2*24.0),

      SimpleButton.from(
        context: context,
        icon: MdiIcons.plus,
        text: 'Nowy folder',
        onTap: () => pushPage(
          context,
          builder: (context) => FolderEditPage(
            onSave: onSave,
          )
        ),
      )

    ],
  );

}