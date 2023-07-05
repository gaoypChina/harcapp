import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/carefully_leave_group_with_admins.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/border_material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_common_widgets/paging_loadable_page/paging_loadable_base_scroll_view_page.dart';
import 'package:harcapp/_new/api/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_editor_page/providers.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_icon.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_users_page/trop_user_tile.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_users_page/trop_users_page.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp/account/search_user_dialog.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp/values/app_values.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:optional/optional_internal.dart';
import 'package:provider/provider.dart';

import '../model/trop.dart';
import '../model/trop_role.dart';
import '../model/trop_user.dart';

class TropEditorPage extends StatefulWidget{

  final Trop? initTrop;
  final TropExampleData? initTropBaseData;
  final List<TropCategory> allCategories;
  final void Function(Trop)? onSaved;
  final void Function()? onForceLoggedOut;
  final void Function()? onDeleted;
  final void Function()? onError;

  const TropEditorPage({
    this.initTrop,
    this.initTropBaseData,
    required this.allCategories,
    this.onSaved,
    this.onForceLoggedOut,
    this.onDeleted,
    this.onError,
    super.key
  }):
    assert(!(initTrop != null && initTropBaseData != null));

  @override
  State<StatefulWidget> createState() => TropEditorPageState();

}

class TropEditorPageState extends State<TropEditorPage>{

  Trop? get initTrop => widget.initTrop;
  TropExampleData? get initTropBaseData => widget.initTropBaseData;
  List<TropCategory> get allCategories => widget.allCategories;
  void Function(Trop)? get onSaved => widget.onSaved;
  void Function()? get onForceLoggedOut => widget.onForceLoggedOut;
  void Function()? get onDeleted => widget.onDeleted;
  void Function()? get onError => widget.onDeleted;

  bool get editMode => initTrop != null; // If initTropBaseData is passed, it means the trop was not used before.

