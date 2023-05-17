import 'package:flutter/material.dart';
import 'package:quiz_new/quiz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: const ColorScheme(
              surface: Colors.blueAccent,
              onSurface: Colors.yellow,
              brightness: Brightness.light,
              primary: Color.fromARGB(255, 206, 136, 32),
              onPrimary: Color.fromARGB(255, 247, 149, 1),
              secondary: Colors.white,
              onSecondary: Colors.white,
              error: Colors.red,
              onError: Colors.red,
              background: Colors.purple,
              onBackground: Colors.black38),
        ),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Quiz();
  }
}
