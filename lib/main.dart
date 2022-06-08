import 'package:emplox/src/views/admin_login_screen.dart';
import 'package:emplox/src/views/admin_register_screen.dart';
import 'package:emplox/src/views/create_employee_screen.dart';
import 'package:emplox/src/views/login_screen_view.dart';
import 'package:emplox/src/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'app-title'.i18n(),
      theme: ThemeData(
          fontFamily: 'Tomorrow',
          primarySwatch: Colors.blue,
          brightness: Brightness.dark),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/admin_register': (context) => const AdminRegisterScreen(),
        '/admin_login': (context) => const AdminLoginScreen(),
        '/main': (context) => const MainViewScreen(),
        '/employee_register': (context) => const CreateEmployeeScreen(),
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        LocalJsonLocalization.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
    );
  }
}
