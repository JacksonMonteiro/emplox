import 'package:emplox/src/repositories/employee_repository.dart';
import 'package:flutter/material.dart';

abstract class EmployeeUpdateContract {
  start();
  loading();
  success();
  error();
  isLoadingChange();
}

class EmployeeUpdatePresenter {
  // Final and Late variables
  final state = ValueNotifier<EUpdateState>(EUpdateState.start);
  late final EmployeeUpdateContract contract;

  // Declared Variables
  bool result = false;
  bool isLoading = false;

  // Instances
  EmployeeRepository _repository = EmployeeRepository();
  TextEditingController nameField = TextEditingController();
  TextEditingController roleField = TextEditingController();

  EmployeeUpdatePresenter(this.contract);

  update(String n, String r, int? id) async {
    state.value = EUpdateState.loading;
    isLoading = true;
    contract.isLoadingChange();
    try {
      result = await _repository.fetchUpdateEmployee(n.trim(), r.trim(), id);
      if (result == false) {
        isLoading = false;
        contract.isLoadingChange();
        contract.success();
      }
    } catch (e) {
      state.value = EUpdateState.error;
    }
  }

  stateManagement(EUpdateState state) {
    switch (state) {
      case EUpdateState.start:
        return contract.start();
      case EUpdateState.loading:
        return contract.loading();
      case EUpdateState.error:
        return contract.error();
    }
  }
}

enum EUpdateState { start, loading, error }
