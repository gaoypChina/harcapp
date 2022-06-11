import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/indiv_comp_rank_icon.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/particip_header_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/particip_tile.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/points_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/comp_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_particip/participant_list_page_templ.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_task_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task_compl.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/indiv_comp_particips_provider.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/account/account_thumbnail_row_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tuple/tuple.dart';
import 'package:provider/provider.dart';

import '../../../../../_common_widgets/loading_widget.dart';
import '../indiv_comp_task_page/completed_tasks_page.dart';
import '../models/show_rank_data.dart';
import '../models/indiv_comp_profile.dart';
import '../models/rank_disp_type.dart';
import 'add_user_bottom_sheet.dart';

class ParticipantListAdminPage extends StatefulWidget{

  final IndivComp comp;

  const ParticipantListAdminPage(this.comp, {super.key});

  @override
  State<StatefulWidget> createState() => ParticipantListAdminPageState();

}

class ParticipantListAdminPageState extends State<ParticipantListAdminPage>{

  IndivComp get comp => widget.comp;

  late List<IndivCompParticip> selectedParticips;

  void onParticipProviderNotified() => setState((){});

  @override
  void initState() {

    IndivCompParticipsProvider.addOnNotifyListener(onParticipProviderNotified);
    selectedParticips = [];

    super.initState();
  }

  @override
  void dispose() {
    IndivCompParticipsProvider.removeOnNotifyListener(onParticipProviderNotified);
    super.dispose();
  }

  List<IndivCompParticip> inactiveSelParticips(){
    List<IndivCompParticip> result = [];
    for(IndivCompParticip particip in selectedParticips)
      if(!particip.profile.active) result.add(particip);

    return result;
  }

