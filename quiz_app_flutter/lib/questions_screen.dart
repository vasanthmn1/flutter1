import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_flutter/data/questions.dart';
import 'package:quiz_app_flutter/reusable/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(currentQuestion.text,
                  // TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(color: Colors.white)),
              const SizedBox(
                height: 30,
              ),
              ...currentQuestion.getShuffledAnswers().map((answer) {
                return AnswerButton(
                    answerText: answer,
                    onTap: () {
                      answerQuestion(answer);
                    }
                    // print("ad");

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
