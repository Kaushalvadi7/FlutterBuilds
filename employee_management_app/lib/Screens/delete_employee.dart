import 'package:employee_management_app/Model/employee_model.dart';
import 'package:employee_management_app/Screens/get_employees.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeleteEmployee extends StatefulWidget {
  const DeleteEmployee({super.key});

  @override
  State<DeleteEmployee> createState() => _DeleteEmployeeState();
}

Future<EmployeeModel> deleteEmployees(String firstName, String lastName) async {
  var url = Uri.parse("http://localhost:8080/deleteemployee");
  var response = await http.delete(
    url,
    headers: <String, String>{
      "Content-Type": "application/json;charset=UTF-8,",
    },
  );
  return EmployeeModel.fromJson(jsonDecode(response.body));
}

class _DeleteEmployeeState extends State<DeleteEmployee> {
  @override
  Widget build(BuildContext context) {
    return GetEmployees();
  }
}
