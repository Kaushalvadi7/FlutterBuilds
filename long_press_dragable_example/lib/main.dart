import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DragDropExample(),
    );
  }
}

class DragDropExample extends StatefulWidget {
  const DragDropExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DragDropExampleState createState() => _DragDropExampleState();
}

class _DragDropExampleState extends State<DragDropExample> {
  String dropText = "Drop Here"; // Initial text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LongPressDraggable Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Draggable widget
            LongPressDraggable<String>(
              data: "Dropped!", // Data to pass
              feedback: Container(
                width: 80,
                height: 80,
                // ignore: deprecated_member_use
                color: Colors.blue.withOpacity(0.7),
                child:
                    Icon(Icons.drag_indicator, size: 40, color: Colors.white),
              ),
              childWhenDragging: Container(
                width: 80,
                height: 80,
                color: Colors.grey,
                child: Icon(Icons.android, size: 40, color: Colors.white),
              ),
              child: Container(
                width: 80,
                height: 80,
                color: Colors.green,
                child: Icon(Icons.android, size: 40, color: Colors.white),
              ),
            ),
            const SizedBox(height: 50),
            SelectableText(
              'You can select and copy this text!',
              style: TextStyle(fontSize: 20, color: Colors.blue),
              textAlign: TextAlign.center,
              cursorColor: Colors.red,
              cursorHeight: 20,
              cursorWidth: 10,
              showCursor: true,
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: Scaffold(
//       appBar: AppBar(title: Text("Drag & Drop")),
//       body: Center(
//         child: LongPressDraggable(
//           data: "Dragged",
//           feedback: Icon(Icons.android, size: 50, color: Colors.blue),
//           childWhenDragging: Icon(Icons.android, size: 50, color: Colors.grey),
//           child: Icon(Icons.android, size: 50, color: Colors.green),
//         ),
//       ),
//     ),
//   ));
// }
