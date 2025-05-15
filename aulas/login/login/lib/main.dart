import 'package:flutter/material.dart';
import 'package:login/shared/controllers/theme_controller.dart';

import 'features/home/presentation/home_page.dart';
import 'features/login/presentation/login_page.dart';
import 'features/register/presentation/register.dart';
import 'shared/themes/dark_theme.dart';
import 'shared/themes/light_theme.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeController.themeModeNotifier,
      builder: (context, themeMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Login App',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginPage(),
            '/register': (context) => const RegisterPage(),
            '/home':
                (context) => const HomePage(), // Passar o nome do usuário aqui
          },
          // home: const LoginPage(),
        );
      },
    );
  }
}
