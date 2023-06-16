import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DecoratedCircles extends StatelessWidget {
  const DecoratedCircles(
      {super.key, required this.correctAnswer,required this.yourAnswer, required this.questionIndex});

  final String correctAnswer;
  final String yourAnswer;
  final int questionIndex;  

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;

    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: correctAnswer == yourAnswer
            ? const Color.fromARGB(255, 117, 193, 255)
            : const Color.fromARGB(255, 255, 123, 167),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text("$questionNumber"),
    );
  }
}
