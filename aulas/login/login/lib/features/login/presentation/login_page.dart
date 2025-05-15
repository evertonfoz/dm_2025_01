import 'package:flutter/material.dart';
import 'package:login/features/login/datasource/login_datasource.dart';
import 'package:login/features/login/presentation/widgets/login_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  bool _lembrarDeMim = false;

  @override
  void initState() {
    super.initState();
    _loadRememberedEmail();
  }

  Future<void> _loadRememberedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email');
    final savedPassword = prefs.getString('senha');
    if (savedEmail != null) {
      setState(() {
        _emailController.text = savedEmail;
        _senhaController.text = savedPassword ?? '';
        _lembrarDeMim = true;
      });
    }
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      var result = await LoginDatasource.login(
        _emailController.text,
        _senhaController.text,
      );

      if (result == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login inválido!'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        // Navegar para a tela inicial
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('Login válido!'),
        //     backgroundColor: Colors.green,
        //   ),
        // );

        final prefs = await SharedPreferences.getInstance();
        if (_lembrarDeMim) {
          await prefs.setString('email', _emailController.text);
          await prefs.setString('senha', _senhaController.text);
        } else {
          await prefs.remove('email');
          await prefs.remove('senha');
        }

        Navigator.pushReplacementNamed(context, '/home');
      }
    }
  }

  void _goToRegister() {
    Navigator.pushNamed(context, '/register');
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
              CheckboxListTile(
                title: const Text('Lembrar de mim'),
                value: _lembrarDeMim,
                onChanged: (value) {
                  setState(() {
                    _lembrarDeMim = value ?? false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
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
