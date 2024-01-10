import 'package:adv_basics/models/question_data.dart';
import 'package:adv_basics/models/summery_data.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
   const ResultScreen({super.key, required this.chosenAnswers,required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> summaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'Question Index': i,
          'Question': questions[i].text,
          'Correct Answer': questions[i].answers[0],
          'User Answer ': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summarydata = summaryData();
    final totalAns = questions.length;
    final correctAns = summarydata.where(
      (data) {
        return data['User Answer '] == data['Correct Answer'];
      },
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have Answered $correctAns out of $totalAns answers !',
              style: const TextStyle(
                  color: Color.fromARGB(255, 198, 164, 210),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionSummery(summarydata),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.restart_alt_outlined),
              label: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
