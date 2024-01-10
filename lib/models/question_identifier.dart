import 'package:flutter/material.dart';

class Questionidentifier extends StatelessWidget {
  const Questionidentifier(
      {required this.isCorrect, required this.questionindex, super.key});

  final int questionindex;
  final bool isCorrect;
  @override
  Widget build(BuildContext context) {
    final questinoNum = questionindex + 1;
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrect 
        ? Colors.lightBlue 
        : Colors.pink,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questinoNum.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
