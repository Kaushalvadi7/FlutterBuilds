import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GridExample(),
    );
  }
}

class GridExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid Layout"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: GridView(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of items in a row
          crossAxisSpacing: 10, // Spacing between columns
          mainAxisSpacing: 8, // Spacing between rows
        ),
        children: [
          // Each grid item
          gridItem("Item 1", Colors.red),
          gridItem("Item 2", Colors.green),
          gridItem("Item 3", Colors.blue),
          gridItem("Item 4", Colors.yellow),
          gridItem("Item 5", Colors.purple),
          gridItem("Item 6", Colors.orange),
          gridItem("Item 7", Colors.cyan),
          gridItem("Item 8", Colors.pink),
          gridItem("Item 9", Colors.grey),
          gridItem("Item 10", Colors.red),
          gridItem("Item 11", Colors.grey),
          gridItem("Item 12", Colors.green),
          gridItem("Item 13", Colors.blue),
          gridItem("Item 14", Colors.yellow),
          gridItem("Item 15", Colors.purple),
          gridItem("Item 16", Colors.orange),
          gridItem("Item 17", Colors.cyan),
          gridItem("Item 18", Colors.pink),
          gridItem("Item 19", Colors.yellow),
          gridItem("Item 20", Colors.purple),
        ],
      ),
    );
  }

  // Helper method to create a grid item
  Widget gridItem(String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
