import 'package:flutter/material.dart';
import 'package:flutter_exam_app/repository/employee_repository.dart';
import '../repository/employee.dart';

final class EmployeeList extends StatefulWidget {
  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  final EmployeeRepository employeeRepository = EmployeeRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: FutureBuilder(
        future: employeeRepository.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Employee> employees = snapshot.data!;
            return ListView.separated(
              itemCount: employees.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final person = employees[index];
                return ListTile(
                  title: Text(person.name),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () => Navigator.of(context).pushNamed(
                    '/employee_detail',
                    arguments: person,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
