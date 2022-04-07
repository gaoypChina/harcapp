import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_task_page/review_page/indiv_comp_task_compl_details_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/task_accept_state.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../_app_common/common_color_data.dart';
import '../indiv_comp_task_compl_widget.dart';
import '../models/indiv_comp.dart';
import '../models/indiv_comp_task.dart';
import '../models/indiv_comp_task_compl.dart';

class CompletedTasksPage extends StatefulWidget{

  final IndivComp comp;
  final List<IndivCompTaskCompl> completedTasks;
  final Map<String, IndivCompTask> taskMap;
  final Map<String, IndivCompParticip> participMap;
  final CommonColorData colors;

  final String pageTitle;
  final void Function(IndivCompTaskCompl taskCompl) onRemoved;

  const CompletedTasksPage(this.comp, this.completedTasks, this.taskMap, this.participMap, this.colors, {this.pageTitle, this.onRemoved, Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() => CompletedTasksPageState();

}

class CompletedTasksPageState extends State<CompletedTasksPage>{

  IndivComp get comp => widget.comp;
  List<IndivCompTaskCompl> get completedTasks => widget.completedTasks;
  Map<String, IndivCompTask> get taskMap => widget.taskMap;
  Map<String, IndivCompParticip> get participMap => widget.participMap;
  CommonColorData get colors => widget.colors;
  //List<IndivCompTaskCompl> get completedTasks => widget.comp.profile.completedTasks;

  String get pageTitle => widget.pageTitle;
  void Function(IndivCompTaskCompl taskCompl) get onRemoved => widget.onRemoved;

  bool showAll;

  void openDetails(BuildContext context, complTask) => showScrollBottomSheet(
      context: context,
      builder: (context) => BottomSheetDef(
          builder: (context) => IndivCompTaskComplDetailsWidget(
            comp,
            complTask,
            taskMap,
            participMap,
            colors,
          ),
      )
  );

  @override
  void initState() {

    showAll = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    Iterator<IndivCompTaskCompl> reversedComplTasks = completedTasks.reversed.iterator;
    for(int i=0; i<completedTasks.length; i++) {

      reversedComplTasks.moveNext();
      IndivCompTaskCompl complTask = reversedComplTasks.current;

      if ((!showAll && complTask.acceptState == TaskAcceptState.ACCEPTED) || (showAll && complTask.acceptState != TaskAcceptState.PENDING)) {
        children.add(
            IndivCompTaskComplWidget(
                complTask,
                taskMap,
                colors,
                heroTag: complTask,
                preview: true,
                onRemoved: (String removedId) {
                  completedTasks.remove(complTask);
                  onRemoved?.call(complTask);
                },
                onTap: () => openDetails(context, complTask)
            )
        );

        if (i < completedTasks.length - 1)
          children.add(const SizedBox(height: Dimen.SIDE_MARG));
      }
    }
    return BottomNavScaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            title: Text(pageTitle??'Zrealizowane zadania'),
            centerTitle: true,
            floating: true,
            actions: [
              IconButton(
                  icon: Icon(showAll?MdiIcons.eyeOutline:MdiIcons.eyeOffOutline),
                  onPressed: (){
                    setState(() => showAll = !showAll);

                    if(showAll)
                      showAppToast(context, text: 'Wszystkie wnioski');
                    else
                      showAppToast(context, text: 'Tylko zaakceptowane zadania');

                  }
              )
            ],
          ),

          if(children.isEmpty)
            const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: EmptyMessageWidget(
                  icon: MdiIcons.cubeOff,
                  text: 'Brak zaliczonych zadań!',
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
              sliver: SliverList(delegate: SliverChildListDelegate(children)),
            )

        ],
      ),
    );
  }

}