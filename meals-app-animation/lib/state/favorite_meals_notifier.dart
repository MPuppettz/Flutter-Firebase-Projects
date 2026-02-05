import 'package:flutter/material.dart';
import 'package:lab08/models/meal.dart';

class FavoriteMealsNotifier extends ChangeNotifier {
  final List<Meal> _favoriteMeals = [];

  List<Meal> get favoriteMeals => _favoriteMeals;

  void toggleMealFavoriteStatus(Meal meal) {
    if (_favoriteMeals.contains(meal)) {
      _favoriteMeals.remove(meal);
    } else {
      _favoriteMeals.add(meal);
    }
    notifyListeners();
  }
}
