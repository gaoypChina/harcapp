import 'dart:async';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_edit_page.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import 'folder.dart';

Future<void> openFolderSelector<T extends Folder>(
    BuildContext context,
    { String? title,
      String? countString,
      required List<T> Function() getAllFolders,
      required FutureOr<void> Function(String, String, String) onNewFolderSave,
      required void Function(T, bool?) onCheckedChange,
      required bool Function(T) isSelected
    }) => showScrollBottomSheet(
    context: context,
    builder: (context) => BottomSheetDef(
      title: title??'Wybierz foldery',
      builder: (context) => FolderSelector<T>(
        countString: countString,
        getAllFolders: getAllFolders,
        onNewFolderSave: onNewFolderSave,
        onCheckedChange: onCheckedChange,
        isSelected: isSelected,
      ),
    )
);

class FolderSelector<T extends Folder> extends StatefulWidget{

  final String? countString;
  final List<T> Function() getAllFolders;
  final FutureOr<void> Function(String, String, String) onNewFolderSave;
  final void Function(T, bool?) onCheckedChange;
  final bool Function(T) isSelected;

  const FolderSelector(
      { this.countString,
        required this.getAllFolders,
        required this.onNewFolderSave,
        required this.onCheckedChange,
        required this.isSelected,
        super.key
      });

  @override
  State<StatefulWidget> createState() => FolderSelectorState<T>();

}

class FolderSelectorState<T extends Folder> extends State<FolderSelector<T>>{

  String? get countString => widget.countString;
  List<T> Function() get getAllFolders => widget.getAllFolders;
  FutureOr<void> Function(String, String, String) get onNewFolderSave => widget.onNewFolderSave;
  FutureOr<void> Function(T, bool?) get onCheckedChange => widget.onCheckedChange;
  bool Function(T) get isSelected => widget.isSelected;

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];
    for(T folder in getAllFolders())
      children.add(_FolderSelectTile<T>(
          folder,
          countString: countString,
          onCheckedChange: onCheckedChange,
          isSelected: isSelected
      ));

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
                onSave: (String name, String iconKey, String colorsKey) async {
                  await onNewFolderSave.call(name, iconKey, colorsKey);
                  setState((){});
                },
              ))
            )
        )
      ],
    );

  }
}

class _FolderSelectTile<T extends Folder> extends StatefulWidget{

  final T folder;
  final String? countString;
  final FutureOr<void> Function(T, bool?) onCheckedChange;
  final bool Function(T) isSelected;

  const _FolderSelectTile(this.folder, {this.countString, required this.onCheckedChange, required this.isSelected});

  @override
  State<StatefulWidget> createState() => _FolderSelectTileState<T>();

}

class _FolderSelectTileState<T extends Folder> extends State<_FolderSelectTile<T>>{

  T get folder => widget.folder;
  String? get countString => widget.countString;
  FutureOr<void> Function(T, bool?) get onCheckedChange => widget.onCheckedChange;
  bool Function(T) get isSelected => widget.isSelected;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(top:  Dimen.ICON_MARG/2, bottom:  Dimen.ICON_MARG/2, right:  Dimen.ICON_MARG*2),
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
      Checkbox(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimen.ICON_SIZE)),
        activeColor: folder.colorsData.avgColor,
        value: isSelected.call(folder),
        onChanged: (checked) async {
          await onCheckedChange.call(folder, checked);
          setState((){});
        }
      )

    ],
  );

}