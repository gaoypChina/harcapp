import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/compl_tasks_provider.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/task_accept_state.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tuple/tuple.dart';
import 'package:provider/provider.dart';

import 'indiv_comp_task_compl_details_widget.dart';
import '../../models/indiv_comp_task_compl.dart';

class IndivCompProfilePendingComplTasksPage extends StatefulWidget{

  final IndivComp comp;
  final void Function(IndivCompParticip, IndivCompTaskCompl) onAccepted;
  final void Function(IndivCompParticip, IndivCompTaskCompl) onRejected;

  const IndivCompProfilePendingComplTasksPage(this.comp, {this.onAccepted, this.onRejected});

  @override
  State<StatefulWidget> createState() => IndivCompProfilePendingComplTasksPageState();

}

class IndivCompProfilePendingComplTasksPageState extends State<IndivCompProfilePendingComplTasksPage>{

  IndivComp get comp => widget.comp;

  List<Tuple2<IndivCompParticip, IndivCompTaskCompl>> pendingComplTasks;

  bool showPendingOnly;

  bool sending;

  List<Tuple2<IndivCompParticip, IndivCompTaskCompl>> complTasksToList({
    @required Map<IndivCompParticip, List<IndivCompTaskCompl>> complTaskMap,
  }){
    pendingComplTasks = [];

    for(IndivCompParticip particip in complTaskMap.keys)
      for(IndivCompTaskCompl task in complTaskMap[particip])
        pendingComplTasks.add(Tuple2(particip, task));

    return pendingComplTasks;
  }

  @override
  void initState() {

    showPendingOnly = true;
    sending = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<ComplTasksProvider>(
      builder: (context, prov, child){

        Map<IndivCompParticip, List<IndivCompTaskCompl>> complTaskMap = {};

        for(IndivCompParticip particip in comp.particips) {
          if(!complTaskMap.containsKey(particip))
            complTaskMap[particip] = [];

          for(IndivCompTaskCompl complTask in particip.profile.completedTasks)
            complTaskMap[particip].add(complTask);
        }

        pendingComplTasks = complTasksToList(complTaskMap: complTaskMap);

        if(showPendingOnly)
          pendingComplTasks.removeWhere((tuple) => tuple.item2.acceptState != TaskAcceptState.PENDING);

        List<Tab> tabs = [];
        List<Widget> children = [];
        for(Tuple2<IndivCompParticip, IndivCompTaskCompl> pendingComplTask in pendingComplTasks){
          IndivCompParticip particip = pendingComplTask.item1;
          IndivCompTaskCompl taskCompl = pendingComplTask.item2;

          tabs.add(Tab(
            text: particip.name,
          ));

          children.add(
              IndivCompTaskComplDetailsWidget(
                  comp,
                  taskCompl,
                  particip: particip,
                  padding: EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                  onAcceptStateChanged: (){
                      if(pendingComplTasks.length == 1)
                        Navigator.pop(context);
                  },
              )
          );
        }

        return BottomNavScaffold(
            body: DefaultTabController(
              length: pendingComplTasks.length,
              child: NestedScrollView(
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
                    SliverAppBar(
                      title: Text('Prośby o zaliczenie zadań'),
                      centerTitle: true,
                      floating: true,
                      pinned: pendingComplTasks.length > 1,
                      actions: [

                        IconButton(
                            icon: Icon(showPendingOnly?MdiIcons.eyeOffOutline:MdiIcons.eyeOutline),
                            onPressed: () => setState(() => showPendingOnly = !showPendingOnly)
                        ),

                      ],
                      bottom:
                      pendingComplTasks.length == 1?null:TabBar(
                        isScrollable: pendingComplTasks.length > 3,
                        physics: BouncingScrollPhysics(),
                        tabs: tabs,
                      ),
                    ),
                  ],
                  body: 
                  pendingComplTasks.length == 0? 
                      Padding(
                        padding: EdgeInsets.all(Dimen.SIDE_MARG),
                        child: Center(
                          child: EmptyMessageWidget(text: 'Brak nierozpatrzonych zadań', icon: MdiIcons.cubeOffOutline),
                        ),
                      ):
                  TabBarView(
                    physics: BouncingScrollPhysics(),
                    children: children,
                  )

              ),
            )
        );

      }
    );

  }
}
