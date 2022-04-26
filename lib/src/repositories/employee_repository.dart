import 'package:dio/dio.dart';
import 'package:emplox/src/models/admin_model.dart';
import 'package:emplox/src/models/employee_model.dart';
import 'package:emplox/src/repositories/routes.dart';

class EmployeeRepository {
  final routes = Routes();

  Future<List<EmployeeModel>> fetchEmployees() async {
    final response = await routes.getEmployees();
    final list = response['employees'] as List;
    return list.map((json) => EmployeeModel.fromJson(json)).toList();
  }
}
