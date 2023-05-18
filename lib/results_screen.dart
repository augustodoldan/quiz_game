import 'package:flutter/material.dart';
import 'package:quiz_new/data/questions.dart';
import 'package:quiz_new/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenList});

  final List<String> chosenList;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenList.length; i++) {
      summary.add({
        "question_index": i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenList[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
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
                    color: const Color.fromARGB(255, 232, 116, 220),
                    fontSize: 22),
              ),
              const SizedBox(height: 30),
              QuestionsSummary(summaryData: getSummaryData()),
              const SizedBox(height: 30),
              TextButton.icon(
                icon: const Icon(
                  Icons.restart_alt,
                  color: const Color.fromARGB(255, 232, 116, 220),
                ),
                onPressed: () {},
                label: Text(
                  "Restart quiz!",
                  style: GoogleFonts.inconsolata(
                      color: const Color.fromARGB(255, 232, 116, 220),
                      fontSize: 20),
                ),
              )
            ],
          ),
        ));
  }
}
