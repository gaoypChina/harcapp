import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/comp_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_editor/_main.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_widget_small.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_task_compl_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_profile.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_particip/participant_list_page.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/compl_tasks_provider.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/task_accept_state.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_thumbnail_row_widget.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tuple/tuple.dart';

import '../../../details/app_settings.dart';
import '../../../module_statistics_registrator.dart';
import 'indiv_comp_awards_page.dart';
import 'indiv_comp_editor/common.dart';
import 'indiv_comp_task_page/completed_tasks_page.dart';
import 'indiv_comp_particip/participant_list_admin_page.dart';
import 'indiv_comp_task_page/review_page/indiv_comp_review_page.dart';
import 'indiv_comp_task_page/indiv_comp_task_compl_req_widget.dart';
import 'indiv_comp_task_widget.dart';
import 'models/indiv_comp.dart';
import 'models/indiv_comp_particip.dart';
import 'models/indiv_comp_task_compl.dart';

class IndivCompPage extends StatefulWidget{

  final IndivComp comp;
  final void Function() onRemoved;

  const IndivCompPage(this.comp, {this.onRemoved, Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() => IndivCompPageState();

}

class IndivCompPageState extends State<IndivCompPage> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.indivComp;

  IndivComp updatedComp;
  IndivComp get comp => updatedComp??widget.comp;

  Color get compIconColor => !comp.colors.iconWhite&&!AppSettings.isDark?textEnab_(context):background_(context);//comp.colors.iconWhite?Colors.white:(Settings.isDark?background_(context):textEnab_(context));

  RefreshController refreshController;

  bool changeShareCodeProcessing;
  
  @override
  void initState() {
    changeShareCodeProcessing = false;
    refreshController = RefreshController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: Consumer<IndivCompProvider>(
        builder: (context, prov, child) => Stack(
          children: [

            SmartRefresher(
                enablePullDown: true,
                physics: const BouncingScrollPhysics(),
                header: MaterialClassicHeader(color: comp.colors.avgColor),
                controller: refreshController,
                onRefresh: () async {

                  if(!await isNetworkAvailable()){
                    showAppToast(context, text: 'Brak dostępu do Internetu');
                    refreshController.refreshCompleted();
                    return;
                  }

                  await ApiIndivComp.get(
                      compKey: comp.key,
                      onSuccess: (IndivComp comp){
                        updatedComp = comp;
                        IndivComp.updateInAll(context, comp);
                        setState(() {});
                        showAppToast(context, text: 'Zaktualizowano');
                      },
                      onError: (){
                        showAppToast(context, text: 'Wystąpił błąd.');
                      }
                  );

                  refreshController.refreshCompleted();

                },
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [

                    SliverAppBar(
                      title: Text(comp.name),
                      centerTitle: true,
                      floating: true,
                      actions: [
                        if(comp.profile.role == CompRole.ADMIN)
                          IconButton(
                            icon: Icon(comp.shareCodeSearchable?MdiIcons.accessPoint:MdiIcons.accessPointOff),
                            onPressed: changeShareCodeProcessing?null:() async {
                              setState(() => changeShareCodeProcessing = true);
                              await ApiIndivComp.setShareCodeSearchable(
                                  compKey: comp.key,
                                  searchable: !comp.shareCodeSearchable,
                                  onSuccess: (searchable) => setState(() => comp.shareCodeSearchable = searchable)
                              );
                              setState(() => changeShareCodeProcessing = false);
                            },
                          )
                      ],
                    ),

                    SliverList(delegate: SliverChildListDelegate([

                      if(comp.profile.role == CompRole.ADMIN)
                        AnimatedSize(
                          alignment: Alignment.bottomCenter,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOutQuad,
                          clipBehavior: Clip.none,
                          child: SizedBox(
                            height: comp.shareCodeSearchable?null:0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: Dimen.SIDE_MARG,
                                left: Dimen.SIDE_MARG,
                                right: Dimen.SIDE_MARG
                              ),
                              child: ShareCodeWidget(comp, enabled: !changeShareCodeProcessing),
                            ),
                          ),
                        ),

                      Stack(
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(
                                top: Dimen.SIDE_MARG,
                                left: Dimen.SIDE_MARG,
                                right: Dimen.SIDE_MARG,
                                bottom: AccountThumbnailWidget.defSize/2
                            ),
                            child: GradientWidget(
                              radius: AppCard.BIG_RADIUS,
                              colorStart: comp.colors.colorStart,
                              colorEnd: comp.colors.colorEnd,
                              child: Padding(
                                padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                                child: Column(
                                  children: [

                                    SimpleButton(
                                      margin: EdgeInsets.zero,
                                      radius: AppCard.BIG_RADIUS,
                                      child: Row(
                                        children: [

                                          Icon(
                                            comp.icon,
                                            size: 2*IndivCompWidgetSmall.textSizeVal,
                                            color: compIconColor,
                                          ),

                                          const SizedBox(width: Dimen.SIDE_MARG),

                                          if(comp.profile.active)
                                            Expanded(
                                              child: Row(
                                                children: [

                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      SizedBox(
                                                        height: 42.0,
                                                        child: Center(child: Text('Rank. ', style: AppTextStyle(fontSize: IndivCompWidgetSmall.textSizePkt, color: compIconColor.withOpacity(.5)))),
                                                      ),
                                                      const SizedBox(height: Dimen.SIDE_MARG),
                                                      SizedBox(
                                                        height: 42.0,
                                                        child: Center(child: Text('Punk. ', style: AppTextStyle(fontSize: IndivCompWidgetSmall.textSizePkt, color: compIconColor.withOpacity(.5)))),
                                                      ),
                                                    ],
                                                  ),

                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Row(
                                                          children: [

                                                            Expanded(
                                                              child: RankingWidget(comp, textSize: 42.0, textColor: compIconColor, fontWeight: weight.bold, withHash: false, clickable: true),
                                                            ),

                                                            if(comp.profile.showRank != null && comp.profile.showRank <= 3)
                                                              rankToAwardWidget(comp.profile.showRank, size: 42.0)

                                                          ],
                                                        ),
                                                        const SizedBox(height: Dimen.SIDE_MARG),
                                                        Row(
                                                          children: [
                                                            Text('${comp.profile.points} ', style: AppTextStyle(fontSize: 42.0, fontWeight: weight.bold, color: compIconColor)),
                                                            Text('pkt', style: AppTextStyle(fontSize: IndivCompWidgetSmall.textSizePkt, color: compIconColor)),
                                                            Expanded(child: Container()),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )

                                                ],
                                              ),
                                            )
                                          else
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  'Nie jesteś\nuczestnikiem\nwspółzawodnictwa',
                                                  style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, color: compIconColor, fontWeight: weight.bold, height: 1.1),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          const SizedBox(width: Dimen.SIDE_MARG),

                                        ],
                                      ),
                                      onTap: comp.profile.role == CompRole.ADMIN?() => pushPage(
                                          context,
                                          builder: (context) => IndivCompEditorPage(
                                            initComp: comp,
                                            onSaved: (IndivComp savedComp){
                                              comp.name = savedComp.name;
                                              comp.iconKey = savedComp.iconKey;
                                              comp.colorsKey = savedComp.colorsKey;
                                              comp.startTime = savedComp.startTime;
                                              comp.endTime = savedComp.endTime;
                                              comp.overviewMode = savedComp.overviewMode;

                                              comp.profile.active = savedComp.profile.active;
                                              comp.profile.showRank = savedComp.profile.showRank;
                                              comp.profile.showRankRange = savedComp.profile.showRankRange;

                                              for(IndivCompParticip particip in savedComp.particips)
                                                comp.participMap[particip.key] = particip;

                                              comp.tasks = savedComp.tasks;
                                              comp.awards = savedComp.awards;

                                              Provider.of<IndivCompProvider>(context, listen: false).notify();
                                              Provider.of<IndivCompListProvider>(context, listen: false).notify();

                                              Navigator.pop(context);
                                            },
                                            onRemoved: (){
                                              widget.onRemoved?.call();
                                              Navigator.pop(context);
                                            },
                                          )
                                      ):() => showScrollBottomSheet(
                                          context: context,
                                          builder: (context) => BottomSheetDef(
                                            builder: (context) => LeaveNotAdminDialog(comp),
                                          )
                                      ),
                                    ),

                                    const SizedBox(height: Dimen.SIDE_MARG),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                                      child: DateWidget(comp.startTime, comp.endTime, compIconColor),
                                    ),

                                    const SizedBox(height: (AccountThumbnailWidget.defSize)/2),

                                  ],
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: ParticipantsWidget(
                              comp,
                              padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
                            ),
                          ),

                          if(comp.particips.length == 1)
                            Positioned(
                                left: Dimen.SIDE_MARG + AccountThumbnailRowWidget.defCircleDistBig + AccountThumbnailWidget.defSize,
                                bottom: 0,
                                child: SizedBox(
                                  height: AccountThumbnailWidget.defSize,
                                  width: AccountThumbnailWidget.defSize,
                                  child: SimpleButton(
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.zero,
                                    color: cardEnab_(context),
                                    elevation: AppCard.bigElevation,
                                    radius: AccountThumbnailWidget.defSize/2,
                                    child: const Icon(MdiIcons.accountPlusOutline),
                                    onTap: () => ParticipantsWidget.onTap(comp, context),
                                  ),
                                )
                            )

                        ],
                      ),

                      const SizedBox(height: Dimen.SIDE_MARG),

                      CompletedTasksPreviewWidget(
                        comp,
                        padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
                      ),

                      const SizedBox(height: Dimen.SIDE_MARG),

                      TasksWidget(
                        comp,
                        onReqSent: (List<IndivCompTaskCompl> taskComplList){
                          IndivCompTaskCompl taskCompl = taskComplList[0];
                          comp.profile.completedTasks.add(taskCompl);
                          Provider.of<IndivCompProvider>(context, listen: false).notify();
                          setState(() {});
                        },
                        onSelfGranted: (List<IndivCompTaskCompl> taskComplList, Map<String, Tuple3<int, int, Tuple2<double, double>>> idRank){
                          //String myId = idRank.keys[0];
                          for(IndivCompTaskCompl taskCompl in taskComplList) {
                            comp.profile.completedTasks.add(taskCompl);
                            comp.addPoints(taskCompl.participKey, taskCompl.points(comp));
                          }

                          comp.handleRanks(idRank);
                          Provider.of<IndivCompProvider>(context, listen: false).notify();
                          setState(() {});
                        },
                      ),

                      const SizedBox(height: Dimen.SIDE_MARG),

                      if(comp.awards.isNotEmpty)
                        AwardsWidget(comp, padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG)),

                      if(comp.profile.role == CompRole.ADMIN || comp.profile.role == CompRole.MODERATOR)
                        const SizedBox(height: Dimen.FLOATING_BUTTON_SIZE + 2*Dimen.FLOATING_BUTTON_MARG)
                      else
                        const SizedBox(height: Dimen.SIDE_MARG),

                    ]))

                  ],
                )),

            if(comp.profile.role == CompRole.ADMIN || comp.profile.role == CompRole.MODERATOR)
              Positioned(
                  right: Dimen.DEF_MARG,
                  left: Dimen.DEF_MARG,
                  bottom: Dimen.DEF_MARG,
                  child: PendingWidget(
                    comp.key,
                    comp,
                    onAccepted: (IndivCompParticip particip, IndivCompTaskCompl complTask){
                      comp.participMap[particip.key].profile.completedTaskMap[complTask.key].acceptState = TaskAcceptState.ACCEPTED;
                      setState(() {});
                    },
                    onRejected: (IndivCompParticip particip, IndivCompTaskCompl complTask){
                      comp.participMap[particip.key].profile.completedTaskMap[complTask.key].acceptState = TaskAcceptState.REJECTED;
                      setState(() {});
                    },
                  )
              )
          ],
        )),
  );

}

