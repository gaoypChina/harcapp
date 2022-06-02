import 'package:flutter/material.dart' hide ReorderableList;
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
//import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'apel_ewan.dart';
import 'apel_ewan_own_folder.dart';
import 'apel_ewan_tile.dart';

class ApelEwanReorderableList<T extends ApelEwanOwnFolder> extends StatefulWidget{

  final T folder;
  final EdgeInsets padding;
  final bool animate;

  const ApelEwanReorderableList({
    required this.folder,
    this.padding = const EdgeInsets.all(Dimen.ICON_MARG),
    this.animate = false,
    super.key
  });

  @override
  State<StatefulWidget> createState() => ApelEwanReorderableListState<T>();

}

class ApelEwanReorderableListState<T extends ApelEwanOwnFolder> extends State<ApelEwanReorderableList<T>>{

  T get folder => widget.folder;
  EdgeInsets get padding => widget.padding;
  bool get animate => widget.animate;

  int _indexOfKey(ValueKey<String> key) {
    return folder.apelEwans.indexWhere((ApelEwan apelEwan) => apelEwan.siglum == key.value);
  }

  bool _reorderCallback(Key item, Key newPosition) {
    int draggingIndex = _indexOfKey(item as ValueKey<String>);
    int newPositionIndex = _indexOfKey(newPosition as ValueKey<String>);

    final draggedItem = folder.apelEwans[draggingIndex];
    setState(() {
      folder.apelEwans.removeAt(draggingIndex);
      folder.apelEwans.insert(newPositionIndex, draggedItem);
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {

    return ReorderableList(
      onReorder: _reorderCallback,
      onReorderDone: (_){
        folder.apelEwanSigla = folder.apelEwans.map((apelEwan) => apelEwan.siglum).toList();
      },
      decoratePlaceholder: (widget, offset) => DecoratedPlaceholder(
          widget: Material(
            borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
            color: background_(context),
            elevation: offset*AppCard.bigElevation,
            child: widget,
          ),
          offset: offset
      ),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: padding,
        itemBuilder: (context, index){

          ApelEwan apelEwan = folder.apelEwans[index];

          return ReorderableItem(
            key: ValueKey(apelEwan.siglum),
            childBuilder: (BuildContext context, ReorderableItemState state){

              Widget tile = Opacity(
                  opacity: state == ReorderableItemState.placeholder ? 0.0 : 1.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
                    animationDuration: Duration.zero,

                    color: state == ReorderableItemState.dragProxy?
                    background_(context):
                    Colors.transparent,

                    child: ApelEwanTile(
                      apelEwan,
                      initNote: folder.getNote(apelEwan.siglum),
                      initSubgroupSuff: folder.getSubgroupSuff(apelEwan.siglum)??apelEwan.subgroupTitle.keys.first,
                      onNoteChanged: (note) => folder.setNote(apelEwan.siglum, note),
                      onSubgroupSuffChanged: (subgroupSuff) => folder.setSubgroupSuff(apelEwan.siglum, subgroupSuff??''),
                      noteTrailing: ReorderableListener(
                          child: Padding(
                            padding: const EdgeInsets.all(Dimen.ICON_MARG),
                            child: Icon(MdiIcons.swapVertical, color: iconEnab_(context)),
                          )
                      ),
                    ),
                  )
              );

              if(!animate || state == ReorderableItemState.dragProxy)
                return tile;

              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(child: tile),
                ),
              );

            },
          );

        },
        separatorBuilder: (context, index) => const SizedBox(height: Dimen.ICON_MARG),
        itemCount: folder.apelEwans.length,
      ),

    );

  }

}