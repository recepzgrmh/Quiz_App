import 'package:flutter/material.dart';
import '../data/data.dart';
import '../question_get_summary.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  ResultScreen(this.resetQuiz, {super.key, required this.answers});

  void Function() resetQuiz;
  final List<String> answers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < answers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].questions,
        "correct_answer": questions[i].answer[3],
        "choosen_answer": answers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    var numCorrectAnswers = 0;

    for (var i = 0; i < questions.length; i++) {
      if (summaryData[i]["correct_answer"] ==
          summaryData[i]["choosen_answer"]) {
        numCorrectAnswers++;
      }
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          children: [
            Text(
              "$numTotalQuestions Soru Arasından $numCorrectAnswers Tanesine Doğru Cevap Verdin!\n\n Sonuçlar",
              style: GoogleFonts.josefinSans(
                fontSize: 24,
                color: const Color.fromARGB(255, 174, 127, 255),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: resetQuiz,
              icon: const Icon(Icons.refresh),
              label: const Text("Quiz'e Yeniden Başla"),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
