import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/duration_date_widget.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/comp_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_thumbnail_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/rank_disp_type.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/compl_tasks_provider.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/indiv_comp_particips_provider.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/task_accept_state.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_thumbnail_row_widget.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp/values/consts.dart';
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
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:tuple/tuple.dart';

import '../../../../_common_widgets/bottom_sheet.dart';
import '../../../details/app_settings.dart';
import 'package:harcapp/_new/module_statistics_registrator.dart';
import '../../common.dart';
import 'common/indiv_comp_rank_icon.dart';
import 'common/points_widget.dart';
import 'indiv_comp_awards_page.dart';
import 'indiv_comp_completed_task_page/review_page/completed_tasks_review_page.dart';
import 'indiv_comp_editor/_main.dart';
import 'indiv_comp_editor/common.dart';
import 'indiv_comp_particip/participants_page.dart';
import 'indiv_comp_completed_task_page/completed_tasks_page.dart';
import 'indiv_comp_particip/participants_extended_page.dart';
import 'indiv_comp_completed_task_page/indiv_comp_completed_task_request_widget.dart';
import 'indiv_comp_participants_loader.dart';
import 'indiv_comp_task_widget.dart';
import 'models/show_rank_data.dart';
import 'models/indiv_comp.dart';
import 'models/indiv_comp_particip.dart';
import 'models/indiv_comp_task_compl.dart';

class IndivCompPage extends StatefulWidget{

  final IndivComp comp;
  final void Function()? onRemoved;

  const IndivCompPage(this.comp, {this.onRemoved, super.key});

  @override
  State<StatefulWidget> createState() => IndivCompPageState();

}

