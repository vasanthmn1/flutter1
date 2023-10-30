import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            // 'assets/images/quiz-logo.png',
            width: 300,
            height: 300,

            color: Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Learn Flutter With Quiz",
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 40,
          ),
          OutlinedButton.icon(
            icon: Icon(Icons.arrow_right_alt),
            onPressed: () {
              startQuiz();
            },
            label: const Text("Click"),
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white, foregroundColor: Colors.blue),
          )
        ],
      ),
    );
  }
}
