import 'package:employee_management_app/Screens/employee_drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Management App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: EmployeeDrawer(),
    );
  }
}

// void main() {
//   runApp(
//     MaterialApp(
//       title: 'Employee Management App',
//       home: MyHomePage(),
//       debugShowCheckedModeBanner: false,
//     ),
//   );
// }

// class MyHomePage extends StatelessWidget {
//   void _iconButton() {
//     print("Menu button pressed");
//   }

//   void _iconSearch() {
//     print("Search button pressed");
//   }

//   void _iconAdd() {
//     print("Add button pressed");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         leading: IconButton(
//           icon: Icon(Icons.menu),
//           color: Colors.white,
//           tooltip: "Menu",
//           onPressed: _iconButton,
//         ),
//         title: Text(
//           'Employee Management App',
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.search),
//             color: Colors.white,
//             tooltip: "Search",
//             onPressed: _iconSearch,
//           ),
//           IconButton(
//             icon: Icon(Icons.notifications),
//             color: Colors.white,
//             tooltip: "Notifications",
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Center(
//         child: Text(
//           'Welcome to the Employee Management App',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         tooltip: 'Add Employee',
//         backgroundColor: Colors.blue,
//         foregroundColor: Colors.white,
//         child: Icon(Icons.add),
//         onPressed: _iconAdd,
//       ),
//     );
//   }
// }
