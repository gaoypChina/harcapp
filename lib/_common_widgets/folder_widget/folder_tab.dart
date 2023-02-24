import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_icon.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

class FolderBaseTab extends StatelessWidget implements PreferredSizeWidget{

  final Widget leading;
  final String name;
  const FolderBaseTab({
    required this.leading,
    required this.name,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Tab(icon: Row(
    children: [
      const SizedBox(width: 24.0,),
      leading,
      const SizedBox(width: 32.0,),
      Text(name, style: AppTextStyle(fontWeight: weight.halfBold)),
      const SizedBox(width: 32.0),
    ],
  ));

  @override
  Size get preferredSize => const Tab(text: '').preferredSize;

}

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
  Widget build(BuildContext context) => Tab(icon: Row(
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
      const SizedBox(width: 32.0),
    ],
  ));

  @override
  Size get preferredSize => const Tab(text: '').preferredSize;

}