  void onPointsGranted(List<IndivCompTaskCompl> taskComplList, Map<String, ShowRankData> idRank){
    selectedParticips.clear();

    comp.handleRanks(idRank);

    for(IndivCompTaskCompl taskCompl in taskComplList) {
      comp.profile.addCompletedTask(taskCompl);
      comp.addPoints(taskCompl.participKey, taskCompl.points(comp));
    }

    Provider.of<IndivCompProvider>(context, listen: false).notify();
    Provider.of<IndivCompListProvider>(context, listen: false).notify();
    
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => Stack(
    children: [

      ParticipantListPageTempl(
        comp: comp,
        sortByPoints: true,

        adminsListHeaderTrailing: (participAdmins) => IconButton(
          icon: const Icon(MdiIcons.selectMultiple),
          onPressed: (){

            bool allSelected = true;
            for(IndivCompParticip particip in participAdmins)
              if(!selectedParticips.contains(particip)){
                allSelected = false;
                break;
              }

            if(allSelected)
              for(IndivCompParticip particip in participAdmins)
                selectedParticips.remove(particip);
            else
              for(IndivCompParticip particip in participAdmins)
                if(!selectedParticips.contains(particip)) selectedParticips.add(particip);

            setState(() {});

          },
        ),

        modsListHeaderTrailing: (participMods) => IconButton(
          icon: const Icon(MdiIcons.selectMultiple),
          onPressed: (){

            bool allSelected = true;
            for(IndivCompParticip particip in participMods)
              if(!selectedParticips.contains(particip)){
                allSelected = false;
                break;
              }

            if(allSelected)
              for(IndivCompParticip particip in participMods)
                selectedParticips.remove(particip);
            else
              for(IndivCompParticip particip in participMods)
                if(!selectedParticips.contains(particip)) selectedParticips.add(particip);

            setState(() {});

          },
        ),

        obsListHeaderTrailing: (participObs) => IconButton(
          icon: const Icon(MdiIcons.selectMultiple),
          onPressed: (){

            bool allSelected = true;
            for(IndivCompParticip particip in participObs)
              if(!selectedParticips.contains(particip)){
                allSelected = false;
                break;
              }

            if(allSelected)
              for(IndivCompParticip particip in participObs)
                selectedParticips.remove(particip);
            else
              for(IndivCompParticip particip in participObs)
                if(!selectedParticips.contains(particip)) selectedParticips.add(particip);

            setState(() {});
          },
        ),

        customAppBar:
        selectedParticips.isEmpty?
        SliverAppBar(
          title: const Text('Lista uczestników'),
          centerTitle: true,
          floating: true,
          actions: [
            if(comp.profile.role == CompRole.ADMIN)
              IconButton(
                  icon: const Icon(MdiIcons.plus),
                  onPressed: () => showScrollBottomSheet(
                      context: context,
                      builder: (context) => AddUserBottomSheet(comp)
                  )
              )
          ],
        ):
        SelectedAppBar(
          comp,
          selectedParticips,
          onSelectAll: () => setState((){
            selectedParticips.clear();
            selectedParticips.addAll(comp.particips);
          }),
          onUnselectAll: () => setState(() => selectedParticips.clear()),
        ),

        itemBuilder: (context, particip) => _ParticipTile(
          comp,
          particip,

          anythingSelected: selectedParticips.isNotEmpty,
          selected: selectedParticips.contains(particip),

          onSelectionTap: (){
            if(!particip.profile.active&& !selectedParticips.contains(particip))
              showAppToast(context, text: 'Pamiętaj, <b>${particip.name}</b> nie uczestniczy we współzawodnictwie. <b>Nie można mu przyznać punktów</b>.');

            if(selectedParticips.contains(particip))
              setState(() => selectedParticips.remove(particip));
            else
              setState(() => selectedParticips.add(particip));
          },
          onPointsGranted: onPointsGranted,
          heroTag: particip,
        ),

        bottomNavigationBar: selectedParticips.isEmpty?null:
        SimpleButton(
          margin: const EdgeInsets.only(
              left: SimpleButton.DEF_MARG,
              right: SimpleButton.DEF_MARG,
              bottom: SimpleButton.DEF_MARG
          ),
          radius: AppCard.BIG_RADIUS,
          onTap: (){

            List<IndivCompParticip> inactiveSelParticips = this.inactiveSelParticips();

            if(inactiveSelParticips.isEmpty)
              openAcceptTaskDialog(
                  context,
                  comp,
                  selectedParticips,
                  onPointsGranted: onPointsGranted
              );
            else if(inactiveSelParticips.length == 1)
              showAlertDialog(
                  context,
                  title: 'Nie wszyscy chcą punktów...',
                  content: '<b>${inactiveSelParticips[0].name}</b> nie uczestniczy we współzawodnictwie i nie można przyznać ${inactiveSelParticips[0].isMale?'mu':'jej'} punktów.\n\nOdznacz ${inactiveSelParticips[0].isMale?'go':'ją'}, by kontynuować.',
                  actionBuilder: (context) => [

                    AlertDialogButton(
                        text: 'No dobrze',
                        onTap: () => Navigator.pop(context)
                    )

                  ]
              );
            else
              showAlertDialog(
                  context,
                  title: 'Nie wszyscy chcą punktów...',
                  content: '<b>${inactiveSelParticips[0].name}</b> i <b>${inactiveSelParticips.length - 1} innych</b> nie uczestniczą we współzawodnictwie i nie można przyznać im punktów.\n\nOddzacz ich, by kontynuować.',
                  actionBuilder: (context) => [
                    SimpleButton(
                        child: Text('No dobrze', style: AppTextStyle(fontWeight: weight.halfBold)),
                        onTap: () => Navigator.pop(context)
                    )
                  ]
              );

          },
          color: comp.colors.colorStart,
          colorEnd: comp.colors.colorEnd,
          child: TitleShortcutRowWidget(
              icon: MdiIcons.plusCircleMultipleOutline,
              titleColor: background_(context),
              iconColor: background_(context),
              title: 'Zalicz zadanie'
          ),

        ),

      ),

      if(comp.particips.length == 1 && selectedParticips.isEmpty)
        Positioned(
            left: 2*Dimen.SIDE_MARG,
            right: 2*Dimen.SIDE_MARG,
            bottom: kBottomNavigationBarHeight + 2*Dimen.SIDE_MARG,
            child: Material(
              color: background_(context),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(MdiIcons.accountMultiple, size: 48.0, color: backgroundIcon_(context)),
                      const SizedBox(width: Dimen.DEF_MARG),
                      Icon(MdiIcons.accountPlus, size: 68.0, color: backgroundIcon_(context)),
                      const SizedBox(width: Dimen.DEF_MARG+8),

                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(pi),
                        child: Icon(MdiIcons.accountMultiple, size: 48.0, color: backgroundIcon_(context)),
                      )

                    ],
                  ),

                  //SizedBox(height: Dimen.SIDE_MARG),

                  AppText(
                    'Wybierz <b>+</b> w górnym prawym rogu, by <b>dodać uczestników</b> do współzawodnictwa',
                    color: hintEnab_(context),
                    size: Dimen.TEXT_SIZE_APPBAR,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
        )

    ],
  );

}

