import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/data/questions.dart';
import 'package:quiz_app_flutter/questions_screen.dart';
import 'package:quiz_app_flutter/result_screen.dart';
import 'package:quiz_app_flutter/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  String activeScreen = 'start';

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
        // selectedAnswer = [];
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "question-screen") {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == "result-screen") {
      setState(() {
        screenWidget = ResultScreen(
          chooseAnswer: selectedAnswer,
          onRestart: restartQuiz,
        );
      });
    }
    return MaterialApp(
      title: 'Flutter Demo ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 162, 5, 235),
          Color.fromARGB(221, 21, 35, 228)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),

        child: screenWidget,
        // child: activeScreen == "start"
        //     ? screenWidget
        //     : QuestionsScreen(
        //         onSelectAnswer: chooseAnswer,
        //       ),
      )),
    );
  }
}
