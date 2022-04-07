import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/comp_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_thumbnail_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_profile.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_particip/participant_list_page.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/rank_disp_type.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/compl_tasks_provider.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/indiv_comp_particips_provider.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/task_accept_state.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_thumbnail_row_widget.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
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

import '../../../../_common_widgets/bottom_sheet.dart';
import '../../../details/app_settings.dart';
import '../../../module_statistics_registrator.dart';
import 'common/indiv_comp_rank_icon.dart';
import 'common/points_widget.dart';
import 'indiv_comp_awards_page.dart';
import 'indiv_comp_editor/_main.dart';
import 'indiv_comp_editor/common.dart';
import 'indiv_comp_task_page/completed_tasks_page.dart';
import 'indiv_comp_particip/participant_list_admin_page.dart';
import 'indiv_comp_task_page/pending_task_page.dart';
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

                        if(!AccountData.loggedIn)
                          Provider.of<LoginProvider>(context, listen: false).notify();
                          Navigator.pop(context);
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
                          ),

                        IconButton(
                          icon: const Icon(MdiIcons.cogOutline),
                          onPressed: comp.profile.role == CompRole.ADMIN?() => pushPage(
                              context,
                              builder: (context) => IndivCompEditorPage(
                                initComp: comp,
                                onSaved: (IndivComp savedComp){

                                  comp.name = savedComp.name;
                                  comp.iconKey = savedComp.iconKey;
                                  comp.colorsKey = savedComp.colorsKey;
                                  comp.startTime = savedComp.startTime;
                                  comp.endTime = savedComp.endTime;
                                  comp.rankDispType = savedComp.rankDispType;

                                  comp.updateParticips(context, savedComp.particips);

                                  comp.tasks = savedComp.tasks;
                                  comp.awards = savedComp.awards;

                                  Provider.of<IndivCompProvider>(context, listen: false).notify();
                                  Provider.of<IndivCompParticipsProvider>(context, listen: false).notify();
                                  Provider.of<IndivCompListProvider>(context, listen: false).notify();

                                  setState(() {});

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

                        )
                      ],
                    ),

                    if(comp.profile.role == CompRole.ADMIN || comp.profile.role == CompRole.MODERATOR)
                      SliverPadding(
                        padding: const EdgeInsets.all(Dimen.DEF_MARG),
                        sliver: FloatingContainer(
                          builder: (context, _, __) => PendingWidget(
                            comp,
                            onAccepted: (IndivCompParticip particip, IndivCompTaskCompl complTask){
                              comp.participMap[particip.key].profile.completedTaskMap[complTask.key].acceptState = TaskAcceptState.ACCEPTED;
                              setState(() {});
                            },
                            onRejected: (IndivCompParticip particip, IndivCompTaskCompl complTask){
                              comp.participMap[particip.key].profile.completedTaskMap[complTask.key].acceptState = TaskAcceptState.REJECTED;
                              setState(() {});
                            },
                          ),
                          height: PendingWidget.height,
                          rebuild: true,
                        ),
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

                      Padding(
                        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                        child: CompHeaderWidget(comp),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                        child: DateWidget(comp),
                      ),

                      ParticipantsWidget(
                        comp,
                        padding: const EdgeInsets.only(
                            top: Dimen.SIDE_MARG,
                            left: Dimen.SIDE_MARG,
                            right: Dimen.SIDE_MARG
                        ),
                      ),

                      const SizedBox(height: Dimen.SIDE_MARG),

                      TaskListWidget(
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

                      const SizedBox(height: Dimen.SIDE_MARG),

                    ]))

                  ],
                )),

          ],
        )),
  );

}

class CompHeaderWidget extends StatelessWidget{

  final IndivComp comp;

