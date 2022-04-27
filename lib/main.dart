import 'package:emplox/src/views/admin_login_screen.dart';
import 'package:emplox/src/views/admin_register_screen.dart';
import 'package:emplox/src/views/create_employee_screen.dart';
import 'package:emplox/src/views/login_screen_view.dart';
import 'package:emplox/src/views/main_view.dart';
import 'package:flutter/material.dart';

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
      title: 'Emplox',
      theme: ThemeData(
          fontFamily: 'Tomorrow',
          primarySwatch: Colors.blue,
          brightness: Brightness.dark),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/admin_register': (context) => AdminRegisterScreen(),
        '/admin_login': (context) => AdminLoginScreen(),
        '/main': (context) => MainViewScreen(),
        '/employee_register': (context) => CreateEmployeeScreen(),
      },
    );
  }
}
