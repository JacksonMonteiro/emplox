import 'package:emplox/src/repositories/employee_repository.dart';
import 'package:flutter/material.dart';

abstract class EmployeeRegisterContract {
  start();
  loading();
  success();
  error();
  isLoadingChange();
}

class EmployeeRegisterPresenter {
  // Final and Late variables
  final state = ValueNotifier<ERegisterState>(ERegisterState.start);
  late final EmployeeRegisterContract contract;

  // Declared Variables
  bool result = false;
  bool isLoading = false;

  // Instances
  final EmployeeRepository _repository = EmployeeRepository();
  TextEditingController nameField = TextEditingController();
  TextEditingController roleField = TextEditingController();

  EmployeeRegisterPresenter(this.contract);

  register(String n, String r) async {
    state.value = ERegisterState.loading;
    isLoading = true;
    contract.isLoadingChange();
    try {
      result = await _repository.fetchEmployeeCreation(n.trim(), r.trim());
      if (result == false) {
        isLoading = false;
        contract.isLoadingChange();
        contract.success();
      }
    } catch (e) {
      state.value = ERegisterState.error;
    }
  }

  stateManagement(ERegisterState state) {
    switch (state) {
      case ERegisterState.start:
        return contract.start();
      case ERegisterState.loading:
        return contract.loading();
      case ERegisterState.error:
        return contract.error();
    }
  }
}

enum ERegisterState { start, loading, error }
