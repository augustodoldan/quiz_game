import 'package:flutter/material.dart';
import 'package:quiz_new/data/questions.dart';
import 'package:quiz_new/questions_screen.dart';
import 'package:quiz_new/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenList, this.restartQuiz});

  final List<String> chosenList;
  final void Function()? restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenList.length; i++) {
      summary.add({
        "question_index": i,
        'question': randomQuestions[i].text,
        'correct_answer': randomQuestions[i].answers[0],
        'user_answer': chosenList[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = randomQuestions.length;
    final numCorrectQuestions = summaryData
        .where((element) => element['user_answer'] == element['correct_answer'])
        .length;

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Respondiste $numCorrectQuestions de $numTotalQuestions preguntas bien",
                textAlign: TextAlign.center,
                style: GoogleFonts.inconsolata(
                    color: Color.fromARGB(255, 236, 242, 245), fontSize: 22),
              ),
              const SizedBox(height: 30),
              QuestionsSummary(summaryData: getSummaryData()),
              const SizedBox(height: 30),
              TextButton.icon(
                icon: const Icon(
                  Icons.restart_alt,
                  color: Color.fromARGB(255, 241, 249, 1),
                ),
                onPressed: restartQuiz,
                label: Text(
                  "Volver a peronearla!",
                  style: GoogleFonts.inconsolata(
                      color: Color.fromARGB(255, 241, 249, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ));
  }
}
