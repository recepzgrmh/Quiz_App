import 'package:flutter/material.dart';
import 'package:quiz_app/data/data.dart';
import 'package:quiz_app/secreens/question_secreen.dart';
import 'package:quiz_app/secreens/result_screen.dart';
import 'Screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];

  var activeScreen = 'Start_Screen';

  void switchScreen() {
    setState(() {
      activeScreen = "Question_screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'Result_Screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'Start_Screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget secreenWidget = Screen(switchScreen);

    if (activeScreen == "Question_screen") {
      secreenWidget = QuestionScreen(
        onSelectedAnswer: chooseAnswer,
      );
    } else if (activeScreen == "Result_Screen") {
      secreenWidget = ResultScreen(restartQuiz, answers: selectedAnswer);
      selectedAnswer = [];
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 200),
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 108, 29, 172),
              Color.fromARGB(255, 108, 29, 172),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: secreenWidget,
        ),
      ),
    );
  }
}