  bool get showDeleteButton{
    if(!editMode) return false;
    return !initTrop!.isShared || initTrop!.myRole == TropRole.OWNER;
  }

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => NameControllerProvider(initTrop: initTrop, initTropBaseData: initTropBaseData)),
      ChangeNotifierProvider(create: (context) => TropCategoryProvider(initTrop: initTrop, initTropBaseData: initTropBaseData)),
      ChangeNotifierProvider(create: (context) => StartTimeProvider(initTrop: initTrop)),
      ChangeNotifierProvider(create: (context) => EndTimeProvider(initTrop: initTrop)),
      ChangeNotifierProvider(create: (context) => AimControllersProvider(initTrop: initTrop, initTropBaseData: initTropBaseData)),
      ChangeNotifierProvider(create: (context) => TasksProvider(initTrop: initTrop, initTropBaseData: initTropBaseData)),
    ],
    builder: (context, child) => BottomNavScaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            title: Text(editMode?'Edytuj trop':'Nowy trop'),
            centerTitle: true,
            floating: true,
            actions: [
              IconButton(
                icon: Icon(MdiIcons.check),
                onPressed: () async {

                  String name = NameControllerProvider.of(context).nameController.text;
                  if(name.isEmpty){
                    showAppToast(context, text: 'Podaj nazwę tropu');
                    return;
                  }

                  TropCategory category = TropCategoryProvider.of(context).category;
                  List<String> aims = AimControllersProvider.of(context).getAims();
                  DateTime startTime = StartTimeProvider.of(context).startTime;
                  DateTime endTime = EndTimeProvider.of(context).endTime;
                  List<TropTaskEditableData> tasks = [];

                  if(startTime.isAfter(endTime)){
                    showAppToast(context, text: 'Trop zaczyna się później niż kończy? Czas działa w drugą stronę...');
                    return;
                  } else if(endTime.difference(startTime) < const Duration(days: 3)){
                    showAppToast(context, text: 'Trop krótszy niż 3 dni? To nie przejdzie');
                    return;
                  }

                  bool isAnyTaskShared = false;

                  for(TropTaskEditableData task in TasksProvider.of(context).tasks) {

                    if(task.isEmpty) continue;

                    if(task.newAssigneeByNick != null || task.newAssigneeByKey != null) isAnyTaskShared = true;
                    tasks.add(task);
                  }

                  if(tasks.isEmpty){
                    showAppToast(context, text: 'Czy to jest trop bez żadnego zadania? Litości...');
                    return;
                  } else if(tasks.length > Trop.maxTaskCount){
                    showAppToast(context, text: 'Chyba trochę za dużo tych zadań, co? Ogranicz się do ${Trop.maxTaskCount}');
                    return;
                  }

                  showLoadingWidget(
                      context,
                      initTrop == null? 'Tworzenie tropu...': 'Poprawianie...',
                      color: accent_(context),
                  );

                  tasks.sort((t1, t2) => t1.deadline.millisecondsSinceEpoch - t2.deadline.millisecondsSinceEpoch);

                  String? customIconTropName = initTropBaseData?.customIconTropName;

                  TropProvider tropProvider = TropProvider.of(context);
                  TropListProvider tropListProvider = TropListProvider.of(context);

                  if(editMode) {

                    if(initTrop!.isShared || isAnyTaskShared){
                      ApiTrop.update(
                          trop: initTrop!,

                          name:
                          initTrop!.name == name?
                          null:
                          name,

                          customIconTropName:
                          initTrop!.customIconTropName == customIconTropName?
                          const Optional.empty():
                          Optional.ofNullable(customIconTropName),

                          category:
                          initTrop!.category == category?
                          null:
                          category,

                          aims:
                          initTrop!.aims == aims?
                          null:
                          aims,

                          startDate:
                          initTrop!.startDate == startTime?
                          null:
                          startTime,

                          endDate:
                          initTrop!.endDate == endTime?
                          null:
                          endTime,

                          completed: null,
                          completionDate: null,

                          tasks: tasks,

                          onSuccess: (trop) async {
                            if(!initTrop!.isShared)
                              trop.changedToShared(trop.lastUpdateTime!);
                            initTrop!.update(trop);
                            TropSharedPreviewData? prevData = TropSharedPreviewData.allMapByKey![trop.key];
                            if(prevData != null)
                              prevData.lastUpdateTime = trop.lastUpdateTime!;
                            await popPage(context); // Close loading widget.
                            await popPage(context);
                            onSaved?.call(trop);
                            Trop.callProviders(tropProvider, tropListProvider);
                          },
                          onForceLoggedOut: () async {
                            if(!mounted) return true;
                            showAppToast(context, text: forceLoggedOutMessage);
                            await popPage(context); // Close loading widget.
                            onForceLoggedOut?.call();
                            return true;
                          },
                          onServerMaybeWakingUp: () async {
                            if(mounted) showServerWakingUpToast(context);
                            await popPage(context); // Close loading widget.
                            return true;
                          },
                          onError: (_) async {
                            await popPage(context); // Close loading widget.
                            if(mounted) showAppToast(context, text: simpleErrorMessage);
                            onError?.call();
                          }
                      );
                    } else {
                      initTrop!.name = name;
                      initTrop!.category = category;
                      initTrop!.aims = aims;
                      initTrop!.startDate = startTime;
                      initTrop!.endDate = endTime;
                      initTrop!.tasks = tasks.map((t) => t.toTaskData(setLclIdIfNull: true).toTask(initTrop!)).toList();
                      initTrop!.saveOwn();
                      synchronizer.post();

                      await popPage(context); // Close loading widget.
                      await popPage(context);
                      onSaved?.call(initTrop!);
                      Trop.callProviders(tropProvider, tropListProvider);
                    }

                  } else {

                    if(isAnyTaskShared){
                      ApiTrop.create(
                          name: name,
                          customIconTropName: customIconTropName,
                          category: category,
                          aims: aims,
                          startDate: startTime,
                          endDate: endTime,
                          completed: false,
                          completionDate: null,
                          tasks: tasks,

                          onSuccess: (trop) async {
                            trop.saveShared();
                            Trop.addSharedToAll(trop);
                            TropSharedPreviewData.addToAll(trop.toPreviewData());
                            await popPage(context); // Close loading widget.
                            await popPage(context);
                            onSaved?.call(trop);
                            Trop.callProviders(tropProvider, tropListProvider);
                          },
                          onForceLoggedOut: () async {
                            if(!mounted) return true;
                            showAppToast(context, text: forceLoggedOutMessage);
                            await popPage(context); // Close loading widget.
                            onForceLoggedOut?.call();
                            return true;
                          },
                          onServerMaybeWakingUp: () async {
                            if(mounted) showServerWakingUpToast(context);
                            await popPage(context); // Close loading widget.
                            return true;
                          },
                          onError: (_) async {
                            await popPage(context); // Close loading widget.
                            if(mounted) showAppToast(context, text: simpleErrorMessage);
                            onError?.call();
                          }
                      );
                    } else {
                      Trop trop = Trop.createOwn(
                          name: name,
                          customIconTropName: initTropBaseData?.customIconTropName,
                          category: category,
                          aims: aims,
                          startDate: startTime,
                          endDate: endTime,
                          completed: false,
                          completionTime: null,
                          tasks: tasks.map((t) => t.toTaskData(setLclIdIfNull: true)).toList(),
                          lastUpdateTime: null
                      );
                      trop.saveOwn();
                      Trop.addOwnToAll(trop);
                      synchronizer.post();
                      await popPage(context); // Close loading widget.
                      await popPage(context);
                      onSaved?.call(trop);
                      Trop.callProviders(tropProvider, tropListProvider);
                    }

                  }

                },
              )
            ],
          ),

          SliverPadding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              sliver: SliverList(delegate: SliverChildListDelegate([

                const TitleShortcutRowWidget(
                  title: 'Informacje ogólne',
                  textAlign: TextAlign.left,
                ),

                Consumer<NameControllerProvider>(
                    builder: (context, prov, child) => AppTextFieldHint(
                      hint: 'Nazwa tropu:',
                      hintTop: 'Nazwa tropu',
                      textCapitalization: TextCapitalization.sentences,
                      controller: prov.nameController,
                      maxLength: Trop.maxLenName,
                    ),
                ),

                const SizedBox(height: Dimen.SIDE_MARG),

                SimpleButton(
                  clipBehavior: Clip.none,
                  radius: AppCard.bigRadius,
                  child: Row(
                    children: [

                      Text('Kategoria:', style: AppTextStyle(
                          fontSize: Dimen.TEXT_SIZE_BIG
                      )),

                      Expanded(
                          child: Consumer<TropCategoryProvider>(
                            builder: (context, prov, child) => Row(
                              children: [
                                const SizedBox(width: Dimen.defMarg),
                                Text(tropCategoryToName(prov.category), style: AppTextStyle(
                                    fontSize: Dimen.TEXT_SIZE_BIG,
                                    fontWeight: weight.halfBold
                                )),
                                Expanded(child: Container()),
                                Padding(
                                  padding: const EdgeInsets.all(Dimen.defMarg),
                                  child: TropIcon(
                                      prov.category,
                                      size: 60,
                                      zuchTropName: initTropBaseData?.customIconTropName??
                                          initTrop?.customIconTropName
                                  ),
                                ),
                                const SizedBox(width: Dimen.defMarg),
                              ],
                            ),
                          )),

                      // Expanded(child: DropdownButtonHideUnderline(
                      //     child: Consumer<TropCategoryProvider>(
                      //       builder: (context, prov, child) => DropdownButton2<TropCategory>(
                      //         isExpanded: true,
                      //         hint: Text(
                      //           'Kategoria tropu',
                      //           style: AppTextStyle(color: hintEnab_(context))
                      //         ),
                      //         items: allCategories.map((cat) => DropdownMenuItem(
                      //           value: cat,
                      //           child: Row(
                      //             children: [
                      //               const SizedBox(width: Dimen.defMarg),
                      //               Text(tropCategoryToName(cat), style: AppTextStyle(
                      //                 fontSize: Dimen.TEXT_SIZE_BIG,
                      //                 fontWeight: weight.halfBold
                      //               )),
                      //               Expanded(child: Container()),
                      //               Padding(
                      //                 padding: const EdgeInsets.all(Dimen.defMarg),
                      //                 child: TropIcon(
                      //                   cat,
                      //                   size: 60,
                      //                   zuchTropName: initTropBaseData?.customIconTropName??
                      //                       initTrop?.customIconTropName
                      //                 ),
                      //               ),
                      //               const SizedBox(width: Dimen.defMarg),
                      //             ],
                      //           )
                      //         )).toList(),
                      //         itemPadding: EdgeInsets.zero,
                      //         itemHeight: TropIcon.defSize,
                      //
                      //         value: prov.category,
                      //         onChanged: (value) => prov.category = value as TropCategory,
                      //         iconSize: 0,
                      //         buttonDecoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(AppCard.defRadius),
                      //         ),
                      //         dropdownDecoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(AppCard.bigRadius),
                      //         ),
                      //         dropdownPadding: EdgeInsets.zero,
                      //       ),
                      //     )
                      // ))
                    ],
                  ),
                  onTap: () => openCategoryBottomSheet(
                    context,

                    selected: TropCategoryProvider.of(context).category,

                    allTropCategories:
                    allHarcTropCategories.contains(TropCategoryProvider.of(context).category)?
                    allHarcTropCategories:
                    allZuchTropCategories,

                    zuchTropName: initTrop?.customIconTropName??initTropBaseData?.customIconTropName,
                    onSelected: (category) => TropCategoryProvider.of(context).category = category
                  )
                ),

                const SizedBox(height: Dimen.SIDE_MARG),

                const TitleShortcutRowWidget(
                  title: 'Czas trwania',
                  textAlign: TextAlign.left,
                ),

                Row(
                  children: [

                    Expanded(child: Consumer<StartTimeProvider>(
                      builder: (context, prov, child) => SimpleButton.from(
                        color: cardEnab_(context),
                        context: context,
                        icon: MdiIcons.calendarStartOutline,
                        margin: EdgeInsets.zero,
                        text: dateToString(prov.startTime, shortMonth: true, showYear: null),
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                              context: context,
                              initialDate: prov.startTime,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(const Duration(days: 10*365))
                          );
                          if(date == null) return;
                          else prov.startTime = date;
                        }
                      )
                    )),

                    const SizedBox(width: Dimen.SIDE_MARG),

                    Expanded(child:  Consumer<EndTimeProvider>(
                      builder: (context, prov, child) => SimpleButton.from(
                        color: cardEnab_(context),
                        context: context,
                        icon: MdiIcons.calendarEndOutline,
                        margin: EdgeInsets.zero,
                        text: dateToString(prov.endTime, shortMonth: true, showYear: null),
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                              context: context,
                              initialDate: prov.endTime,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(const Duration(days: 10*365))
                          );
                          if(date == null) return;
                          else prov.endTime = date;
                        }
                      )
                    ))

                  ],
                ),
                
                const SizedBox(height: Dimen.SIDE_MARG),

                const TitleShortcutRowWidget(
                  title: 'Cele',
                  textAlign: TextAlign.left,
                ),

                Consumer<AimControllersProvider>(
                  builder: (context, prov, child) => ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(
                      height: Dimen.defMarg,
                    ),
                    itemBuilder: (BuildContext context, int index) => Material(
                      color: cardEnab_(context),
                      borderRadius: BorderRadius.circular(AppCard.bigRadius),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          BorderMaterial(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: Dimen.defMarg,
                                left: Dimen.ICON_MARG,
                                bottom: Dimen.defMarg,
                                right: Dimen.defMarg,
                              ),
                              child: AppTextFieldHint(
                                hint: 'Cel ${index+1}:',
                                hintTop: 'Cel ${index+1}',
                                textCapitalization: TextCapitalization.sentences,
                                controller: prov.aimControllers[index],
                                maxLength: Trop.maxLenAim,
                                maxLines: null,
                              ),
                            ),
                          ),

                          SimpleButton.from(
                              icon: MdiIcons.trashCanOutline,
                              textColor: Colors.red,
                              margin: EdgeInsets.zero,
                              iconLeading: false,
                              onTap: (){

                                String text = prov.aimControllers[index].text;
                                prov.removeAt(index);

                                showAppToast(
                                    context,
                                    text: 'Usunięto',
                                    buttonText: 'Cofnij',
                                    onButtonPressed: () => prov.insert(index, text)
                                );
                              }
                          ),

                        ],
                      )
                    ),
                    itemCount: prov.aimControllers.length,
                    shrinkWrap: true,
                  )
                ),

                const SizedBox(height: Dimen.defMarg),

                Consumer<AimControllersProvider>(
                  builder: (context, prov, child) => SimpleButton.from(
                      color: cardEnab_(context),
                      context: context,
                      icon: MdiIcons.plus,
                      text: 'Dodaj cel',
                      margin: EdgeInsets.zero,
                      onTap: () => prov.add()
                  ),
                ),

                const SizedBox(height: Dimen.SIDE_MARG),

                const TitleShortcutRowWidget(
                  title: 'Zadania',
                  textAlign: TextAlign.left,
                ),

                Consumer<TasksProvider>(
                    builder: (context, prov, child) => ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(
                        height: Dimen.defMarg,
                      ),
                      itemBuilder: (BuildContext context, int index) => Material(
                          color: cardEnab_(context),
                          borderRadius: BorderRadius.circular(AppCard.bigRadius),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [

                              BorderMaterial(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: Dimen.defMarg,
                                    left: Dimen.ICON_MARG,
                                    bottom: Dimen.defMarg,
                                    right: Dimen.defMarg,
                                  ),
                                  child: AppTextFieldHint(
                                    hint: 'Zadanie ${index+1}:',
                                    hintTop: 'Zadanie ${index+1}',
                                    textCapitalization: TextCapitalization.sentences,
                                    controller: prov.tasks[index].contentController,
                                    maxLength: TropTask.maxLenContent,
                                    maxLines: null,
                                  ),
                                ),
                              ),

                              Row(
                                children: [

                                  Expanded(child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: AssigneeButton(
                                      initTrop,
                                      prov.tasks[index],
                                      onAssigneeSelected: (_) => setState(() {}),
                                    ),
                                  )),

                                  SimpleButton.from(
                                    
                                    textColor: iconEnab_(context),

                                    text: 'Do ${dateToString(
                                        prov.tasks[index].deadline,
                                        shortMonth: true,
                                        showYear: null
                                    )}',

                                    icon: null,

                                    iconLeading: false,
                                    margin: EdgeInsets.zero,
                                    onTap: () async {

                                      DateTime? date = await showDatePicker(
                                        context: context,
                                        initialDate: prov.tasks[index].deadline,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.now().add(const Duration(days: 10*365))
                                      );
                                      if(date == null) return;
                                      else prov.update(index, deadline: date);
                                    }
                                  )

                                ],
                              ),

                              if(prov.tasks.length > 1)
                                SimpleButton.from(
                                    icon: MdiIcons.trashCanOutline,
                                    textColor: Colors.red,
                                    margin: EdgeInsets.zero,
                                    iconLeading: false,
                                    onTap: (){

                                      TropTaskEditableData value = prov.tasks[index];
                                      prov.removeAt(index);

                                      showAppToast(
                                          context,
                                          text: 'Usunięto',
                                          buttonText: 'Cofnij',
                                          onButtonPressed: () => prov.insert(index, value)
                                      );
                                    }
                                ),

                            ],
                          )
                      ),
                      itemCount: prov.tasks.length,
                      shrinkWrap: true,
                    )
                ),

                const SizedBox(height: Dimen.defMarg),

                Consumer<TasksProvider>(
                  builder: (context, prov, child) => SimpleButton.from(
                      color: cardEnab_(context),
                      context: context,
                      icon: MdiIcons.plus,
                      text: 'Dodaj zadanie',
                      margin: EdgeInsets.zero,
                      onTap: (){
                        if(prov.tasks.length >= Trop.maxTaskCount)
                          showAppToast(
                            context,
                            text: 'Maksymalna liczba zadań to ${Trop.maxTaskCount}'
                          );
                        else
                          prov.add();
                      }
                  ),
                ),

                if(showDeleteButton)
                  const SizedBox(height: Dimen.SIDE_MARG),

                if(showDeleteButton)
                  Icon(MdiIcons.circleMedium, color: hintEnab_(context)),

                if(showDeleteButton)
                  const SizedBox(height: Dimen.SIDE_MARG),

                if(showDeleteButton)
                  const TitleShortcutRowWidget(
                    title: 'Ostrożnie!',
                    titleColor: Colors.red,
                    textAlign: TextAlign.left,
                  ),

                if(showDeleteButton && !initTrop!.isShared)
                  RemoveOwnTropButton(initTrop!)
                else if(showDeleteButton && initTrop!.isShared)
                  RemoveSharedTropButton(initTrop!),

                if(showDeleteButton && initTrop!.isShared)
                  const SizedBox(height: Dimen.SIDE_MARG),

                if(showDeleteButton && initTrop!.isShared)
                  LeaveSharedTropButton(initTrop!),
              ]))
          )

        ],
      ),
    )
  );

}