class SelectedAppBar extends SliverAppBar{

  final IndivComp comp;
  final List<IndivCompParticip?> selectedParticips;

  final void Function()? onSelectAll;
  final void Function()? onUnselectAll;

  SelectedAppBar(this.comp, this.selectedParticips, {Key? key, this.onSelectAll, this.onUnselectAll}):super(key: key,
    leadingWidth: Dimen.APPBAR_LEADING_WIDTH + Dimen.ICON_FOOTPRINT,
    leading: Row(
      children: [
        SizedBox(
          width: Dimen.APPBAR_LEADING_WIDTH,
          child: IconButton(
              icon: const Icon(MdiIcons.close),
              onPressed: onUnselectAll
          ),
        ),

      ],
    ),
    title: Text('Zaznaczono: ${selectedParticips.length}'),
    centerTitle: true,
    floating: true,
    pinned: true,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 2*Dimen.DEF_MARG),
        child: IconButton(
            icon: const Icon(MdiIcons.selectMultiple),
            onPressed: onSelectAll
        ),
      )
    ],
  );


}

class _ParticipTile extends StatefulWidget{

  final IndivComp comp;
  final IndivCompParticip particip;
  final bool anythingSelected;
  final bool selected;
  final void Function()? onSelectionTap;
  final void Function(List<IndivCompTaskCompl> taskComplList, Map<String, ShowRankData> idRank)? onPointsGranted;
  final dynamic heroTag;

  const _ParticipTile(
      this.comp,
      this.particip,
      { required this.anythingSelected,
        this.selected=false,
        this.onSelectionTap,
        this.onPointsGranted,
        this.heroTag,
        super.key
      });

  @override
  State<StatefulWidget> createState() => _ParticipTileState();

}

class _ParticipTileState extends State<_ParticipTile>{

  IndivComp get comp => widget.comp;
  IndivCompProfile get profile => comp.profile;

  IndivCompParticip get particip => widget.particip;
  bool get anythingSelected => widget.anythingSelected;
  bool get selected => widget.selected;
  void Function()? get onSelectionTap => widget.onSelectionTap;
  void Function(List<IndivCompTaskCompl> taskComplList, Map<String, ShowRankData> idRank)? get onPointsGranted => widget.onPointsGranted;

  get heroTag => widget.heroTag;

  double get actionExtentRation => (Dimen.ICON_FOOTPRINT + ParticipTile.horizontalPadding)/MediaQuery.of(context).size.width;

