import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/rank_disp_type.dart';

import 'indiv_comp_task_editable.dart';

class ModeProvider extends ChangeNotifier{

  static ModeProvider of(BuildContext context) => Provider.of<ModeProvider>(context, listen: false);

  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? value){
    _startDate = value;
    notifyListeners();
  }

  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? value){
    _endDate = value;
    notifyListeners();
  }

  RankDispType? _rankDispType;
  RankDispType? get rankDispType => _rankDispType;
  set rankDispType(RankDispType? value){
    _rankDispType = value;
    notifyListeners();
  }

  ModeProvider({DateTime? startDate, DateTime? endDate, RankDispType? rankDispType}){
    _startDate = startDate??DateTime.now();
    _endDate = endDate??DateTime.now().add(const Duration(days: 365));
    _rankDispType = rankDispType??RankDispType.EXACT;
  }

}

class ColorKeyProvider extends ChangeNotifier{

  static ColorKeyProvider of(BuildContext context) => Provider.of<ColorKeyProvider>(context, listen: false);

  String _colorsKey;

  ColorKeyProvider({String? colorKey}):
    _colorsKey = colorKey??CommonColorData.defColorsKey;

  String get colorsKey => _colorsKey;
  set colorsKey(String value){
    _colorsKey = value;
    notifyListeners();
  }

  Color get avgColor => CommonColorData.get(_colorsKey).avgColor;

  CommonColorData get colors => CommonColorData.get(_colorsKey);
  Color? get color1 => colors.colorStart;
  Color? get color2 => colors.colorEnd;
  Color get accIconColor => Colors.white;

}

class IconKeyProvider extends ChangeNotifier{

  static IconKeyProvider of(BuildContext context) => Provider.of<IconKeyProvider>(context, listen: false);

  String _iconKey;

  IconKeyProvider({String? iconKey}):
      _iconKey = iconKey??CommonIconData.defIconKey;

  String get iconKey => _iconKey;
  set iconKey(String value){
    _iconKey = value;
    notifyListeners();
  }

  IconData get icon => CommonIconData.get(_iconKey);

}

class TaskBodiesProvider extends ChangeNotifier{

  static TaskBodiesProvider of(BuildContext context) => Provider.of<TaskBodiesProvider>(context, listen: false);

  late List<IndivCompTaskEditable> _taskEditables;

  TaskBodiesProvider({List<IndivCompTask>? tasks}){
    _taskEditables = tasks?.map((task) => IndivCompTaskEditable(task)).toList()??[];
  }

  List<IndivCompTaskEditable> get taskEditables => _taskEditables;
  void create(int position){
    _taskEditables.add(IndivCompTaskEditable.empty(position));
    notifyListeners();
  }

  void recalcPositions(){
    for(int i=0; i<_taskEditables.length; i++){
      IndivCompTaskEditable task = _taskEditables[i];
      task.editedPosition = i;
    }
  }

  void removeAt(int index) => _taskEditables.removeAt(index);

  void insert(int index, IndivCompTaskEditable task) => _taskEditables.insert(index, task);

  void update(int i, {String? title, String? desc, int? points, int? position, TaskState? state, bool silent = false}){

    if(title != null)
      _taskEditables[i].editedTitle = title;

    if(desc != null)
      _taskEditables[i].editedDescription = desc;

    if(points != null)
      _taskEditables[i].editedPoints = points;

    if(position != null)
      _taskEditables[i].editedPosition = position;

    if(state != null)
      _taskEditables[i].editedState = state;

    if(!silent)
      notifyListeners();
  }

  void remove(int i, bool value, {bool silent = false}){
    _taskEditables[i].remove = value;
    if(!silent)
      notifyListeners();
  }

  List<IndivTaskBody> createdTasks(){

    List<IndivTaskBody> taskBodies = [];
    for(IndivCompTaskEditable taskEditable in _taskEditables)
      if(!taskEditable.created)
        taskBodies.add(taskEditable.toTaskBody());

    return taskBodies;
  }

  List<IndivTaskBody> updatedTasks(){

    List<IndivTaskBody> taskBodies = [];
    for(IndivCompTaskEditable taskEditable in _taskEditables)
      if(taskEditable.created && taskEditable.isEdited())
        taskBodies.add(taskEditable.toTaskBody());

    return taskBodies;
  }

  List<String?> removedTasks(){

    List<String?> taskBodies = [];
    for(IndivCompTaskEditable taskEditable in _taskEditables)
      if(taskEditable.created && taskEditable.remove!)
        taskBodies.add(taskEditable.task.key);

    return taskBodies;
  }

  void notify() => notifyListeners();

}

class AwardsProvider extends ChangeNotifier{

  static AwardsProvider of(BuildContext context) => Provider.of<AwardsProvider>(context, listen: false);

  List<String?>? _awards;

  List<IndivCompAward>? _data;
  List<IndivCompAward>? get data => _data;

  AwardsProvider({List<String?>? awards}){
    _awards = awards??[];
    _data = IndivComp.awardListFromRaw(_awards!);
  }

  static AwardsProvider fromIndivCompAwards(List<IndivCompAward> data){
    List<String?> awards = [];
    for(IndivCompAward _d in data){
      awards.add(_d.award);
      for(int i=0; i<_d.rangeTo - _d.rangeFrom; i++)
        awards.add(null);
    }
    return AwardsProvider(awards: awards);
  }

  List<String?>? get awards => _awards;
  void add(String award){
    _awards!.add(award);
    _data = IndivComp.awardListFromRaw(_awards!);
    notifyListeners();
  }

  int? _dataIndexToAwardsIndex(int nonNullIndex){

    int? index;
    int currNonNullIndex = 0;
    for(int i=0; i<_awards!.length; i++)
      if(_awards![i] != null){
        if(currNonNullIndex == nonNullIndex){
          index = i;
          break;
        }
        currNonNullIndex++;
      }

    return index;
  }

  void insertAfter(int nonNullIndex, String? award){

    int? index = _dataIndexToAwardsIndex(nonNullIndex);
    if(index == null)
      return;

    _awards!.insert(index + 1, award);
    _data = IndivComp.awardListFromRaw(_awards!);
    notifyListeners();
  }

  void removeAt(int nonNullIndex){
    int? index = _dataIndexToAwardsIndex(nonNullIndex);
    if(index == null)
      return;

    if(index < _awards!.length-1 && _awards![index + 1] == null)
      _awards!.removeAt(index + 1);
    else
      _awards!.removeAt(index);

    _data = IndivComp.awardListFromRaw(_awards!);
    notifyListeners();
  }

}