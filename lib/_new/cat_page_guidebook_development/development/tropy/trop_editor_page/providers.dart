import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class NameControllerProvider extends ChangeNotifier{

  static NameControllerProvider of(BuildContext context) => Provider.of<NameControllerProvider>(context, listen: false);

  TextEditingController nameController;

  NameControllerProvider({Trop? initTrop}):
        nameController = TextEditingController(text: initTrop?.name??'');

}

class TropCategoryProvider extends ChangeNotifier{

  static TropCategoryProvider of(BuildContext context) => Provider.of<TropCategoryProvider>(context, listen: false);

  TropCategory _category;

  TropCategoryProvider({Trop? initTrop}):
        _category = initTrop?.category??TropCategory.harcZaradnosc;

  TropCategory get category => _category;
  set category(TropCategory value){
    _category = value;
    notifyListeners();
  }

}

class AimControllersProvider extends ChangeNotifier{

  static AimControllersProvider of(BuildContext context) => Provider.of<AimControllersProvider>(context, listen: false);

  List<TextEditingController> aimControllers;

  AimControllersProvider({Trop? initTrop}):
        aimControllers = (initTrop?.aims??['']).map((a) => TextEditingController(text: a)).toList();

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

class TasksProvider extends ChangeNotifier{

  static TasksProvider of(BuildContext context) => Provider.of<TasksProvider>(context, listen: false);

  List<Tuple3<TextEditingController, DateTime, String>> tasks;

  TasksProvider({Trop? initTrop}):
        tasks = (initTrop?.tasks??[]).map((t) => Tuple3(
            TextEditingController(text: t.content),
            t.deadline,
            ''
        )).toList();

  void add(){
    tasks.add(Tuple3(
        TextEditingController(text: ''),
        DateTime.now().add(const Duration(days: 14)),
        ''
    ));
    notifyListeners();
  }

  void insert(int index, Tuple3<TextEditingController, DateTime, String> value){
    tasks.insert(index, value);
    notifyListeners();
  }

  void removeAt(int index){
    tasks.removeAt(index);
    notifyListeners();
  }

}