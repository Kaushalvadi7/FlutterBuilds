import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_implementation/pages/notes_pages.dart';

void main() async {
  //supabase setup
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://hfmgmdfvyrcaogbyolvo.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhmbWdtZGZ2eXJjYW9nYnlvbHZvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDAxMjY3NTksImV4cCI6MjA1NTcwMjc1OX0.dOGQPadOxIfIhmZqNzybA4GR0E08Ye4q3LUubAEXrUw",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: NotesPages());
  }
}