class AssigneeButton extends StatelessWidget{

  final Trop? trop;
  final TropTaskEditableData task;
  final void Function(TropUser?)? onAssigneeSelected;

  const AssigneeButton(this.trop, this.task, {this.onAssigneeSelected, super.key});

  String? get assigneeName{
    if(task.assignee != null)
      return task.assignee!.name;

    if(task.assigneeController.text.isNotEmpty)
      return task.assigneeController.text;

    return null;
  }

  @override
  Widget build(BuildContext context) => SimpleButton.from(
    context: context,
    text: assigneeName??'Kto ogarnie',
    icon: assigneeName==null?MdiIcons.pencilOutline:MdiIcons.accountCircleOutline,
    textColor: task.assignee==null&&task.assigneeController.text.isEmpty?
    iconDisab_(context):
    iconEnab_(context),
    margin: EdgeInsets.zero,
    onTap: () => openAssigneeTypeChooserBottomSheet(context)
  );

  Future<void> openAssigneeTypeChooserBottomSheet(BuildContext context) async => showScrollBottomSheet(
      context: context,
      builder: (_) => BottomSheetDef(
          builder: (_) => Column(
            children: [

              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppCard.bigRadius),
                ),
                leading: Icon(MdiIcons.formTextbox),
                title: Text('Wpisz ręcznie', style: AppTextStyle()),
                onTap: () async {

                  TasksProvider tasksProvider = TasksProvider.of(context);
                  Navigator.pop(context);

                  String? newText = await openAssigneeCustomTextField(
                    context,
                    initText: task.assigneeController.text,
                  );

                  if(newText != null) {
                    task.currentAssignee = null;
                    task.newAssigneeByNick = null;
                    task.newAssigneeByKey = null;
                    task.removed = true;
                    task.assigneeController.text = newText;
                    tasksProvider.notify();
                  }
                },
              ),

              if(account)
                const SizedBox(height: Dimen.ICON_MARG),

              if(account)
                ListTile(
                  leading: const SizedBox(width: 0),
                  title: Text('Wybierz kogoś z kontem HarcApp', style: AppTextStyle(color: hintEnab_(context))),
                ),

              if(account && trop != null)
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppCard.bigRadius),
                  ),
                  leading: Icon(MdiIcons.accountReactivateOutline),
                  title: Text('Ktoś z ludzi tropu', style: AppTextStyle()),
                  onTap: () async {

                    if(!AccountData.loggedIn){
                      AccountPage.open(context);
                      return;
                    }

                    if(!await isNetworkAvailable()){
                      showAppToast(context, text: 'Brak dostępu do Internetu');
                      return;
                    }

                    Navigator.pop(context); // Hide bottom sheet.

                    TropUser? tropUser;

                    await openDialog(
                        context: context,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(Dimen.defMarg),
                          child: Material(
                            clipBehavior: Clip.hardEdge,
                            color: background_(context),
                            borderRadius: BorderRadius.circular(AppCard.bigRadius),
                            child: LoadableUserSelector(
                                trop!,
                                onUserSelected: (user){
                                  tropUser = user;
                                  Navigator.pop(context);
                                }
                            ),
                          ),
                        )
                    );

                    if(tropUser == null)
                      return;

                    if(tropUser!.key != task.currentAssignee?.key) {
                      task.newAssigneeByNick = null;
                      task.newAssigneeByKey = tropUser;
                      task.removed = false;
                    }
                    onAssigneeSelected?.call(task.newAssigneeByKey!);

                  },
                ),

              if(account)
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppCard.bigRadius),
                  ),
                  leading: Icon(MdiIcons.accountCircleOutline),
                  title: Text('Ktoś spoza tropu', style: AppTextStyle()),
                  onTap: () async {

                    if(!AccountData.loggedIn){
                      AccountPage.open(context);
                      return;
                    }

                    if(!await isNetworkAvailable()){
                      showAppToast(context, text: 'Brak dostępu do Internetu');
                      return;
                    }

                    Navigator.pop(context); // Hide bottom sheet.

                    UserDataNick? userData = await openSearchUserDialog(
                        context,
                        title: 'Dodaj ogarniacza zadania',
                        illegalAttemptMessage: 'Że niby chcesz dodać kogoś po raz drugi?'
                    );

                    if(userData == null)
                      return;

                    if(userData.key != task.currentAssignee?.key) {
                      task.newAssigneeByNick = TropUserNick.fromUserDataNick(userData, role: TropRole.REGULAR);
                      task.newAssigneeByKey = null;
                      task.removed = false;
                    }
                    onAssigneeSelected?.call(task.newAssigneeByNick!);

                  },
                ),

              if(account && task.currentAssignee != null)
                const SizedBox(height: Dimen.ICON_MARG),

              if(account && task.currentAssignee != null)
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppCard.bigRadius),
                  ),
                  leading: Icon(MdiIcons.close, color: Colors.red),
                  title: Text('Odsuń od zadania', style: AppTextStyle(color: Colors.red)),
                  onTap: () async {

                    if(!AccountData.loggedIn){
                      AccountPage.open(context);
                      return;
                    }

                    if(!await isNetworkAvailable()){
                      showAppToast(context, text: 'Brak dostępu do Internetu');
                      return;
                    }

                    task.newAssigneeByNick = null;
                    task.newAssigneeByKey = null;
                    task.removed = true;
                    task.assigneeController.clear();
                    onAssigneeSelected?.call(null);
                    Navigator.pop(context);
                  },
                ),

            ],
          )
      )
  );

}

