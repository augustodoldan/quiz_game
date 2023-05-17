import 'package:flutter/material.dart';
import 'package:quiz_new/questions_screen.dart';
import 'package:quiz_new/start_widget.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start-widget";

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.purple,
          Color.fromARGB(255, 48, 3, 72),
        ])),
        child: activeScreen == "start-widget"
            ? StartWidget(switchScreen)
            : const QuestionsScreen(),
      ),
    ));
  }
}
