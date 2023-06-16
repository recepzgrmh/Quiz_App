// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Screen extends StatelessWidget {
  Screen(this.firstScreen, {super.key});

  void Function() firstScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(150, 253, 253, 253),
          ),
          Container(
            padding: const EdgeInsets.only(top: 60, bottom: 25),
            child: Text(
              "Quiz App'e Hosgeldin!",
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 213, 190, 243),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () {
              firstScreen();
            },
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              "BASLA",
            ),
          ),
        ],
      ),
    );
  }
}
