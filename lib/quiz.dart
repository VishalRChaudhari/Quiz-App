import 'package:adv_basics/models/question_data.dart';
import 'package:adv_basics/models/results_screeen.dart';
import 'package:adv_basics/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _Quizstate();
  }
}

class _Quizstate extends State<Quiz> {
  //Widget? activeScreen; for init func
  List<String> selectedAnswer = [];
  var activeScreen = 'activescreen';

  /* void initState() {
    activeScreen =  Mainscreen(switchScreen);DWAWWWD
    super.initState();
  }*/
  void switchScreen() {
    setState(() {
      activeScreen = 'questionscreen';
    });
  }

  void chosenAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'resultScreen';
      });
    }
  }

  void restartQuiz()
  {
    setState(() {
      selectedAnswer = [];
      activeScreen =  'questionscreen';   });
  }
  

  @override
  Widget build(context) {
    /*var screenWidget =  activeScreen == 'activescreen'
              ? Mainscreen(switchScreen)
              : const Questions();*/
    //Alternate

    Widget screenWidget = Mainscreen(switchScreen);

    if (activeScreen == 'questionscreen') {
      screenWidget = Questions(onSelect: chosenAnswer);
    }
    if (activeScreen == 'resultScreen') {
      screenWidget = ResultScreen(chosenAnswers: selectedAnswer,onRestart: restartQuiz);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 101, 11, 149),
                Color.fromARGB(255, 70, 0, 121),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
