import 'package:dio/dio.dart';

class AdminRepository {
  final Dio dio = Dio();
  final String url = 'http://localhost:3000/';
}