  const CompHeaderWidget(this.comp, {Key key}): super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 120,
    child: Row(
      children: [

        IndivCompThumbnailWidget.from(
          comp: comp,
          size: 120,
          heroTag: IndivCompThumbnailWidget.defHeroTag(comp)
        ),

        const SizedBox(width: Dimen.ICON_MARG),

        if(comp.profile.active)
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Padding(
                  padding: const EdgeInsets.all(Dimen.DEF_MARG),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Rank',
                          style: AppTextStyle(
                              fontSize: 42.0*PointsWidget.fontSizeCoeff,
                              fontWeight: weight.bold,
                              color: hintEnab_(context)
                          ),
                        ),
                      ),
                      IndivCompRankIcon(
                        comp.profile,
                        activeParticipCnt: comp.activeParticipCnt,
                        showPercent: comp.rankDispType == RankDispType.RANGE_PERC,
                        colors: comp.colors,
                        size: 42.0,
                        showPopularityOnTap: true,
                        key: ValueKey(Tuple2(comp.rankDispType, comp.activeParticipCnt)),
                      ),
                    ],
                  ),
                ),

                SimpleButton(
                  radius: AppCard.BIG_RADIUS,
                  padding: const EdgeInsets.all(Dimen.DEF_MARG),
                  margin: EdgeInsets.zero,
                  onTap: () => comp.profile.completedTasks.isEmpty?
                      showAppToast(context, text: 'Brak zrealizowanych zadań.'):
                      pushPage(context, builder: (context) => CompletedTasksPage(
                        comp,
                        comp.profile.completedTasks,
                        comp.taskMap,
                        comp.participMap,
                        comp.colors
                      )),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Pkt',
                          style: AppTextStyle(
                              fontSize: 42.0*PointsWidget.fontSizeCoeff,
                              fontWeight: weight.bold,
                              color: hintEnab_(context)
                          ),
                        ),
                      ),

                      PointsWidget(points: comp.profile.points, size: 42.0),

                    ],
                  ),
                )

              ],
            ),
          )
        else
          Expanded(
            child: Text(
              'Jesteś tu tylko obserwatorem',
              style: AppTextStyle(
                  fontSize: 24.0,
                  fontWeight: weight.bold,
                  color: hintEnab_(context)
              ),
              textAlign: TextAlign.center,
            )
          )

      ],
    ),
  );

}

class DateWidget extends StatelessWidget{

  final IndivComp comp;

  DateTime get startDate => comp.startTime;
  DateTime get endDate => comp.endTime;
  Color get color => comp.colors.avgColor;

