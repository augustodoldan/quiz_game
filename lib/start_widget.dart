import 'package:flutter/material.dart';

class StartWidget extends StatelessWidget {
  const StartWidget(
    this.switchScreen, {
    super.key,
  });

  final void Function()? switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png',
              width: 300, color: const Color.fromARGB(205, 134, 132, 178)),
          const SizedBox(
            height: 80,
          ),
          const Text(
            "Learn flutter the fun way!",
            style: TextStyle(
                color: Color.fromARGB(255, 203, 163, 210), fontSize: 24),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
              icon: const Icon(Icons.arrow_circle_right_rounded),
              onPressed: switchScreen,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              label: const Text(
                "Empezar quiz!",
              ))
        ],
      ),
    );
  }
}