Future<String?> openAssigneeCustomTextField(
    BuildContext context,
    { String? initText,
      void Function(String)? onChanged
    }) async {

  bool saved = false;

  TextEditingController controller = TextEditingController(text: initText??'');

  await openDialog(
      context: context,
      builder: (context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG).add(
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)
          ),
          child: Material(
              borderRadius: BorderRadius.circular(AppCard.bigRadius),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(Dimen.defMarg),
                    child: AppTextFieldHint(
                      hint: 'Wpisz ogarniacza:',
                      hintTop: 'Ogarniacz',
                      controller: controller,
                      textCapitalization: TextCapitalization.words,
                      onChanged: (_, text) => onChanged?.call(text),
                      autofocus: true,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(child: SimpleButton.from(
                          context: context,
                          text: 'Jednak nie',
                          radius: 0,
                          margin: EdgeInsets.zero,
                          onTap: (){
                            Navigator.pop(context);
                          }
                      )),
                      Expanded(child: SimpleButton.from(
                          context: context,
                          text: 'Zapisz',
                          radius: 0,
                          margin: EdgeInsets.zero,
                          onTap: (){
                            saved = true;
                            Navigator.pop(context);
                          }
                      )),
                    ],
                  )
                ],
              )
          ),
        ),
      )
  );

  return saved?controller.text:null;

}

