// ignore_for_file: no_logic_in_create_state

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../components/form_input.dart';
import '../components/return_button.dart';
import '../components/standart_button.dart';
import '../presenters/employee_update_presenter.dart';

class UpdateEmployeeScreen extends StatefulWidget {
  final int? employeeId;
  final String? employeeName;
  final String? employeeRole;

  const UpdateEmployeeScreen(
      {Key? key, this.employeeId, this.employeeName, this.employeeRole})
      : super(key: key);

  @override
  State<UpdateEmployeeScreen> createState() =>
      UpdateEmployeeScreenState(employeeId, employeeName, employeeRole);
}

class UpdateEmployeeScreenState extends State<UpdateEmployeeScreen>
    implements EmployeeUpdateContract {
  late EmployeeUpdatePresenter presenter;

  final int? id;
  final String? name;
  final String? role;

  bool validate = true;

  UpdateEmployeeScreenState(this.id, this.name, this.role);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: presenter.state,
        builder: (context, child) =>
            presenter.stateManagement(presenter.state.value),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    presenter = EmployeeUpdatePresenter(this);
  }

  @override
  start() {
    return ListView(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 102, bottom: 126, left: 40, right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 37),
                  child: ReturnButton(),
                ),
                Text('update-employee-title'.tr(),
                    style: const TextStyle(
                        fontSize: 24,
                        color: Color(0xFF07B0E5),
                        fontWeight: FontWeight.w500)),
                Padding(
                  padding: const EdgeInsets.only(bottom: 22),
                  child: FormInput(
                    placeholder: 'employee-username-placeholder'.tr(),
                    controller: presenter.nameField,
                    isPwd: false,
                    errorTxt: validate
                        ? null
                        : 'employee-username-placeholder-error'.tr(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 22),
                  child: FormInput(
                    placeholder: 'employee-role'.tr(),
                    controller: presenter.roleField,
                    isPwd: false,
                    errorTxt: validate ? null : 'employee-role-error'.tr(),
                  ),
                ),
                StandartButton(
                  action: () {
                    if (presenter.nameField.text.isEmpty) {
                      validate = false;
                    } else if (presenter.roleField.text.isEmpty) {
                      validate = false;
                    } else {
                      validate = true;
                      presenter.update(presenter.nameField.text,
                          presenter.roleField.text, id);
                    }
                  },
                  text: 'update-employee-title'.tr(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  loading() {
    return Center(
        child: presenter.isLoading
            ? const CircularProgressIndicator()
            : Container());
  }

  @override
  isLoadingChange() {
    setState(() {});
  }

  @override
  success() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/main', (Route<dynamic> route) => false);
  }

  @override
  error() {
    return AlertDialog(
      title: Text('error'.tr()),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text('update-employee-error'.tr()),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('try-again'.tr()),
          onPressed: () {
            presenter.state.value = EUpdateState.start;
          },
        ),
      ],
    );
  }
}
