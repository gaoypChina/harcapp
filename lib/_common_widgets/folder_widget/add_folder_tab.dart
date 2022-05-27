import 'package:flutter/material.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

import 'folder_icon.dart';

class AddFolderTab extends StatelessWidget implements PreferredSizeWidget{

  const AddFolderTab({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Tab(icon: Row(
    children: [
      const SizedBox(width: 24.0,),
      const Icon(MdiIcons.folderPlusOutline, size: FolderIcon.defSize),
      const SizedBox(width: 32.0,),
      const SizedBox(width: Dimen.ICON_MARG),
      Text('Nowy folder', style: AppTextStyle(fontWeight: weight.halfBold)),
      const SizedBox(width: 32.0),
    ],
  ));

  @override
  Size get preferredSize => const Tab(text: '').preferredSize;

}