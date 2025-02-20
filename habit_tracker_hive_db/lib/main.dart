import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'Model/habit_model.dart';
import 'Screen/habit_list.dart';
import 'Screen/provider/habit_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HabitAdapter()); // Register the adapter

  runApp(
    ChangeNotifierProvider(
      create: (_) => HabitProvider(),
      child: MaterialApp(
        title: 'Habit Tracker',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HabitListScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
