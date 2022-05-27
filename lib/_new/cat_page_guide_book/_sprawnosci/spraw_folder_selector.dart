import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_edit_page.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import 'spraw_folder_page/spraw_folder.dart';

Future<void> openSprawFolderSelector(BuildContext context, String sprawUID) async{

  await showScrollBottomSheet(
      context: context,
      builder: (context) => BottomSheetDef(
        title: 'Wybierz foldery',
        builder: (context) => SprawFolderSelector(sprawUID),
      )
  );

}

class SprawFolderSelector extends StatefulWidget{

  final String sprawUID;

  const SprawFolderSelector(this.sprawUID, {super.key});

  @override
  State<StatefulWidget> createState() => SprawFolderSelectorState();

}

class SprawFolderSelectorState extends State<SprawFolderSelector>{

  String get sprawUID => widget.sprawUID;

  late List<SprawFolder> folders;

  @override
  void initState() {
    folders = SprawFolder.allFolders;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];
    for(SprawFolder folder in folders)
      children.add(_SprawFolderSelectItem(sprawUID, folder));

    return Column(
      children: [
        Column(children: children),

        const SizedBox(height: Dimen.SIDE_MARG),

        SimpleButton(
          radius: AppCard.BIG_RADIUS,
          clipBehavior: Clip.none,
          padding: EdgeInsets.zero,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: Dimen.ICON_MARG/2, right:  Dimen.ICON_MARG*2),
                  child: FolderWidget.empty(size: 64.0),
                ),
                Expanded(
                  child: Text(
                      '+ Nowy folder',
                      style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
                      textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(width: 64.0),

              ],
            ),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FolderEditPage(
                  onSave: (String name, String iconKey, String colorKey){
                    SprawFolder folder = SprawFolder.create();
                    folder.name = name;
                    folder.colorsKey = colorKey;
                    folder.iconKey = iconKey;
                    setState(() => folders = SprawFolder.allFolders);
                  },
                ))
            )
        )
      ],
    );

  }
}

class _SprawFolderSelectItem extends StatefulWidget{

  final String sprawUID;
  final SprawFolder folder;

  const _SprawFolderSelectItem(this.sprawUID, this.folder);

  @override
  State<StatefulWidget> createState() => _SprawFolderSelectItemState();

}

class _SprawFolderSelectItemState extends State<_SprawFolderSelectItem>{

  String get sprawUID => widget.sprawUID;
  SprawFolder get folder => widget.folder;

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top:  Dimen.ICON_MARG/2, bottom:  Dimen.ICON_MARG/2, right:  Dimen.ICON_MARG*2),
          child: FolderWidget(folder.iconKey, folder.colorsKey, size: 64.0),
        ),
        Expanded(
          child: Text(folder.name, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold)),
        ),
        Checkbox(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimen.ICON_SIZE)),
            activeColor: folder.colorData.avgColor,
            value: folder.sprawUIDs.contains(sprawUID),
            onChanged: (selected){
              if(selected!) folder.add(sprawUID);
              else folder.remove(sprawUID);
              setState(() {});
            }
        )

      ],
    );
  }

}