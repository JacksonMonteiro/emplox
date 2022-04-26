import 'package:emplox/src/repositories/admin_repository.dart';
import 'package:emplox/src/repositories/routes.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final repository = AdminRepository();
  test('Must have print a Admin Login Object', () async {
    final json = await repository.fetchAdminLogin('jackson', '1234');
    if (json) {
      print('Deu certo');
    } else {
      print('Deu errado');
    }
  });

  test('Must have print a Admin Register Object', () async {
    final json = await repository.fetchAdminCreation(
        'teste', 'teste@emplox.com', '1234');
    print(json);
  });
}
