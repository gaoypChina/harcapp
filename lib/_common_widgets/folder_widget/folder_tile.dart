import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

import 'folder.dart';
import 'folder_widget.dart';

class FolderTile extends StatelessWidget{

  final Folder folder;
  final String? countString;
  final Widget? trailing;

  const FolderTile(this.folder, {this.countString, this.trailing, super.key});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: Dimen.ICON_MARG/2, bottom:  Dimen.ICON_MARG/2, right:  Dimen.ICON_MARG*2),
        child: FolderWidget(folder.iconKey, folder.colorsKey, size: 64.0),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(folder.name, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold)),
            Text('${countString??'Liczba elementów:'} ${folder.count}', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)),
          ],
        ),
      ),
      if(trailing != null) trailing!,

    ],
  );

}