class DateWidget extends StatelessWidget{

  final DateTime startDate;
  final DateTime endDate;
  final Color color;

  const DateWidget(this.startDate, this.endDate, this.color, {Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    int span = (endDate??DateTime(2966)).millisecondsSinceEpoch - startDate.millisecondsSinceEpoch;
    int today = DateTime.now().millisecondsSinceEpoch - startDate.millisecondsSinceEpoch;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){

        double width = constraints.maxWidth - Dimen.ICON_SIZE;
        double progress = today/span;
        double leftPadd = width*(max(0, min(progress, 1)));

        return Column(
          children: [

            Row(
              children: [

                Icon(MdiIcons.calendarStart, color: color),
                const SizedBox(width: Dimen.ICON_MARG),

                Text(
                  dateToString(startDate, shortMonth: true),
                  style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold, color: color),
                ),
              ],
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            if(endDate != null)
              Row(
                children: [
                  Icon(MdiIcons.calendarEnd, color: color),

                  const SizedBox(width: Dimen.ICON_MARG),

                  Text(
                    dateToString(endDate, shortMonth: true),
                    style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold, color: color),
                  ),

                ],
              ),

            if(endDate != null)
              const SizedBox(height: Dimen.SIDE_MARG),

            Stack(
              children: [

                SizedBox(
                    height: Dimen.ICON_FOOTPRINT,
                    child: Center(
                        child: Container(
                          height: 3.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: color.withOpacity(.2),
                              borderRadius: const BorderRadius.all(Radius.circular(3.0))
                          ),
                        )
                    )
                ),

                Positioned(
                  left: leftPadd,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(MdiIcons.timerSand, color: color),
                    onPressed: (){

                      if(endDate == null) {
                        showAppToast(context, text: 'Brak terminu zakończenia.');
                        return;
                      }
                      int daysLeft = Duration(milliseconds: endDate.millisecondsSinceEpoch - DateTime.now().millisecondsSinceEpoch).inDays;
                      if(daysLeft < 0) daysLeft = 0;
                      int weeksLeft = daysLeft ~/ 7;

                      if(weeksLeft > 0)
                        showAppToast(context, text: 'Pozostało $weeksLeft tygodni.');
                      else
                        showAppToast(context, text: 'Pozostało $daysLeft dni.');

                    },
                  ),
                )

              ],
            ),

          ],
        );
      },
    );

  }

}

