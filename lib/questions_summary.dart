import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({
    super.key,
    this.summaryData,
  });

  final List<Map<String, Object>>? summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData!.map((answer) {
            bool answerOk = answer['correct_answer'] == answer['user_answer'];
            return Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: answerOk
                        ? Color.fromARGB(255, 7, 233, 245)
                        : Colors.pink,
                  ),
                  child: Text(
                    ((answer['question_index'] as int) + 1).toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        answer['question'].toString(),
                        style: GoogleFonts.inconsolata(
                          color: const Color.fromARGB(255, 232, 116, 220),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Tu respuesta: ${answer['user_answer'].toString()}",
                        style: GoogleFonts.inconsolata(
                            fontSize: 18,
                            color: const Color.fromARGB(187, 255, 255, 255)),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Respuesta correcta: ${answer['correct_answer'].toString()}",
                        style: GoogleFonts.inconsolata(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 244, 246, 135),
                        ),
                      ),
                      const Divider(
                        height: 20,
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                        color: Color.fromRGBO(198, 3, 216, 0.663),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
