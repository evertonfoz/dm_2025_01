import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyFinance"),
        // backgroundColor:
        //     Theme.of(
        //       context,
        //     ).colorScheme.primary, // Azul profundo da identidade
      ),
      body: Center(
        child: Text(
          "Bem-vindo ao MyFinance!",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
