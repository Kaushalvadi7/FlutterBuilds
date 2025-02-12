import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screen/habit_list.dart';
import 'Screen/provider/habit_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
        ChangeNotifierProvider(create: (_) => HabitProvider(),
      child: MaterialApp(
        title: 'Habit Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HabitListScreen(),
          debugShowCheckedModeBanner: false
      ),
    ),
  );
}