void openCategoryBottomSheet(
    BuildContext context,
    { required TropCategory selected,
      required List<TropCategory> allTropCategories,
      String? zuchTropName,
      void Function(TropCategory)? onSelected
    }) => showScrollBottomSheet(
    context: context,
    builder: (context) => BottomSheetDef(
        title: 'Wybierz kategorię tropu',
        builder: (context) => ListView.builder(
          itemCount: allTropCategories.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) => ListTile(
            tileColor: selected == allTropCategories[index]?backgroundIcon_(context):null,
            contentPadding: const EdgeInsets.all(Dimen.defMarg),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppCard.bigRadius),
            ),
            leading: TropIcon(
              allTropCategories[index],
              zuchTropName: zuchTropName,
            ),
            title: Text(
              tropCategoryToName(allTropCategories[index]),
              style: AppTextStyle(),
            ),
            onTap: (){
              onSelected?.call(allTropCategories[index]);
              Navigator.pop(context);
            }
          ),

        )
    )
);

class RemoveOwnTropButton extends StatelessWidget{

  final Trop trop;

  const RemoveOwnTropButton(this.trop, {super.key});

  @override
  Widget build(BuildContext context) => SimpleButton.from(
    color: Colors.red,
    context: context,
    icon: MdiIcons.trashCanOutline,
    text: 'Usuń trop',
    textColor: Colors.white,
    margin: EdgeInsets.zero,
    onTap: () => showAlertDialog(
        context,
        title: 'Zastanów się dobrze...',
        content: 'Trop <b>przestanie istnieć</b>.\n\nNa pewno chcesz go <b>usunąć</b>?',
        actionBuilder: (_) => [

          AlertDialogButton(text: 'Jednak nie', onTap: () => Navigator.pop(context)),

          AlertDialogButton(
              text: 'Tak',
              onTap: () async {

                Navigator.pop(context); // Close alert dialog.

                showLoadingWidget(context, 'Zwijanie tropu...', color: AppColors.zhpTropColor);

                bool removed = trop.deleteOwn(context: context);

                Navigator.pop(context); // Close loading widget.
                if(removed) Navigator.pop(context); // Close edit page.
                if(removed) Navigator.pop(context); // Close trop page.
                showAppToast(context, text: 'Usunięto trop');
              }
          )
        ]
    ),
  );
  
}

