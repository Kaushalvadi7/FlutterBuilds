import 'dart:convert';
import 'package:employee_management_app/Model/employee_model.dart';
import 'package:employee_management_app/Screens/employee_drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class updateEmployee extends StatefulWidget {
  EmployeeModel employee;

  updateEmployee(this.employee, {super.key});

  @override
  State<StatefulWidget> createState() {
    return updateEmployeeState(employee);
  }
}

Future<EmployeeModel> updateEmployees(
  EmployeeModel employee,
  BuildContext context,
) async {
  var url = Uri.parse("http://localhost:8080/updateemployee");
  var response = await http.put(
    url,
    headers: <String, String>{"Content-Type": "application/json"},
    body: jsonEncode(employee),
  );

  String responseString = response.body;

  if (response.statusCode == 200) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return MyAlertDialog(title: 'Backend Response', content: response.body);
      },
    );
    return employee;
  } else {
    throw Exception('Failed to update employee: ${response.statusCode}');
  }
}

class updateEmployeeState extends State<updateEmployee> {
  EmployeeModel employee;
  final double minimumPadding = 5.0;

  late TextEditingController employeeNumber;
  bool _isEnabled = false;
  late TextEditingController firstController;
  late TextEditingController lastController;

  updateEmployeeState(this.employee) {
    employeeNumber = TextEditingController(text: employee.id.toString());
    firstController = TextEditingController(text: employee.firstName ?? '');
    lastController = TextEditingController(text: employee.lastName ?? '');
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.labelMedium;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Update Employee'),
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
        padding: EdgeInsets.all(minimumPadding * 2),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: minimumPadding),
              child: TextFormField(
                style: textStyle,
                controller: employeeNumber,
                enabled: _isEnabled,
                decoration: InputDecoration(
                  labelText: 'Employee ID',
                  hintText: 'Enter Employee ID',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: minimumPadding),
              child: TextFormField(
                style: textStyle,
                controller: firstController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  hintText: 'Enter Your First Name',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: minimumPadding),
              child: TextFormField(
                style: textStyle,
                controller: lastController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  hintText: 'Enter Your Last Name',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Update Details'),
              onPressed: () async {
                String firstName = firstController.text;
                String lastName = lastController.text;

                EmployeeModel updatedEmp = EmployeeModel(
                  id: employee.id,
                  firstName: firstName,
                  lastName: lastName,
                );

                try {
                  EmployeeModel emp = await updateEmployees(
                    updatedEmp,
                    context,
                  );
                  setState(() {
                    employee = emp;
                  });
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Error: $e")));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  MyAlertDialog({
    required this.title,
    required this.content,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(this.title, style: Theme.of(context).textTheme.titleLarge),
      content: Text(
        this.content,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions:
          actions.isNotEmpty
              ? actions
              : [
                TextButton(
                  child: Text("OK"),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
    );
  }
}
