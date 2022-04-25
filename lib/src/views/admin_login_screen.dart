// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:emplox/src/components/form_input.dart';
import 'package:emplox/src/components/return_button.dart';
import 'package:emplox/src/components/standart_button.dart';
import 'package:emplox/src/presenters/login_screen_presenter.dart';
import 'package:flutter/material.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({Key? key}) : super(key: key);

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen>
    implements LoginScreenContract {
  late LoginScreenPresenter presenter;

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
    presenter = LoginScreenPresenter(this);
  }

  @override
  start() {
    return SizedBox(
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
              padding: const EdgeInsets.only(bottom: 54),
              child: FormInput(
                placeholder: 'Senha',
                controller: presenter.passwordField,
              ),
            ),
            StandartButton(action: () {
              presenter.login(
                  presenter.usernameField.text, presenter.passwordField.text);
            }),
          ],
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
    Navigator.of(context).pushNamed('/main');
  }

  @override
  error() {
    return AlertDialog(
      title: Text('Erro'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Usuário ou senha incorretos'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Tentar novamente'),
          onPressed: () {
            presenter.state.value = LoginState.start;
          },
        ),
      ],
    );
  }
}