class IndivCompPageState extends State<IndivCompPage> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.indivComp;

  IndivComp get comp => widget.comp;

  Color? get compIconColor => !comp.colors.iconWhite&&!AppSettings.isDark?
  textEnab_(context):
  background_(context);

  late RefreshController refreshController;

  late bool changeShareCodeProcessing;

  late LoginListener loginListener;

  @override
  void initState() {
    changeShareCodeProcessing = false;
    refreshController = RefreshController();

    loginListener = LoginListener(
      onLogout: (force) => Navigator.pop(context)
    );
    AccountData.addLoginListener(loginListener);
    super.initState();
  }

  @override
  void dispose() {
    AccountData.removeLoginListener(loginListener);
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: Consumer<IndivCompProvider>(
        builder: (context, indivCompProv, child) => SmartRefresher(
            enablePullDown: true,
            physics: const BouncingScrollPhysics(),
            header: MaterialClassicHeader(color: comp.colors.avgColor),
            controller: refreshController,
            onRefresh: () async {

              LoginProvider loginProv = LoginProvider.of(context);

              if(!await isNetworkAvailable()){
                if(!mounted) return;
                showAppToast(context, text: noInternetMessage);
                refreshController.refreshCompleted();
                return;
              }

              await ApiIndivComp.get(
                  compKey: comp.key,
                  onSuccess: (IndivComp updatedComp){
                    comp.update(updatedComp);
                    IndivComp.updateInAll(comp, context: mounted?context:null);
                    if(!mounted) return;
                    setState(() {});
                    showAppToast(context, text: 'Zaktualizowano');
                  },
                  onServerMaybeWakingUp: () {
                    if(mounted) showServerWakingUpToast(context);
                    return true;
                  },
                  onError: (){
                    if(!mounted) return;
                    showAppToast(context, text: simpleErrorMessage);

                    if(!AccountData.loggedIn)
                      loginProv.notify();
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

                    if(comp.myProfile?.role == CompRole.ADMIN)
                      IconButton(
                          icon: Icon(
                            comp.shareCodeSearchable?
                            ShareCodeDialog.iconOn:
                            ShareCodeDialog.iconOff,
                          ),
                          onPressed: () => openDialog(
                            context: context,
                            builder: (context) => ShareCodeDialog.from(
                              comp.shareCode!,
                              comp.shareCodeSearchable,
                              !changeShareCodeProcessing,
                              resetShareCode: () async {
                                await ApiIndivComp.resetShareCode(
                                    compKey: comp.key,
                                    onSuccess: (shareCode){
                                      comp.shareCode = shareCode;
                                      if(mounted) setState((){});
                                    },
                                    onServerMaybeWakingUp: () {
                                      if(mounted) showServerWakingUpToast(context);
                                      return true;
                                    },
                                    onError: (dynamic errData){
                                      if(errData is Map && errData['errors'] != null && errData['errors']['shareCode'] == 'share_code_changed_too_soon')
                                        if(mounted) showAppToast(context, text: 'Za często zmieniasz kod dostępu');
                                    }
                                );
                                return comp.shareCode;
                              },
                              changeShareCodeSearchable: () async {
                                await ApiIndivComp.setShareCodeSearchable(
                                    compKey: comp.key,
                                    searchable: !comp.shareCodeSearchable,
                                    onSuccess: (searchable){
                                      comp.shareCodeSearchable = searchable;
                                      if(!mounted) return;
                                      setState((){});
                                      showAppToast(
                                          context,
                                          text: searchable?
                                          'Każdy może teraz dołączyć do kręgu znając kod dostępu':
                                          'Dołączanie po kodzie dostępu wyłączone',
                                          duration: searchable?const Duration(seconds: 5):const Duration(seconds: 3)
                                      );
                                    },
                                    onServerMaybeWakingUp: () {
                                      if(mounted) showServerWakingUpToast(context);
                                      return true;
                                    },
                                    onError: (){
                                      if(mounted) showAppToast(context, text: simpleErrorMessage);
                                    }
                                );
                                return comp.shareCodeSearchable;
                              },
                              description: 'To, co widzisz, to <b>kod dostępu</b>.'
                                  '\n\nPozwala on dołączyć do kręgu tym, którzy go znają.',
                              resetFrequencyDays: 2,
                            ),
                          )
                      ),

                    IconButton(
                      icon: Icon(MdiIcons.cogOutline),
                      onPressed: comp.myProfile?.role == CompRole.ADMIN?
                          () => openEditCompPage(context):
                          () => showScrollBottomSheet(
                          context: context,
                          builder: (context) => BottomSheetDef(
                            builder: (context) => LeaveNotAdminDialog(comp),
                          )
                      ),

                    )

                  ],
                ),

                if(comp.myProfile?.role == CompRole.ADMIN || comp.myProfile?.role == CompRole.MODERATOR)
                  FloatingContainer(
                    builder: (context, _, __) => Padding(
                      padding: const EdgeInsets.only(
                        top: Dimen.ICON_MARG,
                        left: Dimen.ICON_MARG,
                        right: Dimen.ICON_MARG,
                      ),
                      child: PendingCompletedTasksReviewWidget(
                        comp,
                        onAccepted: (IndivCompParticip particip, IndivCompCompletedTask complTask){
                          comp.getParticip(particip.key)!.profile.loadedCompletedTaskMap[complTask.key]!.acceptState = TaskAcceptState.ACCEPTED;
                          setState(() {});
                        },
                        onRejected: (IndivCompParticip particip, IndivCompCompletedTask complTask){
                          comp.getParticip(particip.key)!.profile.loadedCompletedTaskMap[complTask.key]!.acceptState = TaskAcceptState.REJECTED;
                          setState(() {});
                        },
                      ),
                    ),
                    height: PendingCompletedTasksReviewWidget.height + Dimen.ICON_MARG,
                    rebuild: true,
                  ),

                SliverList(delegate: SliverChildListDelegate([

                  Padding(
                    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                    child: CompHeaderWidget(comp),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                    child: DurationDateWidget(
                      startDate: comp.startTime,
                      endDate: comp.endTime,
                      colors: comp.colors,
                    ),
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

                  if(comp.openTaskCount == 0)
                    NoTaskWidget(
                      onTap: () => openEditCompPage(context, initTab: 3),
                    )
                  else
                    TaskListWidget(
                      comp,
                      onReqSent: (List<IndivCompCompletedTask> complTasks){
                        IndivCompCompletedTask complTask = complTasks[0];
                        comp.myProfile!.addLoadedCompletedTask(complTask, increaseTotalCount: true);
                        comp.myProfile!.addLoadedPendingCompletedTask(complTask);
                        indivCompProv.notify();
                        setState(() {});
                      },
                      onGranted: (List<IndivCompCompletedTask> complTasks, Map<String, ShowRankData> idRank){

                        for(IndivCompCompletedTask complTask in complTasks) {
                          comp.getParticip(complTask.participKey)?.profile.addLoadedCompletedTask(complTask, increaseTotalCount: true);
                          comp.addPoints(complTask.participKey, complTask.points);
                        }

                        comp.handleRanks(idRank);
                        indivCompProv.notify();
                        setState(() {});
                      },
                    ),

                  if(comp.awards.isNotEmpty)
                    const SizedBox(height: Dimen.SIDE_MARG),

                  if(comp.awards.isNotEmpty)
                    AwardsWidget(comp, padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG)),

                  const SizedBox(height: Dimen.SIDE_MARG),

                  if(comp.bindedCircle != null)
                    Padding(
                      padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
                      child: AppText(
                        'Współzawodnictwo jest powiązane z kręgiem <b>${comp.bindedCircle!.name}</b>',
                        size: Dimen.TEXT_SIZE_BIG,
                        color: hintEnab_(context),
                        textAlign: TextAlign.center,
                        height: 1.2,
                      ),
                    ),

                  if(comp.bindedCircle != null)
                    const SizedBox(height: Dimen.SIDE_MARG),

                ]))

              ],
            )
        )
    ),
  );

  void openEditCompPage(BuildContext context, {int? initTab}) {

    IndivCompProvider indivCompProv = IndivCompProvider.of(context);
    IndivCompListProvider indivCompListProv = IndivCompListProvider.of(context);
    IndivCompParticipsProvider indivCompParticipsProv = IndivCompParticipsProvider.of(context);

    pushPage(
        context,
        builder: (context) =>
            IndivCompEditorPage(
              initTab: initTab,
              initComp: comp,
              onSuccess: (IndivComp savedComp) {
                comp.update(savedComp);

                indivCompProv.notify();
                indivCompParticipsProv.notify();
                indivCompListProv.notify();

                if (!mounted) return;
                setState(() {});

                Navigator.pop(context);
              },
              onRemoved: () {
                widget.onRemoved?.call();
                if (mounted) Navigator.pop(context);
              },
            )
    );
  }

}

