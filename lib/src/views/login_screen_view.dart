import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 167, left: 39, right: 39, bottom: 188),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 41),
                child: Text(
                  'login-screen-title'.i18n(),
                  style: const TextStyle(
                      fontSize: 32, color: Color.fromRGBO(7, 176, 229, 1)),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 29, right: 29, bottom: 67),
                child: SizedBox(
                  width: 300,
                  child: Text(
                    'login-screen-subtitle'.i18n(),
                    style: const TextStyle(fontSize: 24, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/admin_register');
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12))),
                      )),
                      child: Padding(
                        padding: const EdgeInsets.all(21),
                        child: Text(
                          'register'.i18n(),
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFefefef)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                        )),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/admin_login');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(21),
                        child: Text(
                          'login'.i18n(),
                          style: const TextStyle(
                              color: Color(0xFF242424), fontSize: 16),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
