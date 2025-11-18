import 'dart:developer' as developer;
import 'package:flutter/material.dart';

class MealPlanProvider with ChangeNotifier {
  // New data structure: Map<weekday, Map<mealType, mealDescription>>
  final Map<int, Map<String, String>> _weeklyPlan = {
    1: {
      'Desayuno': 'Avena con Frutos Rojos',
      'Almuerzo': 'Pechuga de Pollo a la Plancha, Ensalada Mixta',
      'Cena': '',
      'Snacks': '',
    },
    2: {
      'Desayuno': '',
      'Almuerzo': '',
      'Cena': '',
      'Snacks': '',
    },
    3: {
      'Desayuno': '',
      'Almuerzo': '',
      'Cena': '',
      'Snacks': '',
    },
    4: {
      'Desayuno': '',
      'Almuerzo': '',
      'Cena': '',
      'Snacks': '',
    },
    5: {
      'Desayuno': '',
      'Almuerzo': '',
      'Cena': '',
      'Snacks': '',
    },
    6: {
      'Desayuno': '',
      'Almuerzo': '',
      'Cena': '',
      'Snacks': '',
    },
    7: {
      'Desayuno': '',
      'Almuerzo': '',
      'Cena': '',
      'Snacks': '',
    },
  };

  Map<int, Map<String, String>> get weeklyPlan => _weeklyPlan;

  String getMealTextForDay(DateTime day, String mealType) {
    final weekday = day.weekday;
    return _weeklyPlan[weekday]?[mealType] ?? '';
  }

  Map<String, String> getPlanForDay(DateTime day) {
    final weekday = day.weekday;
    final plan = _weeklyPlan[weekday] ?? {};
    final allMealTypes = ['Desayuno', 'Almuerzo', 'Cena', 'Snacks'];
    for (var mealType in allMealTypes) {
      plan.putIfAbsent(mealType, () => '');
    }
    return plan;
  }

  void updateMealText(DateTime day, String mealType, String newText) {
    final weekday = day.weekday;
    if (_weeklyPlan.containsKey(weekday)) {
      _weeklyPlan[weekday]![mealType] = newText;
    } else {
      _weeklyPlan[weekday] = {mealType: newText};
    }
    notifyListeners();
  }

  void repeatWeek(DateTime currentWeek) {
    developer.log('Función "Repetir Semana" llamada. Lógica pendiente de implementación.', name: 'MealPlanProvider');
    notifyListeners();
  }
}
