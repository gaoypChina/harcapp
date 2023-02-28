import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tuple/tuple.dart';

import 'apel_ewan.dart';
import 'apel_ewan_folder_viewer_page.dart';
import 'apel_ewan_grid_view.dart';
import 'apel_ewan_own_folder.dart';
import 'apel_ewan_own_reorderable_list.dart';

enum LayoutType{grid, list}

class ApelEwanOwnFolderItemsView<T extends ApelEwanOwnFolder> extends StatelessWidget{

  final T folder;
  final EdgeInsets padding;
  final LayoutType type;
  final bool animate;
  // final void Function(ApelEwan, String?)? onTap;

  const ApelEwanOwnFolderItemsView({
    required this.folder,
    this.padding = const EdgeInsets.all(Dimen.ICON_MARG),
    required this.type,
    this.animate = false,
    super.key
  });

  void onTap(BuildContext context, ApelEwan apelEwan, String? subgroup) =>
    pushPage(context, builder: (context) => ApelEwanFolderViewerPage(
      folder.apelEwans.map((apelEwan) => Tuple2(apelEwan, subgroup)).toList(),
      apelEwan,
      title: folder.name,
    ));

  @override
  Widget build(BuildContext context) => Stack(
    children: [

      Positioned(
          right: -0.1*MediaQuery.of(context).size.width,
          bottom: -0.1*MediaQuery.of(context).size.width,
          child: RotationTransition(
            turns: const AlwaysStoppedAnimation(-15 / 360),
            child: Icon(
              folder.icon,
              color: background_(context),
              size: MediaQuery.of(context).size.width,
            ),
          ),
      ),

      if(folder.isEmpty)
        const Positioned.fill(
          child: EmptyMessage()
        ),

      if(type == LayoutType.grid)
        ApelEwanGridView(
          folder: folder,
          animate: animate,
          padding: padding,
          onTap: (apelEwan, subgroup) => onTap(context, apelEwan, subgroup),
        )
      else
        ApelEwanOwnReorderableList(
          folder: folder,
          animate: animate,
          padding: padding,
          onTap: (apelEwan, subgroup) => onTap(context, apelEwan, subgroup),
        )
    ],
  );

}

class EmptyMessage extends StatelessWidget{

  const EmptyMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(
          'W tym folderze pusto!',
          style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.bold),
        ),

        const SizedBox(height: 2*Dimen.SIDE_MARG),

        const AppText(
          'Aby dodać apel do folderu, <b>wybierz apel</b> i <b>naciśnij</b>:',
          size: Dimen.TEXT_SIZE_BIG,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: Dimen.SIDE_MARG),

        const Icon(MdiIcons.bookmarkOutline, size: 32.0)
      ],
    ),
  );



}