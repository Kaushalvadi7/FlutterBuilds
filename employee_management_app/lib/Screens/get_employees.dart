import 'dart:convert';

import 'package:employee_management_app/Model/employee_model.dart';
import 'package:employee_management_app/Screens/delete_employee.dart';
import 'package:employee_management_app/Screens/employee_drawer.dart';
import 'package:employee_management_app/Screens/update_employee.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetEmployees extends StatefulWidget {
  const GetEmployees({super.key});

  @override
  State<GetEmployees> createState() => _GetAllEmployeesState();
}

class _GetAllEmployeesState extends State<GetEmployees> {
  var employess = List<EmployeeModel>.generate(
    200,
    (index) => EmployeeModel(id: 0, firstName: '', lastName: ''),
  );

  Future<List<EmployeeModel>> getEmployees() async {
    var data = await http.get(
      Uri.parse('http://localhost:8080/getallemployees'),
    );
    var jsonData = json.decode(data.body);

    List<EmployeeModel> employee = [];
    for (var e in jsonData) {
      EmployeeModel employees = EmployeeModel(
        id: e["id"],
        firstName: e["firstName"],
        lastName: e["lastName"],
      );
      employee.add(employees);
    }
    return employee;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("All Employees Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EmployeeDrawer()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          future: getEmployees(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: Icon(Icons.error, size: 50, color: Colors.red),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final employee = snapshot.data[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(12),
                    title: Text(
                      'ID: ${employee.id}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Name: ${employee.firstName} ${employee.lastName}',
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(employee),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final EmployeeModel employee;

  DetailPage(this.employee);

  deleteEmployee1(EmployeeModel employee) async {
    final url = Uri.parse("http://localhost:8080/deleteemployee");
    final request = http.Request("DELETE", url);
    request.headers.addAll(<String, String>{
      "Content-type": "application/json",
    });
    request.body = jsonEncode(employee);
    final response = await request.send();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${employee.firstName}\'s Profile'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => updateEmployee(employee),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Employee Details",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  "First Name: ${employee.firstName}",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  "Last Name: ${employee.lastName}",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          deleteEmployee1(employee);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DeleteEmployee()),
          );
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
