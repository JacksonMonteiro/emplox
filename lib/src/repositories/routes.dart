import 'package:dio/dio.dart';
import 'package:localization/localization.dart';

class Routes {
  final String baseUrl = 'http://192.168.124.107:3000/';
  final Dio dio = Dio();

  Future login(String username, String password) async {
    String route = baseUrl + 'admin/login';

    try {
      var response = await dio.post(route,
          data: {"username": username, "password": password},
          options: Options(
            contentType: Headers.jsonContentType,
          ));
      return response.data;
    } catch (e) {
      throw Exception("routes-admin-login-error".i18n(['$e']));
    }
  }

  Future adminCreation(String username, String email, String password) async {
    String route = baseUrl + 'admin';
    try {
      var response = await dio.post(route,
          data: {"username": username, "email": email, "password": password},
          options: Options(
            contentType: Headers.jsonContentType,
          ));
      return response.data;
    } catch (e) {
      throw Exception('routes-admin-register-error'.i18n(['$e']));
    }
  }

  Future getEmployees() async {
    String route = baseUrl + 'employee';
    try {
      var response = await dio.get(route);
      return response.data;
    } catch (e) {
      throw Exception('routes-employee-query-error'.i18n(['$e']));
    }
  }

  Future employeeCreation(String name, String role) async {
    String route = baseUrl + 'employee';
    try {
      var response = await dio.post(route,
          data: {"name": name, "role": role},
          options: Options(
            contentType: Headers.jsonContentType,
          ));
      return response.data;
    } catch (e) {
      throw Exception('routes-employee-creation-error'.i18n(['$e']));
    }
  }

  Future employeeUpdate(String name, String role, int? id) async {
    String route = baseUrl + 'employee/$id';
    try {
      var response = await dio.put(route,
          data: {"name": name, "role": role},
          options: Options(
            contentType: Headers.jsonContentType,
          ));
      return response.data;
    } catch (e) {
      throw Exception("routes-employee-update-error".i18n(['$e']));
    }
  }

  Future employeeDelete(int? id) async {
    String route = baseUrl + 'employee/$id';
    try {
      var response = await dio.delete(route,
          options: Options(
            contentType: Headers.jsonContentType,
          ));
      return response.data;
    } catch (e) {
      throw Exception("routes-employee-delete-error".i18n());
    }
  }
}
