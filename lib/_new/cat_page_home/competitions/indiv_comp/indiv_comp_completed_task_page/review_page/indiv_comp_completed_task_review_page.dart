import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/compl_tasks_provider.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/task_accept_state.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tuple/tuple.dart';
import 'package:provider/provider.dart';

import 'indiv_comp_completed_task_details_widget.dart';
import '../../models/indiv_comp_task_compl.dart';

class IndivCompCompletedTaskReviewPage extends StatefulWidget{

  final IndivComp comp;
  final void Function(IndivCompParticip, IndivCompCompletedTask)? onAccepted;
  final void Function(IndivCompParticip, IndivCompCompletedTask)? onRejected;

  const IndivCompCompletedTaskReviewPage(
      this.comp,
      { this.onAccepted,
        this.onRejected,
        super.key
      });

  @override
  State<StatefulWidget> createState() => IndivCompCompletedTaskReviewPageState();

}

class IndivCompCompletedTaskReviewPageState extends State<IndivCompCompletedTaskReviewPage>{

  IndivComp get comp => widget.comp;

  List<Tuple2<IndivCompParticip?, IndivCompCompletedTask>>? pendingComplTasks;

  late bool showPendingOnly;

  bool? sending;

  List<Tuple2<IndivCompParticip?, IndivCompCompletedTask>>? complTasksToList({
    required Map<IndivCompParticip?, List<IndivCompCompletedTask>> complTaskMap,
  }){
    pendingComplTasks = [];

    for(IndivCompParticip? particip in complTaskMap.keys)
      for(IndivCompCompletedTask task in complTaskMap[particip]!)
        pendingComplTasks!.add(Tuple2(particip, task));

    return pendingComplTasks;
  }

  @override
  void initState() {

    showPendingOnly = true;
    sending = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Consumer<ComplTasksProvider>(
      builder: (context, prov, child){

        Map<IndivCompParticip?, List<IndivCompCompletedTask>> complTaskMap = {};

        for(IndivCompParticip? particip in comp.particips) {
          if(!complTaskMap.containsKey(particip))
            complTaskMap[particip] = [];

          for(IndivCompCompletedTask complTask in particip!.profile.completedTasks)
            complTaskMap[particip]!.add(complTask);
        }

        pendingComplTasks = complTasksToList(complTaskMap: complTaskMap);

        if(showPendingOnly)
          pendingComplTasks!.removeWhere((tuple) => tuple.item2.acceptState != TaskAcceptState.PENDING);

        List<Tab> tabs = [];
        List<Widget> children = [];
        for(Tuple2<IndivCompParticip?, IndivCompCompletedTask> pendingComplTask in pendingComplTasks!){
          IndivCompParticip particip = pendingComplTask.item1!;
          IndivCompCompletedTask complTask = pendingComplTask.item2;

          tabs.add(Tab(text: particip.name));

          children.add(
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: IndivCompCompletedTaskDetailsWidget(
                  comp,
                  complTask,
                  comp.participMap,
                  comp.colors,
                  padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                  onAcceptStateChanged: (){
                    if(pendingComplTasks!.length == 1)
                      Navigator.pop(context);
                  },
                ),
              )
          );
        }

        return BottomNavScaffold(
            body: DefaultTabController(
              length: pendingComplTasks!.length,
              child: NestedScrollView(
                  physics: const BouncingScrollPhysics(),
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
                    SliverAppBar(
                      title: const Text('Wnioski o punkty'),
                      centerTitle: true,
                      floating: true,
                      pinned: pendingComplTasks!.length > 1,
                      actions: [

                        IconButton(
                            icon: Icon(showPendingOnly?MdiIcons.eyeOffOutline:MdiIcons.eyeOutline),
                            onPressed: () => setState(() => showPendingOnly = !showPendingOnly)
                        ),

                      ],
                      bottom:
                      pendingComplTasks!.length == 1?null:TabBar(
                        isScrollable: pendingComplTasks!.length > 3,
                        physics: const BouncingScrollPhysics(),
                        tabs: tabs,
                      ),
                    ),
                  ],
                  body:
                  pendingComplTasks!.isEmpty?
                  const Padding(
                    padding: EdgeInsets.all(Dimen.SIDE_MARG),
                    child: Center(
                      child: EmptyMessageWidget(text: 'Brak nierozpatrzonych wniosków', icon: MdiIcons.cubeOffOutline),
                    ),
                  ):
                  TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: children,
                  )

              ),
            )
        );

      }
  );
}