class AwardsWidget extends StatelessWidget{

  final IndivComp comp;
  final EdgeInsets padding;

  const AwardsWidget(this.comp, {this.padding, Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        Padding(
          padding: padding,
          child: TitleShortcutRowWidget(
            title: 'Nagrody',
            textAlign: TextAlign.start,
            titleColor: hintEnab_(context),
            onOpen: (context) => pushPage(context, builder: (context) => IndivCompAwardsPage(comp)),
          ),
        ),

        AwardPageViewWidget(comp.awards, padding: padding)

      ],
    );

  }

}

class PendingWidget extends StatelessWidget{

  final String compId;
  final IndivComp comp;
  final void Function(IndivCompParticip, IndivCompTaskCompl) onAccepted;
  final void Function(IndivCompParticip, IndivCompTaskCompl) onRejected;

  const PendingWidget(this.compId, this.comp, {this.onAccepted, this.onRejected, Key key}): super(key: key);

  static double get height =>
      Dimen.ICON_FOOTPRINT +
          2*AppCard.NORM_MARGIN_VAL +
          2*AppCard.DEF_PADDING_VAL;

  @override
  Widget build(BuildContext context) => Consumer<ComplTasksProvider>(
      builder: (context, prov, child){

        int pendingTaskCount = 0;
        for(IndivCompParticip particip in comp.particips)
          for(IndivCompTaskCompl task in particip.profile.completedTasks)
            if(task.acceptState == TaskAcceptState.PENDING)
              pendingTaskCount++;

        return GradientWidget(
          elevation: AppCard.bigElevation,
          radius: AppCard.BIG_RADIUS,
          colorStart: comp.colors.colorStart,
          colorEnd: comp.colors.colorEnd,
          child: InkWell(
            onTap: () async {

              if(!await isNetworkAvailable()){
                showAppToast(context, text: 'Brak dostępu do Internetu');
                return;
              }

              pushPage(context, builder: (context) => IndivCompProfilePendingComplTasksPage(
                comp,
                onRejected: onRejected,
                onAccepted: onAccepted,
              ));
            },
            child: TitleShortcutRowWidget(
              leading: Padding(
                padding: const EdgeInsets.all(Dimen.ICON_MARG + AppCard.DEF_PADDING_VAL),
                child: Icon(MdiIcons.cube, color: background_(context)),
              ),
              title: (pendingTaskCount==0?'':'($pendingTaskCount) ') + 'Wnioski o uznanie',
              titleColor: background_(context),
              trailing: IconButton(
                  padding: const EdgeInsets.all(Dimen.ICON_MARG + AppCard.DEF_PADDING_VAL),
                  icon: Icon(MdiIcons.arrowRight, color: background_(context)),
                  onPressed: null
              ),
            ),
          ),
        );

      }
  );

}

