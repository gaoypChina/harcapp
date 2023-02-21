import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/border_material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_editor_page/providers.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_icon.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../trop.dart';

class TropEditorPage extends StatefulWidget{

  final Trop? initTrop;
  final void Function(Trop)? onSaved;

  const TropEditorPage({this.initTrop, this.onSaved, super.key});

  @override
  State<StatefulWidget> createState() => TropEditorPageState();

}

class TropEditorPageState extends State<TropEditorPage>{

  Trop? get initTrop => widget.initTrop;
  void Function(Trop)? get onSaved => widget.onSaved;

  bool get editMode => initTrop != null;

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => NameControllerProvider(initTrop: initTrop)),
      ChangeNotifierProvider(create: (context) => TropCategoryProvider(initTrop: initTrop)),
      ChangeNotifierProvider(create: (context) => StartTimeProvider(initTrop: initTrop)),
      ChangeNotifierProvider(create: (context) => EndTimeProvider(initTrop: initTrop)),
      ChangeNotifierProvider(create: (context) => AimControllersProvider(initTrop: initTrop)),
      ChangeNotifierProvider(create: (context) => TasksProvider(initTrop: initTrop)),
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
                icon: const Icon(MdiIcons.check),
                onPressed: () async {

                  String name = NameControllerProvider.of(context).nameController.text;
                  TropCategory category = TropCategoryProvider.of(context).category;
                  List<String> aims = AimControllersProvider.of(context).aimControllers.map((c) => c.text).toList();
                  DateTime startTime = StartTimeProvider.of(context).startTime;
                  DateTime endTime = EndTimeProvider.of(context).endTime;
                  List<TropTask> tasks = TasksProvider.of(context).tasks.map((t) => t.toTask()).toList();

                  if(editMode) {
                    initTrop!.name = name;
                    initTrop!.category = category;
                    initTrop!.aims = aims;
                    initTrop!.startTime = startTime;
                    initTrop!.endTime = endTime;
                    initTrop!.tasks = tasks;

                    initTrop!.save();
                    onSaved?.call(initTrop!);
                    Navigator.pop(context);

                  } else {
                    Trop trop = Trop.create(
                        name: name,
                        category: category,
                        aims: aims,
                        startTime: startTime,
                        endTime: endTime,
                        tasks: tasks
                    );
                    trop.save();
                    await popPage(context);
                    onSaved?.call(trop);
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

                Row(
                  children: [

                    Text('Kategoria:', style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG
                    )),

                    Expanded(child: DropdownButtonHideUnderline(
                        child: Consumer<TropCategoryProvider>(
                          builder: (context, prov, child) => DropdownButton2<TropCategory>(
                            isExpanded: true,
                            hint: Text(
                              'Kategoria tropu',
                              style: AppTextStyle(color: hintEnab_(context))
                            ),
                            items: allHarcTropCategories.map((cat) => DropdownMenuItem(
                              value: cat,
                              child: Row(
                                children: [
                                  const SizedBox(width: Dimen.defMarg),
                                  Text(tropCategoryToName(cat), style: AppTextStyle(
                                    fontSize: Dimen.TEXT_SIZE_BIG,
                                    fontWeight: weight.halfBold
                                  )),
                                  Expanded(child: Container()),
                                  Padding(
                                    padding: const EdgeInsets.all(Dimen.defMarg),
                                    child: TropIcon(cat, size: 60),
                                  ),
                                  const SizedBox(width: Dimen.defMarg),
                                ],
                              )
                            )).toList(),
                            itemPadding: EdgeInsets.zero,
                            itemHeight: TropIcon.defSize,

                            value: prov.category,
                            onChanged: (value) => prov.category = value as TropCategory,
                            iconSize: 0,
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppCard.defRadius),
                            ),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppCard.bigRadius),
                            ),
                            dropdownPadding: EdgeInsets.zero,
                          ),
                        )
                    ))
                  ],
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

                          if(prov.aimControllers.length > 1)
                            Align(
                              alignment: Alignment.bottomRight,
                              child: SimpleButton.from(
                                  context: context,
                                  text: 'Usuń',
                                  icon: MdiIcons.close,
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
                            ),

                        ],
                      )
                    ),
                    itemCount: prov.aimControllers.length,
                    shrinkWrap: true,
                  )
                ),

                const SizedBox(
                  height: Dimen.defMarg,
                ),

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
                                    child: AssigneeButton(prov.tasks[index]),
                                  )),

                                  SimpleButton.from(
                                    context: context,
                                    text: 'Do ${dateToString(
                                        prov.tasks[index].deadline,
                                        shortMonth: true,
                                        showYear: null
                                    )}',
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
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: SimpleButton.from(
                                      context: context,
                                      text: 'Usuń',
                                      icon: MdiIcons.close,
                                      margin: EdgeInsets.zero,
                                      iconLeading: false,
                                      //padding: const EdgeInsets.all(Dimen.defMarg),
                                      onTap: (){

                                        TropTaskTmpData value = prov.tasks[index];
                                        prov.removeAt(index);

                                        showAppToast(
                                            context,
                                            text: 'Usunięto',
                                            buttonText: 'Cofnij',
                                            onButtonPressed: () => prov.insert(index, value)
                                        );
                                      }
                                  ),
                                ),

                            ],
                          )
                      ),
                      itemCount: prov.tasks.length,
                      shrinkWrap: true,
                    )
                ),

                const SizedBox(
                  height: Dimen.defMarg,
                ),

                Consumer<TasksProvider>(
                  builder: (context, prov, child) => SimpleButton.from(
                      color: cardEnab_(context),
                      context: context,
                      icon: MdiIcons.plus,
                      text: 'Dodaj zadanie',
                      margin: EdgeInsets.zero,
                      onTap: () => prov.add()
                  ),
                ),

              ]))
          )

        ],
      ),
    )
  );

}

class AssigneeButton extends StatelessWidget{

  final TropTaskTmpData task;

  const AssigneeButton(this.task, {super.key});

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
    text: assigneeName??'Wybierz ogarniacza',
    icon: assigneeName==null?MdiIcons.pencilOutline:MdiIcons.accountCircleOutline,
    textColor: task.assignee==null&&task.assigneeController.text.isEmpty?
    hintEnab_(context):
    textEnab_(context),
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
                leading: const Icon(MdiIcons.formTextbox),
                title: Text('Wpisz ręcznie', style: AppTextStyle()),
                onTap: () async {

                  Navigator.pop(context);

                  String? newText = await openAssigneeTextField(
                    context,
                    initText: task.assigneeController.text,
                  );

                  if(newText != null) {
                    task.assignee = null;
                    task.assigneeController.text = newText;
                    TasksProvider.notify_(context);
                  }
                },
              ),

              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppCard.bigRadius),
                ),
                leading: const Icon(MdiIcons.accountCircleOutline),
                title: Text('Wybierz konto HarcApp', style: AppTextStyle()),
                onTap: (){
                  showAppToast(context, text: 'Na razie to nie działa!');
                },
              )

            ],
          )
      )
  );

}

Future<String?> openAssigneeTextField(
    BuildContext context,
    { String? initText,
      void Function(String)? onChanged
    }) async{

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
                      onChanged: (_, text) => onChanged?.call(text),
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