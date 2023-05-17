import 'package:flutter/material.dart';
import 'package:quiz_new/questions_screen.dart';
import 'package:quiz_new/start_widget.dart';
import 'package:quiz_new/data/questions.dart';
import 'package:quiz_new/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-widget";

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];

        activeScreen = "results-widget";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartWidget(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-widget') {
      screenWidget = ResultsScreen(
        chosenList: selectedAnswers,
      );
    }
    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.purple,
          Color.fromARGB(255, 48, 3, 72),
        ])),
        child: screenWidget,
      ),
    ));
  }
}