class RemoveSharedTropButton extends StatelessWidget{

  final Trop trop;

  const RemoveSharedTropButton(this.trop, {super.key});

  @override
  Widget build(BuildContext context) => SimpleButton.from(
    color: Colors.red,
    context: context,
    icon: MdiIcons.trashCanOutline,
    text: 'Rozwiąż trop',
    textColor: Colors.white,
    margin: EdgeInsets.zero,
    onTap: () => showAlertDialog(
        context,
        title: 'Zastanów się dobrze...',
        content: 'Trop <b>przestanie istnieć</b>.\n\nNa pewno chcesz go <b>rozwiązać</b>?',
        actionBuilder: (_) => [

          AlertDialogButton(text: 'Jednak nie', onTap: () => Navigator.pop(context)),

          AlertDialogButton(
              text: 'Tak',
              onTap: () async {

                Navigator.pop(context); // Close alert dialog.

                showLoadingWidget(context, 'Zwijanie tropu...', color: AppColors.zhpTropColor);

                TropListProvider tropListProv = TropListProvider.of(context);

                ApiTrop.delete(
                  tropKey: trop.key!,
                  onSuccess: (){
                    trop.deleteShared(context: context);
                    TropSharedPreviewData.removeFromAllByKey(trop.key!);
                    tropListProv.notify();
                    Navigator.pop(context); // Close loading widget.
                    Navigator.pop(context); // Close edit page.
                    Navigator.pop(context); // Close trop page.
                    showAppToast(context, text: 'Usunięto trop');
                  },
                  onServerMaybeWakingUp: () async {
                    showServerWakingUpToast(context);
                    await popPage(context); // Close loading widget.
                    Navigator.pop(context);

                    return true;
                  },
                  onForceLoggedOut: (){
                    showAppToast(context, text: forceLoggedOutMessage);
                    Navigator.pop(context); // Close loading widget.
                    return true;
                  },
                  onError: () async {
                    showAppToast(context, text: simpleErrorMessage);
                    await popPage(context); // Close loading widget.
                  }
                );

              }
          )
        ]
    ),
  );

}

