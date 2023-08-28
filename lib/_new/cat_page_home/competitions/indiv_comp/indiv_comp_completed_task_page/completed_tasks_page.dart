import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/paging_loadable_page/paging_loadable_scroll_view_page.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_completed_task_page/review_page/completed_task_details_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task_compl.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/task_accept_state.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../models/indiv_comp_task.dart';
import 'completed_task_widget.dart';

class CompletedTasksPage extends StatefulWidget{

  final IndivComp comp;
  final IndivCompParticip? particip;
  final IndivCompTask? task;
  final TaskAcceptState? acceptState;

  final String title;

  final List<IndivCompCompletedTask>? initLoadedCompletedTasks;

  final void Function(List<IndivCompCompletedTask>)? onCompletedTasksRefreshed;
  final void Function(List<IndivCompCompletedTask>)? onCompletedTasksPageLoaded;
  final void Function(IndivCompCompletedTask)? onCompletedTaskRemoved;

  final void Function(IndivCompParticip, IndivCompCompletedTask)? onAccepted;
  final void Function(IndivCompParticip, IndivCompCompletedTask)? onRejected;

  const CompletedTasksPage(
      this.comp,
      { this.particip,
        this.task,
        this.acceptState,

        required this.title,

        this.initLoadedCompletedTasks,

        this.onCompletedTasksRefreshed,
        this.onCompletedTasksPageLoaded,
        this.onCompletedTaskRemoved,

        this.onAccepted,
        this.onRejected,

        super.key
      }): assert(!(particip == null && acceptState == null));

  @override
  State<StatefulWidget> createState() => CompletedTasksPageState();

}

class CompletedTasksPageState extends State<CompletedTasksPage>{

  IndivComp get comp => widget.comp;
  IndivCompParticip? get particip => widget.particip;
  IndivCompTask? get task => widget.task;
  TaskAcceptState? get acceptState => widget.acceptState;

  String get title => widget.title;

  late List<IndivCompCompletedTask> loadedCompletedTasks;
  List<IndivCompCompletedTask>? get initLoadedCompletedTasks => widget.initLoadedCompletedTasks;

  void Function(List<IndivCompCompletedTask>)? get onCompletedTasksRefreshed => widget.onCompletedTasksRefreshed;
  void Function(List<IndivCompCompletedTask>)? get onCompletedTasksPageLoaded => widget.onCompletedTasksPageLoaded;
  void Function(IndivCompCompletedTask)? get onCompletedTaskRemoved => widget.onCompletedTaskRemoved;

  void Function(IndivCompParticip, IndivCompCompletedTask)? get onAccepted => widget.onAccepted;
  void Function(IndivCompParticip, IndivCompCompletedTask)? get onRejected => widget.onRejected;

  int get totalCount{

    if(particip == null){

      if(acceptState == null)
        return (comp.completedTasksAcceptedCount??-1) +
            (comp.completedTasksPendingCount??-1) +
            (comp.completedTasksRejectedCount??-1);
      else switch(acceptState!){
        case TaskAcceptState.ACCEPTED:
          return comp.completedTasksAcceptedCount??-1;
        case TaskAcceptState.PENDING:
          return comp.completedTasksPendingCount??-1;
        case TaskAcceptState.REJECTED:
          return comp.completedTasksRejectedCount??-1;
      }

    } else {

      if(acceptState == null)
        return (particip!.profile.completedTasksAcceptedCount??-1) +
            (particip!.profile.completedTasksPendingCount??-1) +
            (particip!.profile.completedTasksRejectedCount??-1);
      else switch(acceptState!){
        case TaskAcceptState.ACCEPTED:
          return particip!.profile.completedTasksAcceptedCount??-1;
        case TaskAcceptState.PENDING:
          return particip!.profile.completedTasksPendingCount??-1;
        case TaskAcceptState.REJECTED:
          return particip!.profile.completedTasksRejectedCount??-1;
      }

    }

  }

  bool get moreToLoad => loadedCompletedTasks.length < totalCount;

  late RefreshController controller;

  @override
  void initState() {

    loadedCompletedTasks = [];
    if(initLoadedCompletedTasks != null)
      loadedCompletedTasks.addAll(initLoadedCompletedTasks!);

    // TODO: Handle situations when they are already loading - create a completed task loader just like participants loader.
    // TODO: Loader is implemeneted, but not used yet.
    controller = RefreshController(initialRefresh: loadedCompletedTasks.isEmpty);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PagingLoadableScrollViewPage(
      appBarTitle: title,
      loadingIndicatorColor: comp.colors.avgColor,
      totalItemsCount: totalCount,
      loadedItemsCount: loadedCompletedTasks.length,
      callReload: () async {
        await ApiIndivComp.getCompletedTasks(
          comp: comp,
          participKey: particip?.key,
          taskKey: task?.key,
          pageSize: IndivCompCompletedTask.pageSize,
          lastReqTime: null,
          acceptState: acceptState,
          onSuccess: (completedTasksPage){
            onCompletedTasksRefreshed?.call(completedTasksPage);
            loadedCompletedTasks.clear();
            loadedCompletedTasks.addAll(completedTasksPage);
            if(mounted) setState((){});
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
        return loadedCompletedTasks.length;
      },
      callLoadMore: () async {
        await ApiIndivComp.getCompletedTasks(
          comp: comp,
          participKey: particip?.key,
          taskKey: task?.key,
          pageSize: IndivCompCompletedTask.pageSize,
          lastReqTime: loadedCompletedTasks.isEmpty?null:loadedCompletedTasks.last.reqTime,
          acceptState: acceptState,
          onSuccess: (completedTasksPage){
            onCompletedTasksPageLoaded?.call(completedTasksPage);
            loadedCompletedTasks.addAll(completedTasksPage);
            if(mounted) setState((){});
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
        return loadedCompletedTasks.length;
      },
      controller: controller,
      loadedItemBuilder: (index) => CompletedTaskWidget(
          loadedCompletedTasks[index],
          comp.colors,
          preview: true,
          onRemoved: (text) {
            IndivCompCompletedTask complTask = loadedCompletedTasks.removeAt(index);
            onCompletedTaskRemoved?.call(complTask);
            if (loadedCompletedTasks.isEmpty) {
              if(mounted) Navigator.pop(context);
              return;
            }
            if (mounted) setState(() {});
          },

          onTap: () => openCompletedTaskDetailsWidget(
            context,
            comp,
            loadedCompletedTasks[index],
          )
      ),
      itemSeparatorHeight: Dimen.SIDE_MARG,
  );

}