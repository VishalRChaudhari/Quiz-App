import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/models/answer.dart';
import 'package:adv_basics/models/question_data.dart';

class Questions extends StatefulWidget {
 const Questions({super.key,required this.onSelect});
  final void Function(String answer) onSelect ;
  @override
  State<Questions> createState() {
    return _Questions();
  }
}

class _Questions extends State<Questions> {
  var currentQuestionIndex = 0;
  void onTap(String selectedAnswer) {
    widget.onSelect(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentquestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentquestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            ...currentquestion.shuffledAnswer().map(
              (answer) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Answer(answertext: answer, onTap: () {
                    onTap(answer);
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
