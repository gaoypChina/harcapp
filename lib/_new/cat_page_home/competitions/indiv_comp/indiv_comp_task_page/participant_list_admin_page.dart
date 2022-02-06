import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/particip_header_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/particip_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/comp_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_awards_page.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_task_page/participant_list_page_templ.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_task_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task_compl.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/indiv_comp_particips_provider.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/account/account_thumbnail_row_widget.dart';
import 'package:harcapp/account/search_user_dialog.dart';
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

import '../../loading_widget.dart';
import '../models/indiv_comp_profile.dart';

class ParticipantListAdminPage extends StatefulWidget{

  final IndivComp comp;

  const ParticipantListAdminPage(this.comp);

  @override
  State<StatefulWidget> createState() => ParticipantListAdminPageState();

}

class ParticipantListAdminPageState extends State<ParticipantListAdminPage>{

  IndivComp get comp => widget.comp;

  List<IndivCompParticip> selectedParticips;

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

  void onPointsGranted(List<IndivCompTaskCompl> taskComplList, Map<String, Tuple3<int, int, Tuple2<double, double>>> idRank){
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
  Widget build(BuildContext context) {

    return Stack(
      children: [

        ParticipantListPageTempl(
          comp: comp,

          adminsListHeaderTrailing: (participAdmins) => IconButton(
            icon: Icon(MdiIcons.selectAll),
            onPressed: (){
              for(IndivCompParticip particip in participAdmins)
                if(!selectedParticips.contains(particip)) selectedParticips.add(particip);
              setState(() {});
            },
          ),

          modsListHeaderTrailing: (participMods) => IconButton(
            icon: Icon(MdiIcons.selectAll),
            onPressed: (){
              for(IndivCompParticip particip in participMods)
                if(!selectedParticips.contains(particip)) selectedParticips.add(particip);
              setState(() {});
            },
          ),

          obsListHeaderTrailing: (participObs) => IconButton(
            icon: Icon(MdiIcons.selectAll),
            onPressed: (){
              for(IndivCompParticip particip in participObs)
                if(!selectedParticips.contains(particip)) selectedParticips.add(particip);
              setState(() {});
            },
          ),

          customAppBar:
          selectedParticips.isEmpty?
          SliverAppBar(
            title: Text('Lista uczestników'),
            centerTitle: true,
            floating: true,
            pinned: true,
            actions: [
              if(comp.profile.role == CompRole.ADMIN)
                IconButton(
                    icon: Icon(MdiIcons.plus),
                    onPressed: () async {

                      if(!await isNetworkAvailable()){
                        showAppToast(context, text: 'Brak dostępu do Internetu');
                        return;
                      }

                      UserDataNick userData = await openSearchUserDialog(
                          context,
                          title: 'Dodaj uczestnika',
                          illegalUserKeys: comp.particips.map((p) => p.key).toList(),
                          illegalAttemptMessage: 'Że niby chcesz dodać kogoś po raz drugi?'
                      );

                      if(userData == null) return;

                      await ApiIndivComp.addUsers(
                          id: comp.key,
                          users: [ParticipBodyNick(userData.key, CompRole.OBSERVER, true, userData.nick)],
                          onSuccess: (List<IndivCompParticip> allParticips){
                            comp.addParticips(context, allParticips);
                            Navigator.pop(context);
                            showAppToast(context, text: '${userData.name} ${userData.isMale?'dodany':'dodana'}.');
                          },
                          onError: () => showAppToast(context, text: 'Coś poszło nie tak...')
                      );

                    }
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

          itemBuilder: (context, particip) => ParticipViewWidget(
            comp,
            particip,

            anythingSelected: selectedParticips.isNotEmpty,
            selected: selectedParticips.contains(particip),

            onSelectionTap: (){
              if(!particip.profile.active && !selectedParticips.contains(particip))
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
            margin: EdgeInsets.only(
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
            left: Dimen.SIDE_MARG,
            right: Dimen.SIDE_MARG,
            bottom: kBottomNavigationBarHeight + Dimen.SIDE_MARG,
            child: Material(
                borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
                elevation: AppCard.bigElevation,
                color: cardEnab_(context),
                child: Padding(
                  padding: EdgeInsets.all(Dimen.SIDE_MARG),
                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(MdiIcons.accountMultiple, size: 48.0, color: backgroundIcon_(context)),
                          SizedBox(width: Dimen.DEF_MARG),
                          Icon(MdiIcons.accountPlus, size: 68.0, color: backgroundIcon_(context)),
                          SizedBox(width: Dimen.DEF_MARG+8),

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
            ),
          )

      ],
    );

  }

  SliverList getHeaderSliverList(String title, List<IndivCompParticip> particips, {void Function() onAllSelected}) => SliverList(delegate: SliverChildListDelegate([
    if(particips.isNotEmpty)
      Padding(
        padding: EdgeInsets.only(
          top: 14.0,
        ),
        child: TitleShortcutRowWidget(
            leading: SizedBox(width: 2*Dimen.LIST_TILE_LEADING_MARGIN_VAL + AccountThumbnailRowWidget.defSize),
            title: title,
            titleColor: hintEnab_(context),
            textAlign: TextAlign.start,
            trailing: IconButton(
              icon: Icon(MdiIcons.selectAll),
              onPressed: onAllSelected,
            ),
        ),
      )
  ]));


}

class SelectedAppBar extends SliverAppBar{

  final IndivComp comp;
  final List<IndivCompParticip> selectedParticips;

  final void Function() onSelectAll;
  final void Function() onUnselectAll;

  SelectedAppBar(this.comp, this.selectedParticips, {this.onSelectAll, this.onUnselectAll}):super(
    leadingWidth: Dimen.APPBAR_LEADING_WIDTH + Dimen.ICON_FOOTPRINT,
    leading: Row(
      children: [
        SizedBox(
          width: Dimen.APPBAR_LEADING_WIDTH,
          child: IconButton(
              icon: Icon(MdiIcons.close),
              onPressed: onUnselectAll
          ),
        ),

        IconButton(
            icon: Icon(MdiIcons.selectAll),
            onPressed: onSelectAll
        ),
      ],
    ),
    title:  Text('Zaznaczono: ${selectedParticips.length}'),
    centerTitle: true,
    floating: true,
    pinned: true,
    actions: [],
  );


}

class ParticipViewWidget<T extends IndivCompParticip> extends StatefulWidget{

  final IndivComp comp;
  final T particip;
  final bool anythingSelected;
  final bool selected;
  final void Function() onSelectionTap;
  final void Function(List<IndivCompTaskCompl> taskComplList, Map<String, Tuple3<int, int, Tuple2<double, double>>> idRank) onPointsGranted;
  final heroTag;

  const ParticipViewWidget(this.comp, this.particip, {@required this.anythingSelected, this.selected=false, this.onSelectionTap, this.onPointsGranted, this.heroTag});

  @override
  State<StatefulWidget> createState() => ParticipViewWidgetState<T>();

}

class ParticipViewWidgetState<T extends IndivCompParticip> extends State<ParticipViewWidget>{

  IndivComp get comp => widget.comp;
  IndivCompProfile get profile => comp.profile;

  T get particip => widget.particip;
  bool get anythingSelected => widget.anythingSelected;
  bool get selected => widget.selected;
  void Function() get onSelectionTap => widget.onSelectionTap;
  void Function(List<IndivCompTaskCompl> taskComplList, Map<String, Tuple3<int, int, Tuple2<double, double>>> idRank) get onPointsGranted => widget.onPointsGranted;

  get heroTag => widget.heroTag;

  double get actionExtentRation => (Dimen.ICON_FOOTPRINT + ParticipWidget.horizontalPadding)/MediaQuery.of(context).size.width;

  void openParticipantDetails() => showScrollBottomSheet(
      context: context,
      builder: (context) => BottomSheetDef(
        builder: (context) => Column(
          children: [

            ParticipHeaderWidget(particip.name, particip.profile.role, heroTag: particip.key),

            SizedBox(height: 2*24.0),

            ListTile(
              leading: Icon(MdiIcons.plusCircleMultipleOutline),
              title: Text('Przyznaj punkty', style: AppTextStyle()),
              onTap:  () async {
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

              },
            ),

            SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

            ListTile(
              leading: SizedBox(width: Dimen.ICON_SIZE),
              title: Text('Edytuj rolę uczestnika', style: AppTextStyle(color: hintEnab_(context)))
            ),

            if(particip.profile.role != CompRole.OBSERVER)
              ListTile(
                leading: Icon(compRoleToIcon[CompRole.OBSERVER]),
                title: Text('Nadaj rolę uczestnika', style: AppTextStyle()),
                onTap:  () async {
                  await showUpdateDialog(
                    CompRole.OBSERVER,
                    particip.profile.active,
                    onSuccess: (){
                      if(particip.key == AccSecData.key)
                        Navigator.pop(context);
                    }
                  );

                  Navigator.pop(context);

                },
              ),

            if(particip.profile.role != CompRole.MODERATOR)
              ListTile(
                leading: Icon(compRoleToIcon[CompRole.MODERATOR]),
                title: Text('Nadaj rolę moderatora', style: AppTextStyle()),
                onTap:  () async {
                  await showUpdateDialog(
                      CompRole.MODERATOR,
                      particip.profile.active,
                      onSuccess: (){
                        if(particip.key == AccSecData.key)
                          Navigator.pop(context);
                      }
                  );
                  Navigator.pop(context);
                },
              ),

            if(particip.profile.role != CompRole.ADMIN)
              ListTile(
                leading: Icon(compRoleToIcon[CompRole.ADMIN]),
                title: Text('Nadaj rolę administratora', style: AppTextStyle()),
                onTap:  () async {
                  await showUpdateDialog(CompRole.ADMIN, particip.profile.active);
                  Navigator.pop(context);
                },
              ),

            ListTile(
              leading: Icon(particip.profile.active?MdiIcons.coffeeOutline:MdiIcons.run),
              title: Text(particip.profile.active?'Unieaktywnij uczestnika':'Włącz uczestnika', style: AppTextStyle()),
              onTap:  () async {
                await showUpdateDialog(particip.profile.role, !particip.profile.active);
                Navigator.pop(context);
              },
            ),

            SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

            ListTile(
              leading: Icon(MdiIcons.logoutVariant, color: Colors.red),
              title: Text('Wyproś uczestnika', style: AppTextStyle(color: Colors.red)),
              onTap: () => showRemoveDialog([particip], comp.particips)
            ),

          ],
        ),
      )
  );

  Future<void> showUpdateDialog(CompRole newRole, bool newActive, {void Function() onSuccess}) async {
    bool close = false;

    if(particip.key == AccSecData.key && newRole != CompRole.ADMIN)
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
        compId: comp.key,
        users: [ParticipBody(particip.key, newRole, newActive)],
        onSuccess: (List<IndivCompParticip> allParticips){
          comp.updateParticips(context, allParticips);
          Navigator.pop(context);
          onSuccess?.call();
        },
        onError: (){
          showAppToast(context, text: 'Coś tu poszło nie tak...');
          Navigator.pop(context);
        }
    );
  }

  Future<void> showRemoveDialog(List<IndivCompParticip> participsToRemove, List<IndivCompParticip> allParticips) async {

    if(!await isNetworkAvailable()){
      showAppToast(context, text: 'Brak dostępu do Internetu');
      return;
    }

    int allAdminCount = 0;
    int remAdminCount = 0;
    for(IndivCompParticip particip in allParticips) if(particip.profile.role == CompRole.ADMIN) allAdminCount++;
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

    // REMOVE

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
                Navigator.pop(_context);

                showLoadingWidget(_context, comp.colors.avgColor, 'Wypraszanie ${plural?'użytkowników':'użytkownika'}...');
                await ApiIndivComp.removeUsers(
                    compId: comp.key,
                    userIds: participsToRemove.map((p) => p.key).toList(),
                    onSuccess: (List<String> removedParticips){
                      comp.removeParticipByKey(context, removedParticips);

                      showAppToast(_context, text: 'Wyproszono');
                      Navigator.pop(_context);
                    },
                    onError: (){
                      showAppToast(_context, text: 'Coś tu poszło nie tak...');
                      Navigator.pop(_context);
                    }
                );
              }
          )
        ]
    );

  }

  @override
  Widget build(BuildContext context) => ParticipWidget(
    userKey: particip.key,
    name: particip.name,
    active: particip.profile.active,
    role: particip.profile.role,
    anythingSelected: anythingSelected,
    selected: selected,
    selectedTextColor: comp.colors.avgColor,
    onLongPress: onSelectionTap,
    onTap: anythingSelected?onSelectionTap:(profile.role == CompRole.ADMIN || profile.role == CompRole.MODERATOR?openParticipantDetails:null),
    heroTag: heroTag,
    trailing:
    profile.role == CompRole.ADMIN || profile.role == CompRole.MODERATOR?
    AnimatedOpacity(
      opacity: anythingSelected?0:1,
      duration: Duration(milliseconds: 300),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          Text(
            '${particip.profile.points} ',
            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.halfBold),
          ),

          SizedBox(width: Dimen.ICON_MARG),

          rankToAwardWidget(particip.profile.showRank)

        ],
      ),
    ):null,
  );

}

