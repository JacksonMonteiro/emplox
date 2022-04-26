import 'package:emplox/src/repositories/admin_repository.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginScreenContract {
  start();
  loading();
  success();
  error();
  isLoadingChange();
}

class LoginScreenPresenter {
  bool result = false;
  bool isLoading = false;

  AdminRepository _repository = AdminRepository();

  final state = ValueNotifier<LoginState>(LoginState.start);
  late final LoginScreenContract contract;

  TextEditingController usernameField = TextEditingController();
  TextEditingController passwordField = TextEditingController();

  LoginScreenPresenter(this.contract);

  login(String usr, String pwd) async {
    state.value = LoginState.loading;
    isLoading = true;
    contract.isLoadingChange();
    try {
      result = await _repository.fetchAdminLogin(usr.trim(), pwd.trim());
      if (result) {
        isLoading = false;
        contract.isLoadingChange();
        contract.success();
      }
    } catch (e) {
      state.value = LoginState.error;
    }
  }

  stateManagement(LoginState state) {
    switch (state) {
      case LoginState.start:
        return contract.start();
      case LoginState.loading:
        return contract.loading();
      case LoginState.error:
        return contract.error();
    }
  }
}

enum LoginState { start, loading, error }
