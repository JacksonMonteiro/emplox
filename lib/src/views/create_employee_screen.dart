import 'package:emplox/src/presenters/employee_register_presenter.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../components/form_input.dart';
import '../components/return_button.dart';
import '../components/standart_button.dart';

class CreateEmployeeScreen extends StatefulWidget {
  const CreateEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<CreateEmployeeScreen> createState() => _CreateEmployeeScreenState();
}

class _CreateEmployeeScreenState extends State<CreateEmployeeScreen>
    implements EmployeeRegisterContract {
  late EmployeeRegisterPresenter presenter;
  bool validate = true;

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
    presenter = EmployeeRegisterPresenter(this);
  }

  @override
  start() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 102, bottom: 126, left: 40, right: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 37),
                child: ReturnButton(),
              ),
              Text('create-employee'.i18n(),
                  style: const TextStyle(
                      fontSize: 24,
                      color: Color(0xFF07B0E5),
                      fontWeight: FontWeight.w500)),
              Padding(
                padding: const EdgeInsets.only(bottom: 22),
                child: FormInput(
                  placeholder: 'employee-username-placeholder'.i18n(),
                  controller: presenter.nameField,
                  isPwd: false,
                  errorTxt: validate
                      ? null
                      : 'employee-username-placeholder-error'.i18n(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 22),
                child: FormInput(
                  placeholder: 'employee-role'.i18n(),
                  controller: presenter.roleField,
                  isPwd: false,
                  errorTxt: validate ? null : 'employee-role-error'.i18n(),
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
                    presenter.register(
                        presenter.nameField.text, presenter.roleField.text);
                  }
                },
                text: 'create-employee'.i18n(),
              ),
            ],
          ),
        ),
      ),
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
      title: Text('error'.i18n()),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text('create-employee-error'.i18n()),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('try-again'.i18n()),
          onPressed: () {
            presenter.state.value = ERegisterState.start;
          },
        ),
      ],
    );
  }
}
