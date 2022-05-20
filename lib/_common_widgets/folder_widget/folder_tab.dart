import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_icon.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

class FolderTab extends StatelessWidget implements PreferredSizeWidget{

  final String iconKey;
  final String colorsKey;
  final String folderName;
  final String countText;
  const FolderTab({
    required this.iconKey,
    required this.colorsKey,
    required this.folderName,
    required this.countText,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Tab(/*Lk_9_28b-36$text: '${folder.name} (${folder.spraws.length})'*/icon: Row(
    children: [
      const SizedBox(width: 24.0,),
      FolderIcon(iconKey, colorsKey),
      const SizedBox(width: 32.0,),
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(folderName, style: AppTextStyle(fontWeight: weight.halfBold)),
            Text(countText, style: AppTextStyle()),
          ]
      ),
      //SizedBox(width: 24.0,),
      //Text('${folder.sprawUIDs.length}', style: AppTextStyle(fontWeight: weight.bold)),
      const SizedBox(width: 32.0),
    ],
  ));

  @override
  Size get preferredSize => const Tab(text: '').preferredSize;

}