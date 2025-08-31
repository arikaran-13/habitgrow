import 'package:flutter/material.dart';
import 'package:habitgrow/screens/home/home_screen.dart';
import 'package:habitgrow/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: primaryTheme,
    );
  }
}