class TasksWidget extends StatelessWidget{

  static const double separatorHeight = 12.0;

  final IndivComp comp;
  final void Function(List<IndivCompTaskCompl>) onReqSent;
  final void Function(List<IndivCompTaskCompl>, Map<String, Tuple3<int, int, Tuple2<double, double>>>) onSelfGranted;

  const TasksWidget(this.comp, {this.onReqSent, this.onSelfGranted, Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    Map<String, List<IndivCompTaskCompl>> pendingComplTasksMap = {};
    for(IndivCompTaskCompl complTask in comp.profile.completedTasks){
      if(pendingComplTasksMap[complTask.taskKey] == null)
        pendingComplTasksMap[complTask.taskKey] = [];

      if(complTask.acceptState == TaskAcceptState.PENDING)
        pendingComplTasksMap[complTask.taskKey].add(complTask);
    }

    bool adminOrMod = comp.profile.role == CompRole.ADMIN || comp.profile.role == CompRole.MODERATOR;

    for(int i=0; i<comp.tasks.length; i++) {
      IndivCompTask task = comp.tasks[i];

      if(task.state != TaskState.OPEN)
        continue;

      children.add(IndivCompTaskWidget(
        task,
        bottom: comp.profile.active?Row(
          children: [

            Expanded(
              child: SimpleButton.from(
                  textColor:
                  pendingComplTasksMap[task.key] == null || pendingComplTasksMap[task.key].isEmpty?
                  iconDisab_(context):
                  iconEnab_(context),
                  margin: EdgeInsets.zero,
                  icon: MdiIcons.clockOutline,
                  text:
                  pendingComplTasksMap[task.key] == null || pendingComplTasksMap[task.key].isNotEmpty?
                  '${pendingComplTasksMap[task.key]?.length??0}':
                  null,

                  onTap:
                  pendingComplTasksMap[task.key] == null || pendingComplTasksMap[task.key].isEmpty?
                  null: () => openDialog(
                      context: context,
                      builder: (context) => CompleteTasksDialog(
                        comp,
                        pendingComplTasksMap[task.key],
                        onRemoved: (complTask){
                          comp.profile.completedTasks.remove(complTask);
                          Provider.of<IndivCompProvider>(context, listen: false).notify();
                        },
                      )
                  )
              ),
            ),

            Expanded(
              child: SimpleButton.from(
                  context: context,
                  margin: EdgeInsets.zero,
                  iconLeading: false,
                  text: 'Zrealizuj',
                  icon: MdiIcons.cubeSend,
                  onTap: () async {

                    if(!await isNetworkAvailable()){
                      showAppToast(context, text: 'Brak dostępu do Internetu');
                      return;
                    }

                    await openDialog(
                        context: context,
                        builder: (context) =>
                            Center(
                              child: IndivTaskComplReqWidget(
                                comp.tasks,
                                task,
                                adminOrMod: adminOrMod,
                                onSuccess:
                                adminOrMod?
                                onSelfGranted:
                                (complTaskList, _) => onReqSent?.call(complTaskList),
                              ),
                            )
                    );

                  }
              ),
            ),

          ],
        ):null,
      ));

      if(i < comp.tasks.length-1)
        children.add(const SizedBox(height: separatorHeight));
    }

    return Padding(
      padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
      child: Column(
        children: [

          TitleShortcutRowWidget(
              title: 'Tabela zadań',
              titleColor: hintEnab_(context),
              textAlign: TextAlign.start
          ),

          Column(
            children: children,
          )

        ],
      ),
    );
  }

}

class CompletedTasksPreviewWidget extends StatelessWidget{

