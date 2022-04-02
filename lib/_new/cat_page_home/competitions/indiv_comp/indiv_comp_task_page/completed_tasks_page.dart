import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_task_page/review_page/indiv_comp_task_compl_details_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/task_accept_state.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../indiv_comp_task_compl_widget.dart';
import '../models/indiv_comp_task_compl.dart';

class CompletedTasksPage extends StatefulWidget{

  final IndivComp comp;
  final void Function(IndivCompTaskCompl taskCompl) onRemoved;

  const CompletedTasksPage(this.comp, {this.onRemoved, Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() => CompletedTasksPageState();

}

class CompletedTasksPageState extends State<CompletedTasksPage>{

  IndivComp get comp => widget.comp;
  void Function(IndivCompTaskCompl taskCompl) get onRemoved => widget.onRemoved;

  bool showAll;

  void openDetails(BuildContext context, taskCompl) => openDialog(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        child: Material(
            borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
            clipBehavior: Clip.antiAlias,
            color: background_(context),
            child: Column(
              children: [
                AppBar(
                  elevation: 0,
                ),
                Expanded(
                  child: IndivCompTaskComplDetailsWidget(
                      comp,
                      taskCompl
                  ),
                )
              ],
            )
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

    Iterator<IndivCompTaskCompl> reversedComplTasks = comp.profile.completedTasks.reversed.iterator;
    for(int i=0; i<comp.profile.completedTasks.length; i++) {

      reversedComplTasks.moveNext();
      IndivCompTaskCompl taskCompl = reversedComplTasks.current;

      if ((!showAll && taskCompl.acceptState == TaskAcceptState.ACCEPTED) || (showAll && taskCompl.acceptState != TaskAcceptState.PENDING))
        children.add(
            IndivCompTaskComplWidget(
                comp,
                taskCompl,
                heroTag: taskCompl,
                onRemoved: (String removedId) {
                  comp.profile.completedTasks.remove(taskCompl);
                  onRemoved?.call(taskCompl);
                },
                onTap: () => openDetails(context, taskCompl)
            )
        );

      if(i<comp.profile.completedTasks.length-1)
        children.add(const SizedBox(height: Dimen.SIDE_MARG));
    }
    return BottomNavScaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            title: const Text('Zrealizowane zadania'),
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