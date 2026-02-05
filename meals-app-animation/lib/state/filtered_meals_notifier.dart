import 'package:flutter/material.dart';
import 'package:lab08/models/meal.dart';
import 'package:lab08/state/filters_notifier.dart';

class FilteredMealsNotifier extends ChangeNotifier {
  List<Meal> _filteredMeals = [];
  List<Meal> get filteredMeals => _filteredMeals;

  void updateFilteredMeals(
      List<Meal> allMeals, Map<Filter, bool> activeFilters) {
    _filteredMeals = allMeals.where((meal) {
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    notifyListeners();
  }
}