class LeaveSharedTropButton extends StatelessWidget{

  final Trop trop;

  final void Function()? onLeft;
  final void Function()? onError;

  const LeaveSharedTropButton(this.trop, {this.onLeft, this.onError, super.key});

  @override
  Widget build(BuildContext context) => SimpleButton.from(
    color: Colors.red,
    context: context,
    icon: MdiIcons.exitRun,
    text: 'Opuść trop',
    textColor: Colors.white,
    margin: EdgeInsets.zero,
    onTap: (){

      TropProvider tropProvider = TropProvider.of(context);
      TropListProvider tropListProvider = TropListProvider.of(context);

      carefullyLeaveGroupWithAdmins(
        context: context,
        allAdminCount: trop.userOwnerCount,
        amIAdmin: trop.myRole == TropRole.OWNER,
        cannotLeaveContent: 'Jesteś ostatnim właścicielem tropu i zamierzasz go opuścić!\n\nTak nie wolno.',
        requestLeave: () => ApiTrop.leave(
            tropKey: trop.key!,
            onSuccess: () async {
              showAppToast(context, text: 'Trop opuszczony');

              trop.deleteShared();
              TropSharedPreviewData.removeFromAllByKey(trop.key!);
              Trop.removeSharedFromAll(trop);
              Trop.callProviders(tropProvider, tropListProvider);

              await popPage(context); // Close loading widget.
              Navigator.pop(context);

              onLeft?.call();
            },
            onServerMaybeWakingUp: () async {
              showServerWakingUpToast(context);
              await popPage(context); // Close loading widget.
              Navigator.pop(context);

              return true;
            },
            onError: () async {
              showAppToast(context, text: simpleErrorMessage);
              await popPage(context); // Close loading widget.
              Navigator.pop(context);

              onError?.call();
            }
        ),
      );

    }
  );

}

