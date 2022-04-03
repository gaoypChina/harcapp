
import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task.dart';

import 'indiv_comp_task_editable.dart';

class ModeProvider extends ChangeNotifier{

  DateTime _startDate;
  DateTime get startDate => _startDate;
  set startDate(DateTime value){
    _startDate = value;
    notifyListeners();
  }

  DateTime _endDate;
  DateTime get endDate => _endDate;
  set endDate(DateTime value){
    _endDate = value;
    notifyListeners();
  }

  bool _overviewMode;
  bool get overviewMode => _overviewMode;
  set overviewMode(bool value){
    _overviewMode = value;
    notifyListeners();
  }

  ModeProvider({DateTime startDate, DateTime endDate, bool overviewMode}){
    _startDate = startDate??DateTime.now();
    _endDate = endDate??DateTime.now().add(const Duration(days: 365));
    _overviewMode = overviewMode??true;
  }

}

class ColorKeyProvider extends ChangeNotifier{

  String _colorsKey;

  ColorKeyProvider({String colorKey}){
    _colorsKey = colorKey??CommonColorData.DEF_COLORS_KEY;
  }

  String get colorsKey => _colorsKey;
  set colorsKey(String value){
    _colorsKey = value;
    notifyListeners();
  }

  Color get avgColor => CommonColorData.ALL[_colorsKey].avgColor;

  CommonColorData get colors => CommonColorData.ALL[_colorsKey];
  Color get color1 => colors.colorStart;
  Color get color2 => colors.colorEnd;
  Color get accIconColor => Colors.white;

}

class IconKeyProvider extends ChangeNotifier{

  String _iconKey;

  IconKeyProvider({String iconKey}){
    _iconKey = iconKey??CommonIconData.DEF_ICON_KEY;
  }

  String get iconKey => _iconKey;
  set iconKey(String value){
    _iconKey = value;
    notifyListeners();
  }

  IconData get icon => CommonIconData.ALL[_iconKey];

}

class TaskBodiesProvider extends ChangeNotifier{

  List<IndivCompTaskEditable> _taskEditables;

  TaskBodiesProvider({List<IndivCompTask> tasks}){
    _taskEditables = tasks?.map((task) => IndivCompTaskEditable(task))?.toList()??[];
  }

  List<IndivCompTaskEditable> get taskEditables => _taskEditables;
  void create(int position){
    _taskEditables.add(IndivCompTaskEditable.empty(position));
    notifyListeners();
  }

  void update(int i, {String title, String desc, int points, int position, TaskState state, bool silent = false}){

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

  List<String> removedTasks(){

    List<String> taskBodies = [];
    for(IndivCompTaskEditable taskEditable in _taskEditables)
      if(taskEditable.created && taskEditable.remove)
        taskBodies.add(taskEditable.task.key);

    return taskBodies;
  }

  void notify() => notifyListeners();

}

class AwardsProvider extends ChangeNotifier{

  List<String> _awards;

  List<IndivCompAward> _data;
  List<IndivCompAward> get data => _data;

  AwardsProvider({List<String> awards}){
    _awards = awards??[];
    _data = IndivComp.awardListFromRaw(_awards);
  }

  static AwardsProvider fromIndivCompAwards(List<IndivCompAward> data){
    List<String> _awards = [];
    for(IndivCompAward _d in data){
      _awards.add(_d.award);
      for(int i=0; i<_d.rangeTo - _d.rangeFrom; i++)
        _awards.add(null);
    }
    return AwardsProvider(awards: _awards);
  }

  List<String> get awards => _awards;
  void add(String award){
    _awards.add(award);
    _data = IndivComp.awardListFromRaw(_awards);
    notifyListeners();
  }

  int _dataIndexToAwardsIndex(int nonNullIndex){

    int index;
    int currNonNullIndex = 0;
    for(int i=0; i<_awards.length; i++)
      if(_awards[i] != null){
        if(currNonNullIndex == nonNullIndex){
          index = i;
          break;
        }
        currNonNullIndex++;
      }

    return index;
  }

  void insertAfter(int nonNullIndex, String award){

    int index = _dataIndexToAwardsIndex(nonNullIndex);
    if(index == null)
      return;

    _awards.insert(index + 1, award);
    _data = IndivComp.awardListFromRaw(_awards);
    notifyListeners();
  }

  void removeAt(int nonNullIndex){
    int index = _dataIndexToAwardsIndex(nonNullIndex);
    if(index == null)
      return;

    if(index < _awards.length-1 && _awards[index + 1] == null)
      _awards.removeAt(index + 1);
    else
      _awards.removeAt(index);

    _data = IndivComp.awardListFromRaw(_awards);
    notifyListeners();
  }

}