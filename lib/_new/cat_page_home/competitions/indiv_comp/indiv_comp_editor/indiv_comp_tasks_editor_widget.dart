import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/indiv_comp_task_edit_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_editor/providers.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_details.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'common.dart';

class IndivCompTasksEditorWidget extends StatefulWidget{

  final IndivCompDetails initComp;

  const IndivCompTasksEditorWidget({this.initComp});

  @override
  State<StatefulWidget> createState() => _IndivCompTasksEditorWidgetState();

}

class _IndivCompTasksEditorWidgetState extends State<IndivCompTasksEditorWidget> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) => Stack(
    children: [

      CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [

            SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),

            SliverList(delegate: SliverChildListDelegate([
              TitleShortcutRowWidget(title: 'Zadania', titleColor: hintEnab_(context)),
            ])),

            Consumer<TaskBodiesProvider>(
              builder: (context, prov, child){

                if(prov.taskEditables.isEmpty)
                  return const SliverFillRemaining(
                    hasScrollBody: false,
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
                        (context, index) => IndivCompTaskEditWidget(
                          initTitle: prov.taskEditables[index].editedTitle,
                          initDesc: prov.taskEditables[index].editedDescription,
                          initPoints: prov.taskEditables[index].editedPoints,

                          state: prov.taskEditables[index].editedState,
                          remove: prov.taskEditables[index].remove,

                          accentColor: Provider.of<ColorKeyProvider>(context, listen: false).avgColor,

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

                        ),
                        separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
                        count: Provider.of<TaskBodiesProvider>(context, listen: false).taskEditables.length
                    )),
                  );

              },
            ),

            SliverList(delegate: SliverChildListDelegate([
              const SizedBox(height: Dimen.ICON_FOOTPRINT + 3*Dimen.SIDE_MARG)
            ]))

          ]
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
        bottom: 0,
        left: 0,
        right: 0,
        child: EditGradientButton(
            MdiIcons.cube,
            'Dodaj zadanie',
            onTap: () async => setState(() => Provider.of<TaskBodiesProvider>(context, listen: false).create(Provider.of<TaskBodiesProvider>(context, listen: false).taskEditables.length))
        ),
      ),
    ],
  );

}