import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
              const EdgeInsets.only(top: 50, left: 39, right: 39, bottom: 188),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    title: Text("choose-language".tr()),
                                    actions: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              context.setLocale(
                                                  const Locale('pt', 'BR'));
                                              Navigator.pop(context);
                                            },
                                            child: Text('pt-br'.tr()),
                                          ),
                                          const SizedBox(width: 20),
                                          ElevatedButton(
                                            onPressed: () {
                                              context.setLocale(
                                                  const Locale('en', 'US'));
                                              Navigator.pop(context);
                                            },
                                            child: Text('en-us'.tr()),
                                          ),
                                        ]),
                                      ),
                                    ],
                                  ),
                              barrierDismissible: true);
                        }),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(bottom: 41),
                child: Text(
                  'login-screen-title'.tr(),
                  style: const TextStyle(
                      fontSize: 21, color: Color.fromRGBO(7, 176, 229, 1)),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 29, right: 29, bottom: 67),
                child: SizedBox(
                  width: 300,
                  child: Text(
                    'login-screen-subtitle'.tr(),
                    style: const TextStyle(fontSize: 21, color: Colors.white70),
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
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF07B0E5)),
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
                          'register'.tr(),
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
                          'login'.tr(),
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