class CompHeaderWidget extends StatelessWidget{

  final IndivComp comp;

  const CompHeaderWidget(this.comp, {super.key});

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

        if(comp.myProfile?.active == true)
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Padding(
                  padding: const EdgeInsets.all(Dimen.defMarg),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Rank',
                          style: AppTextStyle(
                              fontSize: 42.0*PointsWidget.fontSizeCoeff,
                              fontWeight: weight.halfBold,
                              color: hintEnab_(context)
                          ),
                        ),
                      ),
                      IndivCompRankIcon(
                        comp.myProfile!,
                        activeParticipCnt: comp.activeParticipCount,
                        showPercent: comp.rankDispType == RankDispType.RANGE_PERC,
                        colors: comp.colors,
                        size: 42.0,
                        showPopularityOnTap: true,
                        key: ValueKey(Tuple2(comp.rankDispType, comp.activeParticipCount)),
                      ),
                    ],
                  ),
                ),

                SimpleButton(
                  radius: AppCard.bigRadius,
                  padding: const EdgeInsets.all(Dimen.defMarg),
                  margin: EdgeInsets.zero,
                  onTap: () => comp.myProfile?.completedTasksCount == 0?
                      showAppToast(context, text: 'Brak zrealizowanych zadań'):
                      pushPage(context, builder: (context) => CompletedTasksPage(
                          comp,
                          title: 'Moje zadania',
                          particip: comp.getParticip(AccountData.key!),
                          initLoadedCompletedTasks: comp.myProfile!.loadedCompletedTasks,
                          acceptState: TaskAcceptState.ACCEPTED,
                          onCompletedTasksPageLoaded: (tasksPage) => comp.myProfile!.addLoadedCompletedTasks(tasksPage, increaseTotalCount: false),
                          onCompletedTasksRefreshed: (tasksPage) => comp.myProfile!.setAllLoadedCompletedTasks(tasksPage),
                      )),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Pkt',
                          style: AppTextStyle(
                              fontSize: 42.0*PointsWidget.fontSizeCoeff,
                              fontWeight: weight.halfBold,
                              color: hintEnab_(context)
                          ),
                        ),
                      ),

                      PointsWidget(points: comp.myProfile?.points, size: 42.0),

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

