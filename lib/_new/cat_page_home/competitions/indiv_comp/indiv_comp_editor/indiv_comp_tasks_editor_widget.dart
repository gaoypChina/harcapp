import 'package:flutter/material.dart' hide ReorderableList;
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/indiv_comp_task_edit_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_editor/providers.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'common.dart';
import 'indiv_comp_task_editable.dart';

class IndivCompTasksEditorWidget extends StatefulWidget{

  const IndivCompTasksEditorWidget({super.key});

  @override
  State<StatefulWidget> createState() => _IndivCompTasksEditorWidgetState();

}

class _IndivCompTasksEditorWidgetState extends State<IndivCompTasksEditorWidget> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  late TaskBodiesProvider taskBodiesProv;

  int _indexOfKey(ValueKey<int> key) =>
      taskBodiesProv.taskEditables.indexWhere((IndivCompTaskEditable task) => task.hashCode == key.value);

  bool _reorderCallback(Key item, Key newPosition) {
    int draggingIndex = _indexOfKey(item as ValueKey<int>);
    int newPositionIndex = _indexOfKey(newPosition as ValueKey<int>);

    final draggedItem = taskBodiesProv.taskEditables[draggingIndex];
    setState(() {
      taskBodiesProv.removeAt(draggingIndex);
      taskBodiesProv.insert(newPositionIndex, draggedItem);
    });
    return true;
  }

  @override
  void initState() {
    taskBodiesProv = TaskBodiesProvider.of(context);
    super.initState();
  }

  @override
  void dispose() {
    taskBodiesProv.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    super.build(context);
    return Stack(
      children: [

        ReorderableList(
            onReorder: _reorderCallback,
            onReorderDone: (_){
              taskBodiesProv.recalcPositions();
            },
            decoratePlaceholder: (widget, offset) => DecoratedPlaceholder(
                widget: Material(
                  borderRadius: BorderRadius.circular(AppCard.bigRadius),
                  color: background_(context),
                  elevation: offset*AppCard.bigElevation,
                  child: widget,
                ),
                offset: offset
            ),
            child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [

                  SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),

                  Consumer<TaskBodiesProvider>(
                    builder: (context, prov, child){

                      if(prov.taskEditables.isEmpty)
                        return SliverFillRemaining(
                          hasScrollBody: false,
                          fillOverscroll: true,
                          child: Center(
                            child: EmptyMessageWidget(
                              icon: MdiIcons.cubeOutline,
                              text: 'Dodaj zadania!',
                            ),
                          ),
                        );
                      else
                        return SliverPadding(
                          padding: const EdgeInsets.only(top: Dimen.SIDE_MARG, left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
                          sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
                              (context, index) => ReorderableItem(
                                  key: ValueKey(prov.taskEditables[index].hashCode),
                                  childBuilder: (BuildContext context, ReorderableItemState state){
                                    Widget tile = Opacity(
                                        opacity: state == ReorderableItemState.placeholder ? 0.0 : 1.0,
                                        child: IndivCompTaskEditWidget(
                                      initTitle: prov.taskEditables[index].editedTitle,
                                      initDesc: prov.taskEditables[index].editedDescription,
                                      initPoints: prov.taskEditables[index].editedPoints,

                                      state: prov.taskEditables[index].editedState,
                                      remove: prov.taskEditables[index].remove,

                                      accentColor: ColorKeyProvider.of(context).avgColor,

                                      showFreeze: prov.taskEditables[index].created,

                                      onTitleChanged: (text) => prov.update(index, title: text, silent: true),
                                      onDescChanged: (text) => prov.update(index, desc: text, silent: true),
                                      onPointsChanged: (points) => prov.update(index, points: points, silent: true),
                                      onRemoveTap: (remove){
                                        if(prov.taskEditables[index].created)
                                          prov.remove(index, remove);
                                        else {
                                          prov.taskEditables.removeAt(index);
                                          prov.notify();
                                        }
                                      },
                                      onFreezeTap: (state) => prov.update(index, state: state),
                                      onRestoreTap: (){
                                        prov.update(index, state: TaskState.OPEN, silent: true);
                                        prov.remove(index, false, silent: true);
                                        prov.notify();
                                      },

                                    )
                                    );

                                    return tile;

                                  }),
                              separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
                              count: prov.taskEditables.length
                          )),
                        );

                    },
                  ),

                  SliverList(delegate: SliverChildListDelegate([
                    const SizedBox(height: Dimen.ICON_FOOTPRINT + 3*Dimen.SIDE_MARG)
                  ]))

                ]
            )
        ),

        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: Dimen.ICON_FOOTPRINT,
              color: background_(context),
            )
        ),

        Positioned(
          bottom: Dimen.defMarg,
          left: Dimen.defMarg,
          right: Dimen.defMarg,
          child: EditGradientButton(
              MdiIcons.cube,
              'Dodaj zadanie',
              onTap: () async => setState(() => taskBodiesProv.create(taskBodiesProv.taskEditables.length))
          ),
        ),
      ],
    );
  }

}