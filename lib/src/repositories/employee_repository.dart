import 'package:dio/dio.dart';
import 'package:emplox/src/models/employee_model.dart';

class AdminRepository {
  final Dio dio = Dio();
  final String url = 'http://localhost:3000/';

  Future<List<EmployeeModel>> fetchAdmins() async {
    final response = await dio.get(url);
    final list = response.data as List;
    return list.map((json) => EmployeeModel.fromJson(json)).toList();
  }
}