class AcceptTaskWidget extends StatefulWidget{

  final IndivComp comp;
  final List<IndivCompParticip> selectedParticips;

  final void Function(List<IndivCompTaskCompl>, Map<String, Tuple3<int, int, Tuple2<double, double>>>) onSuccess;
  final void Function() onError;

  const AcceptTaskWidget(this.comp, this.selectedParticips, {this.onSuccess, this.onError});

  @override
  State<StatefulWidget> createState() => AcceptTaskWidgetState();

}

class AcceptTaskWidgetState extends State<AcceptTaskWidget>{

  IndivComp get comp => widget.comp;
  List<IndivCompParticip> get selectedParticips => widget.selectedParticips;

  void Function(List<IndivCompTaskCompl>, Map<String, Tuple3<int, int, Tuple2<double, double>>>) get onSuccess => widget.onSuccess;

  TextEditingController controller;

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
                icon: Icon(MdiIcons.check),
                onPressed: () async {

                  showLoadingWidget(context, comp.colors.avgColor, 'Przesyłanie punktów...');

                  await ApiIndivComp.sendTaskComplReq(
                      allTasks: comp.tasks,
                      taskKey: task.key,
                      comment: controller.text,
                      userKeys: selectedParticips.map((particips) => particips.key).toList(),
                      onSuccess: (List<IndivCompTaskCompl> taskComplList, Map<String, Tuple3<int, int, Tuple2<double, double>>> idRank){
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
        children.add(SizedBox(height: Dimen.DEF_MARG));
    }

    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          title: Text('Zalicz zadanie'),
          centerTitle: true,
        ),

        SliverPadding(
          padding: EdgeInsets.all(Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildListDelegate([

            if(selectedParticips.length==1)
              ParticipHeaderWidget(selectedParticips[0].name, selectedParticips[0].profile.role)
            else
              Consumer<IndivCompParticipsProvider>(
                  builder: (context, prov, child) => AccountThumbnailRowWidget(selectedParticips.map((particip) => particip.name).toList())
              ),

            Padding(
              padding: EdgeInsets.all(Dimen.SIDE_MARG),
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
    );
  }

}

void openAcceptTaskDialog(
    BuildContext context,
    IndivComp comp,
    List<IndivCompParticip> particips,
    {void Function(List<IndivCompTaskCompl> taskComplList, Map<String, Tuple3<int, int, Tuple2<double, double>>> idRank) onPointsGranted}
) async => await openDialog(
    context: context,
    builder: (context) => Center(
      child: Padding(
        padding: EdgeInsets.all(Dimen.SIDE_MARG),
        child: Material(
          clipBehavior: Clip.hardEdge,
          color: background_(context),
          borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
          child: AcceptTaskWidget(
            comp,
            particips,
            onSuccess: (List<IndivCompTaskCompl> taskComplList, Map<String, Tuple3<int, int, Tuple2<double, double>>> idRank){
              onPointsGranted?.call(taskComplList, idRank);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    )
);