  const DateWidget(this.comp, {Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    int span = (endDate??DateTime(2966)).millisecondsSinceEpoch - startDate.millisecondsSinceEpoch;
    int today = DateTime.now().millisecondsSinceEpoch - startDate.millisecondsSinceEpoch;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){

        double width = constraints.maxWidth - Dimen.ICON_SIZE;
        double progress = today/span;
        double coloredDots = width*(max(0, min(progress, 1)));

        List<Widget> dots = [];
        for(int i = 0; i<width/Dimen.ICON_SIZE; i++){
          bool colored = coloredDots/Dimen.ICON_SIZE > i;
          bool nextColored = coloredDots/Dimen.ICON_SIZE > i + 1;
          dots.add(
            GestureDetector(
              child: Icon(
                  nextColored == colored?MdiIcons.circleMedium:MdiIcons.clockTimeEight,
                  color: colored?comp.colors.avgColor:iconDisab_(context)
              ),
              onTap: (){

                String message;
                if(endDate != null){
                  int daysLeft = Duration(
                      milliseconds: endDate.millisecondsSinceEpoch -
                          DateTime.now().millisecondsSinceEpoch).inDays;
                  if (daysLeft < 0) daysLeft = 0;
                  int weeksLeft = daysLeft ~/ 7;

                  if (weeksLeft > 0)
                    message = '$weeksLeft tyg.';
                  else
                    message = '$daysLeft dni';
                }

                showAppToast(
                    context,
                    text: message==null?'Brak czasu zakończenia':'Pozostało $message'
                );
              },
            )
          );
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: dots,
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
  Widget build(BuildContext context) => Column(
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

      AwardPageViewWidget(comp, padding: padding)

    ],
  );

}

class PendingWidget extends StatelessWidget{

  final IndivComp comp;
  final void Function(IndivCompParticip, IndivCompTaskCompl) onAccepted;
  final void Function(IndivCompParticip, IndivCompTaskCompl) onRejected;

  const PendingWidget(this.comp, {this.onAccepted, this.onRejected, Key key}): super(key: key);

  static double get height =>
      Dimen.ICON_FOOTPRINT +
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
              title: (pendingTaskCount==0?'':'($pendingTaskCount) ') + 'Wnioski o punkty',
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

class TaskWidget extends StatelessWidget{

  final IndivComp comp;
  final IndivCompTask task;
  final List<IndivCompTaskCompl> pendingTasks;
  final void Function(List<IndivCompTaskCompl>) onReqSent;
  final void Function(List<IndivCompTaskCompl>, Map<String, Tuple3<int, int, Tuple2<double, double>>>) onSelfGranted;

  const TaskWidget(
      this.comp,
      this.task,
      this.pendingTasks,
      { this.onReqSent,
        this.onSelfGranted,
        Key key
      }) : super(key: key);

  @override
  Widget build(BuildContext context) => IndivCompTaskWidget(
    task,
    bottom:
    comp.profile.active?
    Row(
      children: [

        Expanded(
          child: SimpleButton.from(
              textColor:
              pendingTasks == null || pendingTasks.isEmpty?
              iconDisab_(context):
              iconEnab_(context),

              margin: EdgeInsets.zero,
              icon: MdiIcons.clockOutline,

              text:
              pendingTasks == null || pendingTasks.isNotEmpty?
              '${pendingTasks?.length??0}':
              null,

              onTap:
              pendingTasks == null || pendingTasks.isEmpty?
              null: () => openDialog(
                  context: context,
                  builder: (context) => PendingTasksPage(
                    comp,
                    pendingTasks,
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
                bool adminOrMod = comp.profile.role == CompRole.ADMIN || comp.profile.role == CompRole.MODERATOR;

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
                            onSelfGranted: (complTaskList, _) => onReqSent?.call(complTaskList),
                          ),
                        )
                );

              }
          ),
        ),

      ],
    ):null,
  );

}

class TaskListWidget extends StatelessWidget{

  static const double separatorHeight = 12.0;

  final IndivComp comp;
  final void Function(List<IndivCompTaskCompl>) onReqSent;
  final void Function(List<IndivCompTaskCompl>, Map<String, Tuple3<int, int, Tuple2<double, double>>>) onSelfGranted;

  const TaskListWidget(
      this.comp,
      { this.onReqSent,
        this.onSelfGranted,
        Key key
      }): super(key: key);

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


    for(int i=0; i<comp.tasks.length; i++) {
      IndivCompTask task = comp.tasks[i];

      if(task.state != TaskState.OPEN)
        continue;

      children.add(
          TaskWidget(
              comp,
              task,
              pendingComplTasksMap[task.key],
              onReqSent: onReqSent,
              onSelfGranted: onSelfGranted,
          )
      );

      if(i < comp.tasks.length-1)
        children.add(const SizedBox(height: separatorHeight));
    }

    return Padding(
      padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
      child: Column(
        children: children,
      )
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

    return Padding(
      padding: padding,
      child: Row(
        children: [

          Expanded(
            child: AccountThumbnailRowWidget(
                comp.particips.map((particip) => particip.name).toList(),
                heroBuilder: (index) => comp.particips[index],
                onTap: () => onTap(comp, context)
            ),
          ),

          if(comp.particips.length == 1)
            const SizedBox(width: Dimen.ICON_MARG),

          if(comp.particips.length == 1)
            AccountThumbnailWidget(icon: MdiIcons.accountPlusOutline, onTap: () => onTap(comp, context))

        ],
      ),
    );
  }

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
    borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
    color: backgroundIcon_(context),
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS-6),
          color: background_(context),
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
      ),
    ),
  );

}