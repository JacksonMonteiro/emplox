import 'package:emplox/src/repositories/admin_repository.dart';
import 'package:flutter/material.dart';

abstract class AdminRegisterContract {
  start();
  loading();
  success();
  error();
  isLoadingChange();
}

class AdminRegisterPresenter {
  // Final and Late variables
  final state = ValueNotifier<RegisterState>(RegisterState.start);
  late final AdminRegisterContract contract;

  // Declared Variables
  bool result = false;
  bool isLoading = false;

  // Instances
  final AdminRepository _repository = AdminRepository();
  TextEditingController usernameField = TextEditingController();
  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField = TextEditingController();

  AdminRegisterPresenter(this.contract);

  register(String u, String e, String p) async {
    state.value = RegisterState.loading;
    isLoading = true;
    contract.isLoadingChange();
    try {
      result =
          await _repository.fetchAdminCreation(u.trim(), e.trim(), p.trim());
      if (result == false) {
        isLoading = false;
        contract.isLoadingChange();
        contract.success();
      }
    } catch (e) {
      state.value = RegisterState.error;
    }
  }

  stateManagement(RegisterState state) {
    switch (state) {
      case RegisterState.start:
        return contract.start();
      case RegisterState.loading:
        return contract.loading();
      case RegisterState.error:
        return contract.error();
    }
  }
}

enum RegisterState { start, loading, error }
