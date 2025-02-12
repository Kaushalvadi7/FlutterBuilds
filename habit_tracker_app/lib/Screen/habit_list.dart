import 'package:flutter/material.dart';
import 'package:habit_tracker_app/Screen/provider/habit_provider.dart';
import 'package:provider/provider.dart';

// Main Habit List Screen widget
class HabitListScreen extends StatelessWidget {
  const HabitListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final habitProvider = Provider.of<HabitProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              Provider.of<HabitProvider>(context, listen: false).resetHabits();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding:
            const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daily Progress: ${habitProvider.completedHabits}/${habitProvider.totalHabits} habits completed',
                  style: const TextStyle(
                      fontSize: 16),
                ),
                const SizedBox(height: 8), // Add vertical spacing
                LinearProgressIndicator(
                  value: habitProvider.totalHabits > 0
                      ? habitProvider.completedHabits /
                      habitProvider.totalHabits
                      : 0, // Avoid division by zero
                ),
                const SizedBox(height: 8), // Add vertical spacing
                Text(
                  'Completion Percentage: ${habitProvider.completionPercentage.toStringAsFixed(1)}%',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold), // Bold styling
                ),
              ],
            ),
          ),
          // Habit List Section
          Expanded(
            child: ListView.builder(
              itemCount:
              habitProvider.habits.length, // Number of habits to display
              itemBuilder: (ctx, index) {
                // Get the habit at the current index
                final habit = habitProvider.habits[index];
                return GestureDetector(
                  onLongPress: () {
                    habitProvider.removeHabit(habit.id);
                  },
                  child: ListTile(
                    title: Text(habit.title), // Display the habit title
                    trailing: Checkbox(
                      value: habit.isCompleted, // Bind checkbox to habit status
                      onChanged: (_) {
                        habitProvider.toggleHabit(habit.id);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // Floating Action Button to add new habits
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show a dialog to input a new habit
          showDialog(
            context: context,
            builder: (ctx) {
              String newHabitTitle = '';
              return AlertDialog(
                title: const Text('Add Habit'),
                content: TextField(
                  onChanged: (value) => newHabitTitle = value,
                  decoration: const InputDecoration(
                      hintText: 'Habit Title'), // Placeholder text
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (newHabitTitle.isNotEmpty) {
                        habitProvider
                            .addHabit(newHabitTitle);
                        Navigator.of(ctx).pop(); // Close dialog
                      }
                    },
                    child: const Text('Add'), // Button text
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add), // Icon for the FAB
      ),
    );
  }
}
