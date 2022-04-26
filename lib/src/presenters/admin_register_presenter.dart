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
  late final contract;
  final state = ValueNotifier<RegisterState>(RegisterState.start);

  // Declared Variables
  bool result = false, isLoading = false;

  // Instances
  AdminRepository _repository = AdminRepository();
  TextEditingController usernameField = TextEditingController();
  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField = TextEditingController();

  AdminRegisterPresenter(this.contract);

  register(String u, String e, String p) async {
    state.value = RegisterState.loading;
    isLoading = true;
    contract.isLoadingChange();
    try {
      result = await _repository.fetchAdminCreation(u, e, p);
      if (result) {
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
