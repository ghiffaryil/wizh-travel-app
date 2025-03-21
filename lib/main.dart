import 'package:flutter/material.dart';
import 'package:wizhapp/presentation/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wizh App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 227, 242, 255),
        ),
      ),
      home: const HomePage(index: 1),
      debugShowCheckedModeBanner: false,
    );
  }
}
