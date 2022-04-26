import 'package:emplox/src/presenters/employee_register_presenter.dart';
import 'package:emplox/src/presenters/main_screen_presenter.dart';
import 'package:flutter/material.dart';

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
          padding: EdgeInsets.only(top: 102, bottom: 126, left: 40, right: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 37),
                child: ReturnButton(),
              ),
              Text('Cadastrar funcionário',
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF07B0E5),
                      fontWeight: FontWeight.w500)),
              Padding(
                padding: const EdgeInsets.only(bottom: 22),
                child: FormInput(
                  placeholder: 'Nome do funcionário',
                  controller: presenter.nameField,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 22),
                child: FormInput(
                  placeholder: 'Função do funcionário',
                  controller: presenter.roleField,
                ),
              ),
              StandartButton(
                action: () {
                  presenter.register(
                      presenter.nameField.text, presenter.roleField.text);
                },
                text: 'Cadastrar Funcionário',
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
        child: presenter.isLoading ? CircularProgressIndicator() : Container());
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
      title: Text('Erro'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Erro ao cadastrar funcinário no sistema'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Tentar novamente'),
          onPressed: () {
            presenter.state.value = ERegisterState.start;
          },
        ),
      ],
    );
  }
}