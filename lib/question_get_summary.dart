import 'package:flutter/material.dart';
import 'decorated_circles.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(
    this.summaryData, {
    super.key,
  });

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((data) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedCircles(
                  correctAnswer: data["correct_answer"] as String,
                  yourAnswer: data["choosen_answer"] as String,
                  questionIndex: data["question_index"] as int),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["question"] as String,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 179, 157, 240),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      data["correct_answer"] as String,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 219, 77, 212)),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      data["choosen_answer"] as String,
                      style: const TextStyle(color: Colors.cyan),
                    ),
                    const SizedBox(height: 15,)
                  ],
                ),
              ),
            ],
          );
        }).toList()),
      ),
    );
  }
}
