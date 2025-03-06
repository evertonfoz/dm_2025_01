import 'package:flutter/material.dart';
import 'package:myfinance/modules/home/home_screen.dart';

class SplashController {
  void navigateToHome(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }
}