class PendingCompletedTasksReviewWidget extends StatelessWidget{

  final IndivComp comp;
  final void Function(IndivCompParticip, IndivCompCompletedTask)? onAccepted;
  final void Function(IndivCompParticip, IndivCompCompletedTask)? onRejected;

  const PendingCompletedTasksReviewWidget(this.comp, {this.onAccepted, this.onRejected, super.key});

  static double get height => Dimen.ICON_FOOTPRINT + 2*AppCard.defPaddingVal;

  @override
  Widget build(BuildContext context) => Consumer<ComplTasksProvider>(
      builder: (context, prov, child) => GradientWidget(
        elevation: AppCard.bigElevation,
        radius: AppCard.bigRadius,
        colorStart: comp.colors.colorStart,
        colorEnd: comp.colors.colorEnd,
        child: InkWell(
          onTap: () async {

            if(!await isNetworkAvailable()){
              showAppToast(context, text: noInternetMessage);
              return;
            }

            pushPage(context, builder: (context) => CompletedTasksReviewPage(
              comp,

              onRejected: onRejected,
              onAccepted: onAccepted,
            ));

          },
          child: TitleShortcutRowWidget(
            leading: Padding(
              padding: const EdgeInsets.only(left: Dimen.ICON_MARG + AppCard.defPaddingVal),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(MdiIcons.cube, color: background_(context)),
                  if((comp.completedTasksPendingCount??0) > 0)
                    Text(
                      '${comp.completedTasksPendingCount}',
                      style: AppTextStyle(color: background_(context), fontWeight: weight.bold),
                    )
                ],
              ),
            ),
            title: 'Wnioski o punkty',
            titleColor: background_(context),
            trailing: IconButton(
                padding: const EdgeInsets.all(Dimen.ICON_MARG + AppCard.defPaddingVal),
                icon: Icon(MdiIcons.arrowRight, color: background_(context)),
                onPressed: null
            ),
          ),
        ),
      )
  );

}

class ParticipantsWidget extends StatefulWidget{

  final IndivComp comp;
  final EdgeInsets padding;

  const ParticipantsWidget(this.comp, {this.padding=EdgeInsets.zero, super.key});

  static void onTap(IndivComp comp, BuildContext context) => pushPage(
      context,
      builder: (context) =>
      comp.myProfile?.role == CompRole.ADMIN || comp.myProfile?.role == CompRole.MODERATOR?
      ParticipantsExtendedPage(comp):
      ParticipantsPage(comp: comp)
  );

  @override
  State<StatefulWidget> createState() => ParticipantsWidgetState();

}

class ParticipantsWidgetState extends State<ParticipantsWidget>{

  IndivComp get comp => widget.comp;
  EdgeInsets get padding => widget.padding;

  late IndivCompParticipantsLoaderListener participsLoaderListener;

  @override
  void initState() {

    IndivCompProvider indivCompProv = IndivCompProvider.of(context);
    IndivCompListProvider indivCompListProv = IndivCompListProvider.of(context);
    IndivCompParticipsProvider indivCompParticipsProv = IndivCompParticipsProvider.of(context);

    participsLoaderListener = IndivCompParticipantsLoaderListener(
      onStart: () => setState((){}),
      onNoInternet: (){
        if(!mounted) return;
        showAppToast(context, text: noInternetMessage);
      },
      onParticipantsLoaded: (participsPage, reloaded){
        IndivComp.callProvidersWithParticips(indivCompProv, indivCompListProv, indivCompParticipsProv);
      },
      onForceLoggedOut: (){
        if(!mounted) return true;
        showAppToast(context, text: forceLoggedOutMessage);
        return true;
      },
      onServerMaybeWakingUp: (){
        if(!mounted) return true;
        showServerWakingUpToast(context);
        return true;
      },
      onError: (_){
        if(!mounted) return;
        showAppToast(context, text: simpleErrorMessage);
      },
    );

    comp.addParticipLoaderListener(participsLoaderListener);
    if(comp.loadedParticips.length == 1 && comp.participCount > 1 && !comp.isParticipsLoading())
      comp.reloadParticipsPage();
    super.initState();
  }

