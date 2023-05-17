import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenList});

  final List<String> chosenList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Respondiste x de Y preguntas bien"),
              const SizedBox(height: 30),
              const Text("Listado de respuestas"),
              const SizedBox(height: 30),
              TextButton(onPressed: () {}, child: const Text("Restart quiz!"))
            ],
          ),
        ));
  }
}
