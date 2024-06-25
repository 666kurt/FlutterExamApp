import 'package:dio/dio.dart';
import 'package:flutter_exam_app/repository/employee.dart';

class EmployeeRepository {
  final Dio _dio = Dio();

  Future<List<Employee>> fetchData() async {
    try {
      final response =
          await _dio.get('https://dummy.restapiexample.com/api/v1/employees');
      if (response.statusCode == 200) {
        final data = response.data['data'] as List;
        return data.map((item) => Employee.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
