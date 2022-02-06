
import 'package:flutter/material.dart';

import 'meal.dart';

class SelectedMealsProvider extends ChangeNotifier{

  List<Meal> meals;

  SelectedMealsProvider(){
    meals = [];
  }

  changeMealSelection(Meal meal){
    if(meals.contains(meal))
      meals.remove(meal);
    else
      meals.add(meal);

    notifyListeners();
  }

  bool isSelected(Meal meal) => meals.contains(meal);

}