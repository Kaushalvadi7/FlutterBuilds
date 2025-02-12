import 'package:flutter/material.dart';
import '../../Model/habit_model.dart';

class HabitProvider with ChangeNotifier {
  final List<Habit> _habits = [];

  List<Habit> get habits => _habits;
  int get totalHabits => _habits.length;
  int get completedHabits => _habits.where((habit) => habit.isCompleted).length;

  // Getter to calculate the percentage of completed habits.
  double get completionPercentage {
    if (totalHabits == 0) return 0;
    return (completedHabits / totalHabits) * 100;
  }

  // Method to add a new habit.
  void addHabit(String title) {
    final newHabit = Habit(
      id: DateTime.now().toString(), // Using current timestamp as a unique ID
      title: title,
    );

    // Add the new habit to the list of habits.
    _habits.add(newHabit);
    notifyListeners();
  }


  // Method to toggle the completion status of a habit by its ID.
  void toggleHabit(String id) {
    // Find the index of the habit with the given ID.
    final index = _habits.indexWhere((habit) => habit.id == id);
    if (index != -1) {
      _habits[index].isCompleted = !_habits[index].isCompleted;
      notifyListeners();
    }
  }

  // Method to reset all habits' completion status to false.
  void resetHabits() {
    for (var habit in _habits) {
      habit.isCompleted = false; // Set each habit's completion status to false
    }
    notifyListeners();
  }
  // to delete the items
  void removeHabit(String id) {
    _habits.removeWhere((tx) => tx.id == id);
    notifyListeners();
  }
}