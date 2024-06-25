import 'package:flutter/material.dart';
import 'package:flutter_exam_app/repository/employee.dart';

class EmployeeDetail extends StatelessWidget {
  const EmployeeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final Employee employee =
        ModalRoute.of(context)!.settings.arguments as Employee;

    return Scaffold(
      appBar: AppBar(
        title: Text(employee.name),
      ),
    );
  }
}