  @override
  void dispose() {
    comp.removeParticipLoaderListener(participsLoaderListener);
    super.dispose();
  }

  bool get hideMiniRanks => comp.rankDispType == RankDispType.RANGE && comp.myProfile?.role == CompRole.OBSERVER;

  @override
  Widget build(BuildContext context) => Padding(
    padding: padding,
    child: Consumer<IndivCompParticipsProvider>(
      builder: (context, prov, child) => Row(
        children: [

          Expanded(
            child: AccountThumbnailLoadableRowWidget(
              comp.loadedParticips.map((particip) => particip.name).toList(),
              heroBuilder: (index) => comp.loadedParticips[index],
              onTap: () => ParticipantsWidget.onTap(comp, context),

              onLoadMore: () => comp.loadParticipsPage(),
              isLoading: comp.isParticipsLoading(),
              isMoreToLoad: comp.loadedParticips.length < comp.participCount,
              squeezable: hideMiniRanks,
              thumbnailMarkBuilder: hideMiniRanks?null:(context, size, index) => IndivCompRankIcon(
                  comp.loadedParticips[index].profile,
                  activeParticipCnt: comp.activeParticipCount,
                  colors: comp.colors,
                  size: size,
              ),
            )
          ),

          if(comp.participCount == 1)
            SimpleButton(
                color: backgroundIcon_(context),
                radius: 100,
                child: Row(
                  children: [
                    const SizedBox(width: 2*Dimen.ICON_MARG),

                    Text(
                      'Dodaj członków',
                      style: AppTextStyle(
                          fontWeight: weight.halfBold,
                          color: textEnab_(context),
                          fontSize: Dimen.TEXT_SIZE_APPBAR
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(width: Dimen.ICON_MARG),

                    AccountThumbnailWidget(
                      verified: false,
                      elevated: false,
                      icon: MdiIcons.accountPlusOutline,
                    )
                  ],
                ),
                onTap: () => ParticipantsWidget.onTap(comp, context)
            )

        ],
      ),
    ),
  );

}

class TaskWidget extends StatelessWidget{

  final IndivComp comp;
  final IndivCompTask task;
  final void Function(List<IndivCompCompletedTask>)? onReqSent;
  final void Function(List<IndivCompCompletedTask>, Map<String, ShowRankData>)? onSelfGranted;

  const TaskWidget(
      this.comp,
      this.task,
      { this.onReqSent,
        this.onSelfGranted,
        Key? key
      }) : super(key: key);

  int? get completedTasksPendingCount => comp.myProfile!.completedTasksPendingCount;

  @override
  Widget build(BuildContext context) => IndivCompTaskWidget(
    task,
    bottom:
    comp.myProfile?.active == true || comp.myProfile?.role == CompRole.MODERATOR || comp.myProfile?.role == CompRole.ADMIN?
    Row(
      children: [

        if(comp.myProfile?.role == CompRole.OBSERVER)
          Expanded(
            child: SimpleButton.from(
                radius: 0,
                textColor:
                comp.myProfile?.pendingTasksCount[task.key] == null || comp.myProfile?.pendingTasksCount[task.key] == 0?
                iconDisab_(context):
                iconEnab_(context),

                margin: EdgeInsets.zero,
                icon: MdiIcons.clockOutline,

                text:
                comp.myProfile?.pendingTasksCount[task.key] == null || comp.myProfile?.pendingTasksCount[task.key] == 0?
                null:
                '${comp.myProfile?.pendingTasksCount[task.key]??0}',
                onTap:
                comp.myProfile?.pendingTasksCount[task.key] == null || comp.myProfile?.pendingTasksCount[task.key] == 0?
                null:
                    () => pushPage(
                  context,
                  builder: (context) => CompletedTasksPage(
                    comp,
                    particip: comp.getParticip(AccountData.key!),
                    task: task,
                    acceptState: TaskAcceptState.PENDING,
                    title: 'Prośby o zaliczenie',
                    initLoadedCompletedTasks: comp.myProfile!.loadedPendingTasks[task.key],
                    onCompletedTasksRefreshed: (completedTasksPage) =>
                        comp.myProfile!.setAllLoadedPendingCompletedTasks(completedTasksPage),
                    onCompletedTasksPageLoaded: (completedTasksPage) =>
                        comp.myProfile!.addLoadedPendingCompletedTasks(completedTasksPage),
                    onCompletedTaskRemoved: (completedTask){
                      comp.myProfile!.removeLoadedPendingCompletedTaskByKey(completedTask.key);
                      comp.myProfile!.removeCompletedTaskByKey(completedTask.key);
                      IndivCompProvider.notify_(context);
                    },
                  ),
                )

            ),
          ),

        Expanded(
          child: SimpleButton.from(
              context: context,
              radius: 0,
              margin: EdgeInsets.zero,
              color: cardEnab_(context),
              iconLeading: false,
              text: comp.myProfile?.role == CompRole.OBSERVER?'Wnioskuj':'Rozdaj punkty',
              icon: comp.myProfile?.role == CompRole.OBSERVER?MdiIcons.cubeSend:IndivComp.pointsIcon,
              onTap: () async {

                if(!await isNetworkAvailable()){
                  showAppToast(context, text: noInternetMessage);
                  return;
                }
                bool adminOrMod = comp.myProfile?.role == CompRole.ADMIN || comp.myProfile?.role == CompRole.MODERATOR;

                await openDialog(
                    context: context,
                    builder: (context) =>
                        Center(
                          child: IndivCompCompetedTaskRequestWidget(
                            comp,
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
  );

}

class TaskListWidget extends StatelessWidget{

  static const double separatorHeight = 12.0;

  final IndivComp comp;
  final void Function(List<IndivCompCompletedTask>)? onReqSent;
  final void Function(List<IndivCompCompletedTask>, Map<String, ShowRankData>)? onGranted;

  const TaskListWidget(
      this.comp,
      { this.onReqSent,
        this.onGranted,
        super.key
      });

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(int i=0; i<comp.tasks.length; i++) {
      IndivCompTask task = comp.tasks[i];

      if(task.state != TaskState.OPEN)
        continue;

      children.add(
          TaskWidget(
            comp,
            task,
            onReqSent: onReqSent,
            onSelfGranted: onGranted,
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

class NoTaskWidget extends StatelessWidget{

  final void Function()? onTap;

  const NoTaskWidget({this.onTap, super.key});

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
      child: SimpleButton(
          radius: AppCard.bigRadius,
          color: cardEnab_(context),
          child: Padding(
            padding: const EdgeInsets.all(1.5*Dimen.SIDE_MARG),
            child: Row(
              children: [
                Icon(MdiIcons.cubeOutline, color: textEnab_(context), size: 64.0),

                const SizedBox(width: 1.5*Dimen.SIDE_MARG),

                Expanded(
                  child: Text(
                    'Brak zadań\nKliknij, by coś dodać!',
                    style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_APPBAR,
                      fontWeight: weight.halfBold,
                      color: textEnab_(context),
                      height: 1.2
                    ),
                  ),
                )

              ],
            )
          ),
        onTap: onTap,
      )
  );

}

class AwardsWidget extends StatelessWidget{

  final IndivComp comp;
  final EdgeInsets? padding;

  const AwardsWidget(this.comp, {this.padding, super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [

      Padding(
        padding: padding!,
        child: TitleShortcutRowWidget(
          title: 'Nagrody',
          textAlign: TextAlign.start,
          titleColor: hintEnab_(context),
          onOpen: () => pushPage(context, builder: (context) => IndivCompAwardsPage(comp)),
        ),
      ),

      GestureDetector(
        child: AwardPageViewWidget(comp, padding: padding),
        onTap: () => pushPage(context, builder: (context) => IndivCompAwardsPage(comp)),
      )

    ],
  );

}

class LeaveNotAdminDialog extends StatelessWidget{

  final IndivComp comp;
  const LeaveNotAdminDialog(this.comp, {super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [

      TitleShortcutRowWidget(
        title: 'Strefa zagrożenia!',
        titleColor: hintEnab_(context),
      ),

      LeaveCompButton(comp)

    ],
  );

}