  void openParticipantDetails() => showScrollBottomSheet(
      context: context,
      builder: (context) => BottomSheetDef(
        builder: (context) => Column(
          children: [

            ParticipHeaderWidget(particip.name, particip.shadow, particip.profile.role, heroTag: particip.key),

            const SizedBox(height: 2*24.0),

            ListTile(
              leading: Icon(
                MdiIcons.plusCircleMultipleOutline,
                color: particip.profile.active?textEnab_(context): hintEnab_(context),
              ),
              title: Text(
                'Przyznaj punkty',
                style: AppTextStyle(
                  color: particip.profile.active?textEnab_(context): hintEnab_(context),
                )
              ),
              onTap: particip.profile.active? () async {
                if(!await isNetworkAvailable()){
                  showAppToast(context, text: 'Brak dostępu do Internetu');
                  return;
                }

                Navigator.pop(context);

                openAcceptTaskDialog(
                  context,
                  comp,
                  [particip],
                  onPointsGranted: onPointsGranted
                );

              }:null,
            ),
            ListTile(
              leading: Icon(
                MdiIcons.cubeOutline,
                color: textEnab_(context),
              ),
              title: Text(
                  'Zobacz zrealizowane zadania',
                  style: AppTextStyle(color: textEnab_(context))
              ),
              trailing:  Text(
                  '${particip.profile.completedTasks.length}',
                  style: AppTextStyle(color: textEnab_(context))
              ),
              onTap: (){
                Navigator.pop(context);
                pushPage(context, builder: (context) => CompletedTasksPage(
                    comp,
                    particip.profile.completedTasks,
                    comp.taskMap,
                    comp.participMap,
                    comp.colors,
                    pageTitle: particip.name,
                ));
              }
            ),

            const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

            ListTile(
              leading: const SizedBox(width: Dimen.ICON_SIZE),
              title: Text('Edytuj rolę uczestnika', style: AppTextStyle(color: hintEnab_(context)))
            ),

            if(particip.profile.role != CompRole.OBSERVER)
              ListTile(
                enabled: !particip.shadow,
                leading: Icon(compRoleToIcon[CompRole.OBSERVER]),
                title: Text('Nadaj rolę uczestnika', style: AppTextStyle()),
                onTap: particip.shadow?null: () async {
                  await showUpdateDialog(
                    CompRole.OBSERVER,
                    particip.profile.active,
                    onSuccess: (){
                      if(particip.key == AccountData.key)
                        Navigator.pop(context);
                    }
                  );

                  Navigator.pop(context);

                },
              ),

            if(particip.profile.role != CompRole.MODERATOR)
              ListTile(
                enabled: !particip.shadow,
                leading: Icon(compRoleToIcon[CompRole.MODERATOR]),
                title: Text('Nadaj rolę moderatora', style: AppTextStyle()),
                onTap: particip.shadow?null: () async {
                  await showUpdateDialog(
                      CompRole.MODERATOR,
                      particip.profile.active,
                      onSuccess: (){
                        if(particip.key == AccountData.key)
                          Navigator.pop(context);
                      }
                  );
                  Navigator.pop(context);
                },
              ),

            if(particip.profile.role != CompRole.ADMIN)
              ListTile(
                enabled: !particip.shadow,
                leading: Icon(compRoleToIcon[CompRole.ADMIN]),
                title: Text('Nadaj rolę administratora', style: AppTextStyle()),
                onTap: particip.shadow?null: () async {
                  await showUpdateDialog(CompRole.ADMIN, particip.profile.active);
                  Navigator.pop(context);
                },
              ),

            ListTile(
              enabled: !particip.shadow,
              leading: Icon(particip.profile.active?MdiIcons.coffeeOutline:MdiIcons.run),
              title: Text(particip.profile.active?'Unieaktywnij uczestnika':'Włącz uczestnika', style: AppTextStyle()),
              onTap: particip.shadow?null: () async {
                await showUpdateDialog(particip.profile.role, !particip.profile.active);
                Navigator.pop(context);
              },
            ),

            const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

            ListTile(
              leading: const Icon(MdiIcons.logoutVariant, color: Colors.red),
              title: Text('Wyproś uczestnika', style: AppTextStyle(color: Colors.red)),
              onTap: () => showRemoveDialog([particip], comp.particips)
            ),

          ],
        ),
      )
  );

  Future<void> showUpdateDialog(CompRole newRole, bool newActive, {void Function()? onSuccess}) async {
    bool close = false;

    if(particip.key == AccountData.key && newRole != CompRole.ADMIN)
      await showAlertDialog(
        context,
        title: 'Chwileczkę!',
        content: 'Czy na pewno chcesz zrzec się roli <b>administratora</b> współzawodnictwa <b>${comp.name}</b>?',
        actionBuilder: (context) => [
          AlertDialogButton(
            text: 'Tak',
            onTap: () => Navigator.pop(context)
          ),
          AlertDialogButton(
            text: 'Nie',
            onTap: (){
              close = true;
              Navigator.pop(context);
            },
          ),
        ],
      );

    if(close) return;

    showLoadingWidget(context, iconEnab_(context), 'Ostatnia prosta...');

    await ApiIndivComp.updateUsers(
        compKey: comp.key,
        users: [ParticipBody(particip.key, newRole, newActive)],
        onSuccess: (List<IndivCompParticip> allParticips){
          comp.setAllParticips(context, allParticips);
          Navigator.pop(context);
          onSuccess?.call();
        },
        onError: (){
          showAppToast(context, text: 'Coś tu poszło nie tak...');
          Navigator.pop(context);
        }
    );
  }

