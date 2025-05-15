import 'package:flutter/material.dart';
import 'package:login/features/login/presentation/widgets/login_text_form_field.dart';
import 'package:login/features/user/datasource/user_datasource.dart';
import 'package:login/features/user/models/user_model.dart';

import '../../../shared/controllers/theme_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State createState() => _RegisterPageState();
}

class _RegisterPageState extends State {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController(text: 'Everton');
  final _emailController = TextEditingController(text: 'everton@utfpr.edu.br');
  final _senhaController = TextEditingController(text: '123456');
  final _confirmarSenhaController = TextEditingController(text: '123456');

  void _register() async {
    if (_formKey.currentState!.validate()) {
      if (_senhaController.text != _confirmarSenhaController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('As senhas não coincidem')),
        );
        return;
      }

      // final userJson = {
      //   'nome': _nomeController.text,
      //   'email': _emailController.text,
      //   'senha': _senhaController.text,
      // };

      final userModel = UserModel(
        name: _nomeController.text,
        email: _emailController.text,
        password: _senhaController.text,
      );

      // await UserDatasource.insertUser(userJson);
      try {
        await UserDatasource.insertUser(userModel.toJson());

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registro válido!'),
            backgroundColor: Colors.green,
          ),
        );

        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pop(context);
        });
      } on Exception catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ERRO {$e}'), backgroundColor: Colors.red),
        );
      }
    }
  }

  void _goToLogin() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        ThemeController.themeModeNotifier.value == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de Registro'),
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
                controller: _nomeController,
                labelText: 'Nome',
                keyboardType: TextInputType.name,
                formFieldType: FormFieldType.text,
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              LoginTextFormField(
                controller: _confirmarSenhaController,
                labelText: 'Confirmar Senha',
                obscureText: true,
                formFieldType: FormFieldType.password,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                child: const Text('Registrar'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: _goToLogin,
                child: const Text('Já tem uma conta? Faça login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
