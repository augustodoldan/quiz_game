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

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length >= 5) {
      setState(() {
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
      screenWidget =
          ResultsScreen(chosenList: selectedAnswers, restartQuiz: restartQuiz);
    }
    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 4, 91, 191),
          Color.fromARGB(255, 31, 132, 168),
        ])),
        child: screenWidget,
      ),
    ));
  }
}