  final IndivComp comp;
  final EdgeInsets padding;

  const CompletedTasksPreviewWidget(this.comp, {this.padding=EdgeInsets.zero, Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> tasksWidgets = [];
    Iterator<IndivCompTaskCompl> reversedComplTasks = comp.profile.completedTasks.reversed.iterator;
    for(int i=0; i<comp.profile.completedTasks.length; i++) {

      reversedComplTasks.moveNext();
      IndivCompTaskCompl taskCompl = reversedComplTasks.current;

      if (taskCompl.acceptState == TaskAcceptState.ACCEPTED)
        tasksWidgets.add(IndivCompTaskComplWidget(
          comp,
          taskCompl,
          preview: true,
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CompletedTasksPage(comp))),
        ));

      if (tasksWidgets.length == 4 + 3)
        break;

      if(i < comp.profile.completedTasks.length-1)
        tasksWidgets.add(const SizedBox(height: TasksWidget.separatorHeight));

    }

    if(tasksWidgets.isEmpty)
      return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            children: [

              Icon(MdiIcons.cubeOff, color: textEnab_(context)),
              TitleShortcutRowWidget(title: 'Nie zrealizował${AccSecData.sex==Sex.male?'eś':'aś'}\nżadnych zadań.'),
            ],
          )
      );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        Padding(
          padding: padding,
          child: Column(
            children: tasksWidgets,
          ),
        ),

        if(comp.profile.completedTasks.length > 4)
          Center(
            child: SimpleButton.from(
                context: context,
                icon: MdiIcons.dotsHorizontal,
                text: '(+${comp.profile.completedTasks.length - 3})',
                textSize: Dimen.TEXT_SIZE_APPBAR,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CompletedTasksPage(comp)))
            ),
          )

      ],
    );
  }

}

