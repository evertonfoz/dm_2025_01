import 'package:flutter/material.dart';
import 'dart:async';
import 'splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final SplashController _splashController = SplashController();
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isAnimationInitialized = false; // Flag para verificar inicialização

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
    _isAnimationInitialized = true; // Marca como inicializado

    // Aguarda a animação terminar antes de navegar
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        _splashController.navigateToHome(context);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:
      //     Theme.of(
      //       context,
      //     ).colorScheme.primary, // 🔹 Usa a cor primária do tema
      body: Center(
        child:
            _isAnimationInitialized // Verifica se _animation foi inicializado
                ? FadeTransition(
                  opacity: _animation,
                  child: Image.asset("assets/images/logo.png", width: 150),
                )
                : Container(), // Retorna um container vazio até a inicialização
      ),
    );
  }
}
