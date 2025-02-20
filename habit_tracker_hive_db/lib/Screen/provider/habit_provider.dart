import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../Model/habit_model.dart';

class HabitProvider with ChangeNotifier {
  late Box<Habit> _habitBox;

  List<Habit> get habits => _habitBox.values.toList();
  int get totalHabits => _habitBox.length;
  int get completedHabits => _habitBox.values.where((habit) => habit.isCompleted).length;

  double get completionPercentage {
    if (totalHabits == 0) return 0;
    return (completedHabits / totalHabits) * 100;
  }

  HabitProvider() {
    _initializeHive();
  }

  Future<void> _initializeHive() async {
    _habitBox = await Hive.openBox<Habit>('habitBox');
    notifyListeners();
  }

  void addHabit(String title) {
    final newHabit = Habit(id: DateTime.now().toString(), title: title);
    _habitBox.put(newHabit.id, newHabit);
    notifyListeners();
  }

  void toggleHabit(String id) {
    final habit = _habitBox.get(id);
    if (habit != null) {
      habit.isCompleted = !habit.isCompleted;
      _habitBox.put(id, habit);
      notifyListeners();
    }
  }

  void resetHabits() {
    for (var habit in _habitBox.values) {
      habit.isCompleted = false;
    }
    notifyListeners();
  }

  void removeHabit(String id) {
    _habitBox.delete(id);
    notifyListeners();
  }
}
