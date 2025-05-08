import 'package:flutter/material.dart';
import 'package:login/features/login/presentation/widgets/login_text_form_field.dart';

import '../../../shared/controllers/theme_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Aqui vamos autenticar no próximo capítulo
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login válido!')));
    }
  }

  void _goToRegister() {
    // Navegar para a tela de registro
  }

  void _goToForgotPassword() {
    // Navegar para a tela de recuperação
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        ThemeController.themeModeNotifier.value == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de Login'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
            tooltip: 'Alternar Tema',
            onPressed: () {
              setState(() {
                ThemeController.toggleTheme();
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            children: [
              LoginTextFormField(
                controller: _emailController,
                labelText: 'E-Mail',
                keyboardType: TextInputType.emailAddress,
                formFieldType: FormFieldType.email,
              ),
              const SizedBox(height: 20),
              LoginTextFormField(
                controller: _senhaController,
                labelText: 'Senha',
                obscureText: true,
                formFieldType: FormFieldType.password,
              ),
              // TextFormField(
              //   controller: _senhaController,
              //   decoration: const InputDecoration(labelText: 'Senha'),
              //   obscureText: true,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Informe sua senha';
              //     }
              //     return null;
              //   },
              // ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _login, child: const Text('Entrar')),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: _goToForgotPassword,
                    child: const Text('Esqueci minha senha'),
                  ),
                  TextButton(
                    onPressed: _goToRegister,
                    child: const Text('Registrar-se'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