class ParticipantsWidget extends StatelessWidget{

  final IndivComp comp;
  final EdgeInsets padding;

  const ParticipantsWidget(this.comp, {this.padding=EdgeInsets.zero, Key key}): super(key: key);

  static void onTap(IndivComp comp, BuildContext context) => pushPage(
      context,
      builder: (context) =>
      comp.profile.role == CompRole.ADMIN || comp.profile.role == CompRole.MODERATOR?
      ParticipantListAdminPage(comp):
      ParticipantListPage(comp)
  );

  @override
  Widget build(BuildContext context) {

    return AccountThumbnailRowWidget(
        comp.particips.map((particip) => particip.name).toList(),
        padding: padding,
        heroBuilder: (index) => comp.particips[index],
        onTap: () => onTap(comp, context)
    );
  }

}

class CompleteTasksDialog extends StatefulWidget{

  final IndivComp comp;
  final List<IndivCompTaskCompl> complTasks;
  final void Function(IndivCompTaskCompl) onRemoved;

  const CompleteTasksDialog(this.comp, this.complTasks, {this.onRemoved, Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() => CompleteTasksDialogState();

}

class CompleteTasksDialogState extends State<CompleteTasksDialog> {

  IndivComp get comp => widget.comp;

  List<IndivCompTaskCompl> get complTasks => widget.complTasks;

  void Function(IndivCompTaskCompl) get onRemoved => widget.onRemoved;

  @override
  Widget build(BuildContext context) =>
      BottomNavScaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          slivers: [
            const SliverAppBar(
              floating: true,
              title: Text('Prośby o zaliczenie'),
              centerTitle: true,
            ),

            SliverPadding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              sliver: SliverList(
                delegate: SliverChildSeparatedBuilderDelegate((context, index) =>
                    IndivCompTaskComplWidget(
                        comp,
                        complTasks[index],
                        onRemoved: (text) {
                          IndivCompTaskCompl complTask = complTasks.removeAt(index);
                          onRemoved?.call(complTask);
                          if (complTasks.isEmpty) {
                            Navigator.pop(context);
                            return;
                          }
                          if (mounted) setState(() {});
                        }
                    ),
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(height: Dimen.SIDE_MARG),
                  count: complTasks.length,
                ),
              ),
            )
          ],
        ),
      );
}

