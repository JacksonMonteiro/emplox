import 'package:emplox/src/repositories/routes.dart';

class AdminRepository {
  final routes = Routes();

  Future fetchAdminLogin(String username, String password) async {
    final response = await routes.login(username, password);
    return response['auth'];
  }

  Future fetchAdminCreation(
      String username, String email, String password) async {
    final response = await routes.adminCreation(username, email, password);
    return response['error'];
  }
}
