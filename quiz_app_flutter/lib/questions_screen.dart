import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/data/questions.dart';
import 'package:quiz_app_flutter/reusable/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[0];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentQuestion.text,
                // TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              ...currentQuestion.getShuffledAnswers().map((e) {
                return AnswerButton(
                  answerText: e,
                  onTap: () {},
                );
              })
              // AnswerButton(answerText: "Answer Text1 ...", onTap: () {}),
              // AnswerButton(answerText: "Answer Text2 ...", onTap: () {}),
              // AnswerButton(answerText: "Answer Text3 ...", onTap: () {}),
              // AnswerButton(answerText: "Answer Text4 ...", onTap: () {}),
            ]),
      ),
    );
  }
}
