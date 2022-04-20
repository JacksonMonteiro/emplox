import 'package:dio/dio.dart';
import 'package:emplox/src/models/admin_model.dart';

class AdminRepository {
  final Dio dio = Dio();
  final String url = 'http://localhost:3000/';

  Future<List<AdminModel>> fetchAdmins() async {
    final response = await dio.get(url);
    final list = response.data as List;
    return list.map((json) => AdminModel.fromJson(json)).toList();
  }
}