class LoadableUserSelector extends StatefulWidget{

  final Trop trop;
  final void Function(TropUser)? onUserSelected;

  const LoadableUserSelector(this.trop, {required this.onUserSelected, super.key});
  
  @override
  State<StatefulWidget> createState() => LoadableUserSelectorState();

}

class LoadableUserSelectorState extends State<LoadableUserSelector>{

  Trop get trop => widget.trop;
  void Function(TropUser)? get onUserSelected => widget.onUserSelected;
  
  @override
  Widget build(BuildContext context) => PagingLoadableBaseScrollViewPage(
    appBarTitle: 'Wybierz ogarniacza',
    appBarLeading: IconButton(
      icon: Icon(MdiIcons.arrowLeft),
      onPressed: () => Navigator.pop(context),
    ),

    loadingIndicatorColor: AppColors.zhpTropColor,

    totalItemsCount: trop.userCount,
    loadedItemsCount: trop.loadedUsers.length,
    callReload: () => TropUsersPage.reloadTropUsers(
      context: context,
      trop: trop,
      isMounted: () => mounted,
      setState: () => setState((){}),
    ),
    callLoadMore: () => TropUsersPage.loadMoreTropUsers(
      context: context,
      trop: trop,
      isMounted: () => mounted,
      setState: () => setState((){}),
    ),
    callLoadOnInit: trop.loadedUsers.length == 1,

    sliverBody: (context, isLoading){

      return SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) => TropUserTile(
            user: trop.loadedUsers[index],
            onTap: () => onUserSelected?.call(trop.loadedUsers[index]),
          ),
          childCount: trop.loadedUsers.length
      ));

    }
  );
  
}