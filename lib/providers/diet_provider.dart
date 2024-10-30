// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/meal.dart';

class DietProvider with ChangeNotifier {
  int _dailyGoal = 2000;
  List<Meal> _meals = [];

  DietProvider() {
    _loadDailyGoal();
  }

  int get dailyGoal => _dailyGoal;
  List<Meal> get meals => _meals;
  int get totalCalories => _meals.fold(0, (sum, meal) => sum + meal.calories);

  String get advice {
    if (totalCalories < _dailyGoal) {
      return "You're on track! Keep up the good work!";
    } else if (totalCalories == _dailyGoal) {
      return "You've met your goal. Consider lighter meals for the rest of the day.";
    } else {
      return "You've exceeded your goal. Watch your intake for the rest of the day!";
    }
  }

  Future<void> _loadDailyGoal() async {
    final prefs = await SharedPreferences.getInstance();
    _dailyGoal = prefs.getInt('dailyGoal') ?? 2000;
    notifyListeners();
  }

  Future<void> setDailyGoal(int goal) async {
    _dailyGoal = goal;
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('dailyGoal', goal);
    notifyListeners();
  }

  void addMeal(Meal meal) {
    _meals.add(meal);
    notifyListeners();
  }
}
