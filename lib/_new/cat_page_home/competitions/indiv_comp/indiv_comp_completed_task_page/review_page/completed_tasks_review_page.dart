import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_common_widgets/paging_loadable_page/paging_loadable_page_view_page.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_completed_task_page/review_page/completed_task_details_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task_compl.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/task_accept_state.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class CompletedTasksReviewPage extends StatefulWidget{

  final IndivComp comp;

  final void Function(IndivCompCompletedTask)? onCompletedTaskRemoved;
  final void Function(IndivCompParticip, IndivCompCompletedTask)? onAccepted;
  final void Function(IndivCompParticip, IndivCompCompletedTask)? onRejected;

  const CompletedTasksReviewPage(
      this.comp,
      { this.onCompletedTaskRemoved,
        this.onAccepted,
        this.onRejected,

        super.key
      });

  @override
  State<StatefulWidget> createState() => CompletedTasksReviewPageState();

}

class CompletedTasksReviewPageState extends State<CompletedTasksReviewPage>{

  IndivComp get comp => widget.comp;
  List<IndivCompCompletedTask> get pendingCompletedTasks => comp.loadedPendingCompletedTasks;

  void Function(IndivCompCompletedTask)? get onCompletedTaskRemoved => widget.onCompletedTaskRemoved;
  void Function(IndivCompParticip, IndivCompCompletedTask)? get onAccepted => widget.onAccepted;
  void Function(IndivCompParticip, IndivCompCompletedTask)? get onRejected => widget.onRejected;

  late RefreshController refreshController;

  int get totalCount => comp.completedTasksPendingCount??-1;

  bool get moreToLoad => pendingCompletedTasks.length < totalCount;

  @override
  void initState() {
    refreshController = RefreshController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => PagingLoadablePageViewPage(
      appBarTitle: 'Wnioski o punkty',
      loadingIndicatorColor: comp.colors.avgColor,
      totalItemsCount: totalCount,
      loadedItemsCount: pendingCompletedTasks.length,
      callReload: () async {

        await ApiIndivComp.getCompletedTasks(
          comp: comp,
          pageSize: IndivCompCompletedTask.pageSize,
          lastReqTime: pendingCompletedTasks.isEmpty?null:pendingCompletedTasks.last.reqTime,
          acceptState: TaskAcceptState.PENDING,
          onSuccess: (completedTasksPage){
            pendingCompletedTasks.clear();
            pendingCompletedTasks.addAll(completedTasksPage);

            comp.setAllLoadedPendingCompletedTasks(completedTasksPage);

            setState((){});
          },
          onForceLoggedOut: (){
            if(!mounted) return true;
            showAppToast(context, text: forceLoggedOutMessage);
            setState(() {});
            return true;
          },
          onServerMaybeWakingUp: (){
            if(!mounted) return true;
            showServerWakingUpToast(context);
            return true;
          },
          onError: (){
            if(!mounted) return;
            showAppToast(context, text: simpleErrorMessage);
          },
        );

      },
      callLoadMore: () async {

        bool success = false;
        await ApiIndivComp.getCompletedTasks(
          comp: comp,
          pageSize: IndivCompCompletedTask.pageSize,
          lastReqTime: pendingCompletedTasks.isEmpty?null:pendingCompletedTasks.last.reqTime,
          acceptState: TaskAcceptState.PENDING,
          onSuccess: (completedTasksPage){
            comp.addLoadedPendingCompletedTasks(completedTasksPage);
            setState((){});
            success = true;
          },
          onForceLoggedOut: (){
            if(!mounted) return true;
            showAppToast(context, text: forceLoggedOutMessage);
            setState(() {});
            return true;
          },
          onServerMaybeWakingUp: (){
            if(!mounted) return true;
            showServerWakingUpToast(context);
            return true;
          },
          onError: (){
            if(!mounted) return;
            showAppToast(context, text: simpleErrorMessage);
          },
        );

        return success;
      },
      callLoadOnInit: pendingCompletedTasks.isEmpty,
      loadedItemBuilder: (index) => CompletedTaskDetailsWidget(
        comp,
        pendingCompletedTasks[index],
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        onAcceptStateChanged: () => setState((){
          comp.removeLoadedPendingCompletedTask(pendingCompletedTasks[index]);
        }),
      ),
      tabTitle: (index, loadMoreAvailable) => loadMoreAvailable?'Więcej...':'Wniosek $index',

      emptyBody: const Padding(
        padding: EdgeInsets.all(Dimen.SIDE_MARG),
        child: Center(
          child: EmptyMessageWidget(text: 'Brak\nnierozpatrzonych\nwniosków', icon: MdiIcons.cubeOffOutline),
        ),
      )
  );

}