import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'apel_ewan_grid_view.dart';
import 'apel_ewan_own_folder.dart';
import 'apel_ewan_reorderable_list.dart';

enum LayoutType{grid, list}

class ApelEwanFolderItemsView<T extends ApelEwanOwnFolder> extends StatelessWidget{

  final T folder;
  final EdgeInsets padding;
  final LayoutType type;
  final bool animate;

  const ApelEwanFolderItemsView({
    required this.folder,
    this.padding = const EdgeInsets.all(Dimen.ICON_MARG),
    required this.type,
    this.animate = false,
    super.key
  });

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
        )
      else
        ApelEwanReorderableList(
          folder: folder,
          animate: animate,
          padding: padding
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