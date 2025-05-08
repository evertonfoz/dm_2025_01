import 'package:flutter/material.dart';
import 'package:login/shared/controllers/theme_controller.dart';

import 'features/login/presentation/login_page.dart';
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
          home: const LoginPage(),
        );
      },
    );
  }
}
