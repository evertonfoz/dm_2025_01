import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:myfinance/core/theme.dart';
import 'package:myfinance/modules/splash/splash_screen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(MyFinanceApp());

  FlutterNativeSplash.remove();
}

class MyFinanceApp extends StatelessWidget {
  const MyFinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyFinance',
      theme: AppTheme.lightTheme, // 🔹 Aplica o tema global
      darkTheme: AppTheme.darkTheme, // 🔹 Adiciona suporte para dark mode
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}
