import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop_user.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class NameControllerProvider extends ChangeNotifier{

  static NameControllerProvider of(BuildContext context) => Provider.of<NameControllerProvider>(context, listen: false);

  TextEditingController nameController;

  NameControllerProvider({Trop? initTrop, TropBaseData? initTropBaseData}):
        nameController = TextEditingController(text: initTrop?.name??initTropBaseData?.name??'');

}

class TropCategoryProvider extends ChangeNotifier{

  static TropCategoryProvider of(BuildContext context) => Provider.of<TropCategoryProvider>(context, listen: false);

  TropCategory _category;

  TropCategoryProvider({Trop? initTrop, TropBaseData? initTropBaseData}):
        _category = initTrop?.category??initTropBaseData?.category??TropCategory.harcZaradnosc;

  TropCategory get category => _category;
  set category(TropCategory value){
    _category = value;
    notifyListeners();
  }

}

class StartTimeProvider extends ChangeNotifier{

  static StartTimeProvider of(BuildContext context) => Provider.of<StartTimeProvider>(context, listen: false);

  DateTime _startTime;

  DateTime get startTime => _startTime;
  set startTime(DateTime value){
    _startTime = value;
    notifyListeners();
  }

  StartTimeProvider({Trop? initTrop}):
        _startTime = initTrop?.startDate??DateTime.now();

}

class EndTimeProvider extends ChangeNotifier{

  static EndTimeProvider of(BuildContext context) => Provider.of<EndTimeProvider>(context, listen: false);

  DateTime _endTime;

  DateTime get endTime => _endTime;
  set endTime(DateTime value){
    _endTime = value;
    notifyListeners();
  }

  EndTimeProvider({Trop? initTrop}):
        _endTime = initTrop?.endDate??(DateTime.now().add(const Duration(days: 21)));

}

class AimControllersProvider extends ChangeNotifier{

  static AimControllersProvider of(BuildContext context) => Provider.of<AimControllersProvider>(context, listen: false);

  List<TextEditingController> aimControllers;

  AimControllersProvider({Trop? initTrop, TropBaseData? initTropBaseData}):
        aimControllers = (initTrop?.aims??initTropBaseData?.aims??['']).map((a) => TextEditingController(text: a)).toList();

  List<String> getAims(){

    List<String> result = [];
    for(TextEditingController controller in aimControllers)
      if(controller.text.isNotEmpty)
        result.add(controller.text);

    return result;

  }

  void add(){
    aimControllers.add(TextEditingController(text: ''));
    notifyListeners();
  }

  void insert(int index, String value){
    aimControllers.insert(index, TextEditingController(text: value));
    notifyListeners();
  }

  void removeAt(int index){
    aimControllers.removeAt(index);
    notifyListeners();
  }

}

class TropTaskEditableData{

  String? lclId;
  
  late TextEditingController contentController;
  DateTime deadline;

  TropUser? currentAssignee;
  TropUserNick? newAssignee;
  late TextEditingController assigneeController;

  TropUser? get assignee => newAssignee??currentAssignee;

  bool completed;

  TropTaskEditableData(this.lclId, String content, this.deadline, this.currentAssignee, String? assigneeCustomText, this.completed){
    contentController = TextEditingController(text: content);
    assigneeController = TextEditingController(text: assigneeCustomText??'');
  }

  bool get isEmpty => contentController.text.isEmpty;

  TropTaskData toTaskData({bool setLclIdIfNull = false}) => TropTaskData(
    lclId: lclId??(setLclIdIfNull?const Uuid().v4():null),
    content: contentController.text,
    deadline: deadline,
    newAssignee: newAssignee,
    currentAssignee: currentAssignee,
    assigneeCustomText: assigneeController.text,
    completed: completed,
  );

}

class TasksProvider extends ChangeNotifier{

  static TasksProvider of(BuildContext context) => Provider.of<TasksProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  late List<TropTaskEditableData> tasks;

  TasksProvider({Trop? initTrop, TropBaseData<TropTaskExampleData>? initTropBaseData}){

    tasks = [];
    if(initTropBaseData != null)
      for(TropTaskExampleData t in initTropBaseData.tasks)
        tasks.add(TropTaskEditableData(
          null,
          t.content,
          DateTime.now().add(const Duration(days: 14)),

          null,
          null,
          false,
        ));

    else if(initTrop != null)
      for(TropTask t in initTrop.tasks)
        tasks.add(TropTaskEditableData(
          t.lclId,
          t.content,
          t.deadline,

          t.assignee,
          t.assigneeCustomText,
          t.completed
        ));

    if(tasks.isEmpty)
      tasks.add(TropTaskEditableData(null, '', DateTime.now().add(const Duration(days: 14)), null, null, false));

  }

  void add(){
    tasks.add(TropTaskEditableData(
      null,
      '',
      DateTime.now().add(const Duration(days: 14)),
      null,
      null,
      false,
    ));
    notifyListeners();
  }

  void update(int index, {DateTime? deadline, TropUserNick? assignee, String? assigneeCustomText}){
    if(deadline != null) tasks[index].deadline = deadline;
    tasks[index].newAssignee = assignee;
    tasks[index].assigneeController.text = assigneeCustomText??'';
    notifyListeners();
  }

  void insert(int index, TropTaskEditableData value){
    tasks.insert(index, value);
    notifyListeners();
  }

  void removeAt(int index){
    tasks.removeAt(index);
    notifyListeners();
  }

  void notify() => notifyListeners();

}