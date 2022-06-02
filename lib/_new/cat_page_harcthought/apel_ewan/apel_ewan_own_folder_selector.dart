import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_selector_bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/providers.dart';
import 'package:provider/provider.dart';

import 'apel_ewan_own_folder.dart';

Future<void> openApelEwanOwnFolderSelector(BuildContext context, String siglum) => openFolderSelector<ApelEwanOwnFolder>(
    context,
    title: 'Dodaj apel do folderu',
    countString: 'Liczba apeli:',
    getAllFolders: () => ApelEwanOwnFolder.allOwnFolders,
    onNewFolderSave: (String name, String iconKey, String colorsKey) async {
      ApelEwanAllFoldersProvider prov = Provider.of<ApelEwanAllFoldersProvider>(context, listen: false);
      ApelEwanOwnFolder folder = await ApelEwanOwnFolder.create(
        name: name,
        colorsKey: colorsKey,
        iconKey: iconKey,
      );
      ApelEwanOwnFolder.addOwnFolder(folder);
      prov.notify();
    },
    onCheckedChange: (ApelEwanOwnFolder folder, bool? checked) async {
      ApelEwanFolderProvider folderProv = Provider.of<ApelEwanFolderProvider>(context, listen: false);
      ApelEwanAllFoldersProvider allFoldersProv = Provider.of<ApelEwanAllFoldersProvider>(context, listen: false);

      if(checked == true) await folder.add(siglum);
      else await folder.remove(siglum);
      folderProv.notify();
      allFoldersProv.notify();
    },
    isSelected: (folder) => folder.apelEwanSigla.contains(siglum)
);