class LeaveNotAdminDialog extends StatelessWidget{

  final IndivComp comp;
  const LeaveNotAdminDialog(this.comp, {Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        TitleShortcutRowWidget(
          title: 'Strefa zagrożenia!',
          titleColor: hintEnab_(context),
        ),

        LeaveButton(comp)

      ],
    );
  }

}

class ShareCodeWidget extends StatefulWidget{

  final IndivComp comp;
  final bool enabled;

  const ShareCodeWidget(this.comp, {this.enabled, Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() => ShareCodeWidgetState();

}

class ShareCodeWidgetState extends State<ShareCodeWidget>{

  IndivComp get comp => widget.comp;

  bool get processing => !widget.enabled??_processing;
  bool _processing;

  @override
  void initState() {
    _processing = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Material(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
      elevation: AppCard.bigElevation,
      color: cardEnab_(context),
      child: Stack(
        children: [

          Padding(
              padding: const EdgeInsets.all(Dimen.ICON_MARG),
              child: Stack(
                children: [

                  Text('Kod dostępu:', style: AppTextStyle(fontWeight: weight.halfBold, color: hintEnab_(context))),

                  Row(
                    children: [

                      const SizedBox(width: Dimen.ICON_FOOTPRINT),

                      Expanded(
                          child: GestureDetector(
                            onLongPress: (){
                              Clipboard.setData(ClipboardData(text: comp.shareCode));
                              showAppToast(context, text: 'Skopiowano');
                            },
                            child: Text(
                              comp.shareCode,
                              style: AppTextStyle(
                                  fontSize: Dimen.ICON_SIZE,
                                  fontWeight: weight.bold,
                                  color: comp.shareCodeSearchable?iconEnab_(context):iconDisab_(context)
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                      ),

                      IconButton(
                        icon: const Icon(MdiIcons.refresh),
                        onPressed: processing || !comp.shareCodeSearchable?null:() async {

                          setState(() => _processing = true);
                          await ApiIndivComp.resetShareCode(
                              compKey: comp.key,
                              onSuccess: (shareCode){
                                setState(() => comp.shareCode = shareCode);
                              },
                              onError: (Map errData){
                                if(errData['errors'] != null && errData['errors']['share_code'] == 'share_code_changed_too_soon')
                                  showAppToast(context, text: 'Za często zmieniasz kod dostępu');
                              }
                          );
                          setState(() => _processing = false);

                        },
                      ),

                    ],
                  )

                ],
              )
          ),

          Positioned(
            left: 0,
            top: -60,
            bottom: -60,
            child: Icon(
                MdiIcons.radar,
                color: backgroundIcon_(context),
                size: (Dimen.ICON_FOOTPRINT + 2*Dimen.ICON_MARG) + 2*60
            ),
          )

        ],
      )
  );

}