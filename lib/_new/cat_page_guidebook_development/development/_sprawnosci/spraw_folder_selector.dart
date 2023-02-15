import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_selector_bottom_sheet.dart';

import 'spraw_folder_page/spraw_folder.dart';

Future<void> openSprawFolderSelector(BuildContext context, String sprawUID) async{

  await openFolderSelector<SprawFolder>(
    context,
    title: 'Dodaj sprawność do folderu',
    countString: 'Liczba sprawności:',
    getAllFolders: () => SprawFolder.allFolders,
    onNewFolderSave: (String name, String iconKey, String colorsKey) => SprawFolder.create(
      name: name,
      colorsKey: colorsKey,
      iconKey: iconKey,
    ),
    onCheckedChange: (SprawFolder folder, bool? checked) {
      if(checked == true) folder.add(sprawUID);
      else folder.remove(sprawUID);
    },
    isSelected: (folder) => folder.sprawUIDs.contains(sprawUID)
  );

}