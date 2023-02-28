import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_selector_bottom_sheet.dart';

import 'spraw_folder_page/spraw_folder.dart';

Future<void> openSprawFolderSelector(BuildContext context, String sprawUniqName) => openFolderSelector<BaseSprawFolder>(
    context,
    title: 'Dodaj sprawność do folderu',
    countString: 'Liczba sprawności:',
    getAllFolders: () => BaseSprawFolder.allFolders,
    onNewFolderSave: (String name, String iconKey, String colorsKey) => OwnSprawFolder.create(
      name: name,
      colorsKey: colorsKey,
      iconKey: iconKey,
    ),
    onCheckedChange: (BaseSprawFolder folder, bool? checked) {
      if(checked == true) folder.add(sprawUniqName);
      else folder.remove(sprawUniqName);
    },
    isSelected: (folder) => folder.sprawUIDs.contains(sprawUniqName)
);