import 'package:emplox/src/components/form_input.dart';
import 'package:emplox/src/components/return_button.dart';
import 'package:emplox/src/components/standart_button.dart';
import 'package:flutter/material.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
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
                child: FormInput(placeholder: 'Nome de usuário'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 54),
                child: FormInput(placeholder: 'Senha'),
              ),
              StandartButton(
                route: '/',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
