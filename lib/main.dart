import 'package:emplox/src/views/admin_login_screen.dart';
import 'package:emplox/src/views/admin_register_screen.dart';
import 'package:emplox/src/views/create_employee_screen.dart';
import 'package:emplox/src/views/login_screen_view.dart';
import 'package:emplox/src/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('pt', 'BR')],
      path: 'lib/i18n',
      fallbackLocale: const Locale('pt', 'BR'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'app-title'.tr(),
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Tomorrow',
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF07B0E5), brightness: Brightness.dark),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/admin_register': (context) => const AdminRegisterScreen(),
        '/admin_login': (context) => const AdminLoginScreen(),
        '/main': (context) => const MainViewScreen(),
        '/employee_register': (context) => const CreateEmployeeScreen(),
      },
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
