// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore: prefer_const_literals_to_create_immutables

import 'package:emplox/src/presenters/admin_register_presenter.dart';
import 'package:flutter/material.dart';

import '../components/form_input.dart';
import '../components/return_button.dart';
import '../components/standart_button.dart';

class AdminRegisterScreen extends StatefulWidget {
  const AdminRegisterScreen({Key? key}) : super(key: key);

  @override
  State<AdminRegisterScreen> createState() => _AdminRegisterScreenState();
}

class _AdminRegisterScreenState extends State<AdminRegisterScreen>
    implements AdminRegisterContract {
  late AdminRegisterPresenter presenter;

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
    presenter = AdminRegisterPresenter(this);
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
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 37),
                child: Row(
                  children: [
                    ReturnButton(),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text('EMPLOX', style: TextStyle(fontSize: 54)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 22),
                child: FormInput(
                  placeholder: 'Nome de usuário',
                  controller: presenter.usernameField,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 22),
                child: FormInput(
                  placeholder: 'E-mail',
                  controller: presenter.emailField,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 54),
                child: FormInput(
                  placeholder: 'Senha',
                  controller: presenter.passwordField,
                ),
              ),
              StandartButton(
                action: () {
                  presenter.register(presenter.usernameField.text,
                      presenter.emailField.text, presenter.passwordField.text);
                },
                text: 'Registrar-se',
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
    Navigator.of(context).popAndPushNamed('/admin_login');
  }

  @override
  error() {
    return AlertDialog(
      title: Text('Erro'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Erro ao cadastrar-se como administrador'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Tentar novamente'),
          onPressed: () {
            presenter.state.value = RegisterState.start;
          },
        ),
      ],
    );
  }
}
