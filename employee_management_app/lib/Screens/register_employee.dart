import 'package:employee_management_app/Model/employee_model.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterEmployee extends StatefulWidget {
  const RegisterEmployee({super.key});

  @override
  State<RegisterEmployee> createState() => _RegisterEmployeeState();
}

Future<EmployeeModel?> registerEmployees(
  String firstName,
  String lastName,
  BuildContext context,
) async {
  var url = Uri.parse("http://localhost:8080/addemployee");
  var response = await http.post(
    url,
    headers: <String, String>{"Content-Type": "application/json"},
    body: jsonEncode(<String, String>{
      "firstName": firstName,
      "lastName": lastName,
    }),
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
  }
  return null;
}

class _RegisterEmployeeState extends State<RegisterEmployee> {
  final minimumPadding = 5.0;

  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();

  EmployeeModel? employee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,

        title: Text("Register Employee"),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(minimumPadding * 2),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: minimumPadding,
                  bottom: minimumPadding,
                ),
                child: TextFormField(
                  style: Theme.of(context).textTheme.labelMedium,
                  controller: firstController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    hintText: 'Enter Your First Name',
                    labelStyle: Theme.of(context).textTheme.labelMedium,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: minimumPadding,
                  bottom: minimumPadding,
                ),
                child: TextFormField(
                  style: Theme.of(context).textTheme.labelMedium,
                  controller: lastController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    hintText: 'Enter Your First Name',
                    labelStyle: Theme.of(context).textTheme.labelMedium,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                child: Text('Submit'),
                onPressed: () async {
                  String firstName = firstController.text;
                  String lastName = lastController.text;
                  EmployeeModel? employees = await registerEmployees(
                    firstName,
                    lastName,
                    context,
                  );
                  firstController.text = '';
                  lastController.text = '';
                  setState(() {
                    employee = employees;
                  });
                },

                //  ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(content: Text('Employee Registered Successfully')),
                //     );
              ),
            ],
          ),
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
      actions: this.actions,
      content: Text(
        this.content,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
