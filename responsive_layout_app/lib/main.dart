import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Layout',
      debugShowCheckedModeBanner: false,
      home: const ResponsiveGridScreen(),
    );
  }
}

class ResponsiveGridScreen extends StatelessWidget {
  const ResponsiveGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Use 2 columns for small screens, 3 for medium, and 4 for large screens
    int columns = screenWidth < 400
        ? 2
        : screenWidth < 800
        ? 3
        : 4;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Responsive Grid'),
      ),
      body: GridView.count(
        crossAxisCount: columns, // Number of columns
        crossAxisSpacing: 8.0,  // Space between columns
        mainAxisSpacing: 8.0,   // Space between rows
        children: List.generate(
          20, // Number of items
              (index) => Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                'Item ${index + 1}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
