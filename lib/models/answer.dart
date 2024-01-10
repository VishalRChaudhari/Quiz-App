import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({super.key, required this.answertext, required this.onTap});

  final String answertext;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        backgroundColor: const Color.fromARGB(255, 232, 232, 74),
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        answertext,
        textAlign: TextAlign.center,
      ),
    );
  }
}
