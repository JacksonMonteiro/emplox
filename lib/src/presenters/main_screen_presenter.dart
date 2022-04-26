import 'package:emplox/src/models/employee_model.dart';
import 'package:emplox/src/repositories/employee_repository.dart';
import 'package:flutter/cupertino.dart';

abstract class MainScreenContract {
  success();
  error();
}

class MainScreenPresenter {
  bool isLoading = false;

  final MainScreenContract contract;
  final state = ValueNotifier<MainState>(MainState.start);

  List<EmployeeModel> employees = [];
  EmployeeRepository _repository = EmployeeRepository();

  // Constructor
  MainScreenPresenter(this.contract);

  start() async {
    state.value = MainState.loading;
    isLoading = true;
    try {
      employees = await _repository.fetchEmployees();
      if (employees.length > 0) {
        isLoading = false;
        state.value = MainState.success;
      }
    } catch (e) {
      state.value = MainState.error;
    }
  }

  stateManagement(MainState state) {
    switch (state) {
      case MainState.success:
        return contract.success();
      case MainState.error:
        return contract.error();
    }
  }
}

enum MainState { start, success, loading, error }
