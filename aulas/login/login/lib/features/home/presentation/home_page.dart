import 'package:flutter/material.dart';
import '../../../shared/controllers/theme_controller.dart';
import '../../login/presentation/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false, // Remove todas as rotas anteriores
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        ThemeController.themeModeNotifier.value == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Inicial'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
            tooltip: 'Alternar Tema',
            onPressed: () {
              ThemeController.toggleTheme();
            },
          ),

          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sair',
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Bem-vindo(a)!',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
