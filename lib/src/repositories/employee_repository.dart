import 'package:emplox/src/models/employee_model.dart';
import 'package:emplox/src/repositories/routes.dart';

class EmployeeRepository {
  final routes = Routes();

  Future<List<EmployeeModel>> fetchEmployees() async {
    final response = await routes.getEmployees();
    final list = response['employees'] as List;
    return list.map((json) => EmployeeModel.fromJson(json)).toList();
  }

  Future fetchEmployeeCreation(String name, String role) async {
    final response = await routes.employeeCreation(name, role);
    return response['error'];
  }

  Future fetchUpdateEmployee(String name, String role, int? id) async {
    final response = await routes.employeeUpdate(name, role, id);
    return response['error'];
  }

  Future fetchDeleteEmployee(int? id) async {
    final response = await routes.employeeDelete(id);
    return response['error'];
  }
}