  Future<void> showRemoveDialog(List<IndivCompParticip> participsToRemove, List<IndivCompParticip?> allParticips) async {

    if(!await isNetworkAvailable()){
      showAppToast(context, text: 'Brak dostępu do Internetu');
      return;
    }

    int allAdminCount = 0;
    int remAdminCount = 0;
    for(IndivCompParticip? particip in allParticips) if(particip!.profile.role == CompRole.ADMIN) allAdminCount++;
    for(IndivCompParticip particip in participsToRemove) if(particip.profile.role == CompRole.ADMIN) remAdminCount++;

    if(allAdminCount == remAdminCount){
      await showAlertDialog(
          context,
          title: 'Hola, hola...',
          content: 'Zamierzasz usunąć ostatniego administratora?\n\nTak nie wolno.',
          actionBuilder: (context) => [
            AlertDialogButton(
                text: 'No dobrze',
                onTap: () => Navigator.pop(context)
            )
          ]
      );
      return;
    }

    bool plural;

    String participsString = '';
    if(participsToRemove.isEmpty)
      return;
    else if(participsToRemove.length == 1) {
      participsString = participsToRemove[0].name;
      plural = false;
    }else {
      participsString = '${participsToRemove.length} użytkowników';
      plural = true;
    }

    await showAlertDialog(
        context,
        title: 'Wypraszanie ${plural?'użytkowników':'użytkownika'}...',
        content: '$participsString nie będzie mieć dłużej dostępu do współzawodnictwa.\n\nNa pewno chcesz ${plural?'ich':'go'} wyprosić?',
        actionBuilder: (_context) => [

          AlertDialogButton(
              text: 'Nie',
              onTap: () => Navigator.pop(_context)
          ),

          AlertDialogButton(
              text: 'Tak',
              onTap: () async {
                Navigator.pop(context);
                Navigator.pop(context);

                showLoadingWidget(context, comp.colors.avgColor, 'Wypraszanie ${plural?'użytkowników':'użytkownika'}...');
                await ApiIndivComp.removeUsers(
                    compKey: comp.key,
                    userIds: participsToRemove.map((p) => p.key).toList(),
                    onSuccess: (List<String> removedParticips) async {
                      comp.removeParticipsByKey(context, removedParticips);

                      showAppToast(context, text: 'Wyproszono');
                      await popPage(context);
                    },
                    onError: () async {
                      showAppToast(context, text: 'Coś tu poszło nie tak...');
                      await popPage(context);
                    }
                );
              }
          )
        ]
    );

  }

  @override
  Widget build(BuildContext context) => ParticipTile(
    userKey: particip.key,
    name: particip.name,
    shadow: particip.shadow,
    active: particip.profile.active,
    role: particip.profile.role,
    anythingSelected: anythingSelected,
    selected: selected,
    selectedTextColor: comp.colors.avgColor,
    onLongPress: onSelectionTap,
    onTap: anythingSelected?onSelectionTap:(profile.role == CompRole.ADMIN || profile.role == CompRole.MODERATOR?openParticipantDetails:null),
    heroTag: heroTag,
    subtitle:
    particip.profile.active?
    PointsWidget(points: particip.profile.points, size: 24):
    Text('Obserwator', style: AppTextStyle(color: hintEnab_(context))),

    trailing:
    (profile.role == CompRole.ADMIN || profile.role == CompRole.MODERATOR) && particip.profile.active?
    AnimatedOpacity(
      opacity: anythingSelected?0:1,
      duration: const Duration(milliseconds: 300),
      child: IndivCompRankIcon(
        particip.profile,
        activeParticipCnt: comp.activeParticipCnt,
        showPercent: comp.rankDispType == RankDispType.RANGE_PERC,
        colors: comp.colors,
        size: 42.0,
        key: ValueKey(Tuple2(comp.rankDispType, comp.activeParticipCnt)),
      )
    ):null,
  );

}

