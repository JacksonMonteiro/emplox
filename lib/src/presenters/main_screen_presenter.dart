import 'package:emplox/src/models/employee_model.dart';
import 'package:emplox/src/repositories/employee_repository.dart';
import 'package:flutter/cupertino.dart';

abstract class MainScreenContract {
  success();
  error();
  isLoadingChange();
  loading();
}

class MainScreenPresenter {
  bool result = false;
  bool isLoading = false;

  final MainScreenContract contract;
  final state = ValueNotifier<MainState>(MainState.error);
  final deleteState = ValueNotifier<EDeleteState>(EDeleteState.start);

  List<EmployeeModel> employees = [];
  final EmployeeRepository _repository = EmployeeRepository();

  // Constructor
  MainScreenPresenter(this.contract);

  start() async {
    try {
      employees = await _repository.fetchEmployees();
      if (employees.isNotEmpty) {
        state.value = MainState.success;
      }
    } catch (e) {
      state.value = MainState.error;
    }
  }

  delete(int? id) async {
    state.value = MainState.loading;
    isLoading = true;
    contract.isLoadingChange();
    try {
      result = await _repository.fetchDeleteEmployee(id);
      if (result == false) {
        isLoading = false;
        contract.isLoadingChange();
        start();
      }
    } catch (e) {
      deleteState.value = EDeleteState.error;
    }
  }

  stateManagement(MainState state) {
    switch (state) {
      case MainState.success:
        return contract.success();
      case MainState.loading:
        return contract.loading();
      case MainState.error:
        return contract.error();
    }
  }
}

enum MainState { success, loading, error }
enum EDeleteState { start, error }
