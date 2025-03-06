import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyScaffoldApp());
}

class MyScaffoldApp extends StatelessWidget {
  const MyScaffoldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Scaffold App",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