class AcceptTaskWidget extends StatefulWidget{

  final IndivComp comp;
  final List<IndivCompParticip> selectedParticips;

  final void Function(List<IndivCompTaskCompl>, Map<String, ShowRankData>)? onSuccess;
  final void Function()? onError;

  const AcceptTaskWidget(this.comp, this.selectedParticips, {this.onSuccess, this.onError, super.key});

  @override
  State<StatefulWidget> createState() => AcceptTaskWidgetState();

}

class AcceptTaskWidgetState extends State<AcceptTaskWidget>{

  IndivComp get comp => widget.comp;
  List<IndivCompParticip> get selectedParticips => widget.selectedParticips;

  void Function(List<IndivCompTaskCompl>, Map<String, ShowRankData>)? get onSuccess => widget.onSuccess;

  TextEditingController? controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];
    for(int i=0; i<comp.tasks.length; i++) {
      IndivCompTask task = comp.tasks[i];
      children.add(
          IndivCompTaskWidget(
            task,
            bottom: Center(
              child: IconButton(
                icon: const Icon(MdiIcons.check),
                onPressed: () async {

                  showLoadingWidget(context, comp.colors.avgColor, 'Przesyłanie punktów...');

                  await ApiIndivComp.sendTaskComplReq(
                      allTasks: comp.tasks,
                      taskKey: task.key,
                      comment: controller!.text,
                      userKeys: selectedParticips.map((particips) => particips.key).toList(),
                      onSuccess: (List<IndivCompTaskCompl> taskComplList, Map<String, ShowRankData> idRank){
                        showAppToast(context, text: 'Zaliczono');
                        onSuccess?.call(taskComplList, idRank);
                      },
                      onError: (){
                        showAppToast(context, text: 'Coś poszło nie tak...');
                        widget.onError?.call();
                      }
                  );

                  Navigator.pop(context);

                }
              ),
            ),
          )
      );
      if(i<widget.comp.tasks.length-1)
        children.add(const SizedBox(height: Dimen.DEF_MARG));
    }

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          const SliverAppBar(
            title: Text('Zalicz zadanie'),
            centerTitle: true,
          ),

          SliverPadding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            sliver: SliverList(delegate: SliverChildListDelegate([

              if(selectedParticips.length==1)
                ParticipHeaderWidget(
                    selectedParticips[0].name,
                    selectedParticips[0].shadow,
                    selectedParticips[0].profile.role
                )
              else
                Consumer<IndivCompParticipsProvider>(
                    builder: (context, prov, child) => AccountThumbnailRowWidget(selectedParticips.map((particip) => particip.name).toList())
                ),

              Padding(
                padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                child: AppTextFieldHint(
                  hint: 'Wiadomość:',
                  hintStyle: AppTextStyle(color: hintEnab_(context)),
                  hintTop: 'Wiadomość',
                  controller: controller,
                  maxLines: null,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: children,
              )

            ])),
          )
        ],
      ),
    );
  }

}

void openAcceptTaskDialog(
    BuildContext context,
    IndivComp comp,
    List<IndivCompParticip> particips,
    {void Function(List<IndivCompTaskCompl> taskComplList, Map<String, ShowRankData> idRank)? onPointsGranted}
) async => await openDialog(
    context: context,
    builder: (context) => Center(
      child: Padding(
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        child: Material(
          clipBehavior: Clip.hardEdge,
          color: background_(context),
          borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
          child: AcceptTaskWidget(
            comp,
            particips,
            onSuccess: (
                List<IndivCompTaskCompl> taskComplList,
                Map<String, ShowRankData> idRank
            ){
              onPointsGranted?.call(taskComplList, idRank);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    )
);

