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
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'completed_task_widget.dart';

class CompletedTasksPage extends StatefulWidget{

  final IndivComp comp;
  final IndivCompParticip? particip;
  final TaskAcceptState? acceptState;
  final bool detailed;

  final String title;

  final void Function(IndivCompCompletedTask)? onCompletedTaskRemoved;
  final void Function(IndivCompParticip, IndivCompCompletedTask)? onAccepted;
  final void Function(IndivCompParticip, IndivCompCompletedTask)? onRejected;

  const CompletedTasksPage(
      this.comp,
      { this.particip,
        this.acceptState,
        this.detailed = false,

        required this.title,

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
  TaskAcceptState? get acceptState => widget.acceptState;
  bool get detailed => widget.detailed;

  String get title => widget.title;

  void Function(IndivCompCompletedTask)? get onCompletedTaskRemoved => widget.onCompletedTaskRemoved;
  void Function(IndivCompParticip, IndivCompCompletedTask)? get onAccepted => widget.onAccepted;
  void Function(IndivCompParticip, IndivCompCompletedTask)? get onRejected => widget.onRejected;

  late RefreshController refreshController;

  late List<IndivCompCompletedTask> loadedCompletedTasks;

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

  bool get moreToLoad =>
    totalCount == loadedCompletedTasks.length;

  @override
  void initState() {
    refreshController = RefreshController();
    loadedCompletedTasks = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) => PagingLoadableScrollViewPage(
      appBarTitle: title,
      loadingIndicatorColor: comp.colors.avgColor,
      totalItemsCount: totalCount,
      loadedItemsCount: loadedCompletedTasks.length,
      callReload: ()async{

        await ApiIndivComp.getCompletedTasks(
          comp: comp,
          participKey: particip?.key,
          pageSize: IndivCompCompletedTask.pageSize,
          lastReqTime: loadedCompletedTasks.isEmpty?null:loadedCompletedTasks.last.reqTime,
          acceptState: acceptState,
          onSuccess: (completedTasksPage){
            loadedCompletedTasks.clear();
            loadedCompletedTasks.addAll(completedTasksPage);
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
          participKey: particip?.key,
          pageSize: IndivCompCompletedTask.pageSize,
          lastReqTime: loadedCompletedTasks.isEmpty?null:loadedCompletedTasks.last.reqTime,
          acceptState: acceptState,
          onSuccess: (completedTasksPage){
            loadedCompletedTasks.addAll(completedTasksPage);
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
      callLoadOnInit: true,
      loadedItemBuilder: (index) =>
      detailed?
      CompletedTaskDetailsWidget(
        comp,
        loadedCompletedTasks[index]
      ):
      CompletedTaskWidget(
          loadedCompletedTasks[index],
          comp.colors,
          preview: true,
          onRemoved: (text) {
            IndivCompCompletedTask complTask = loadedCompletedTasks.removeAt(index);
            onCompletedTaskRemoved?.call(complTask);
            if (loadedCompletedTasks.isEmpty) {
              Navigator.pop(context);
              return;
            }
            if (mounted) setState(() {});
          }
      ),
      itemSeparatorHeight: Dimen.SIDE_MARG,
  );

}