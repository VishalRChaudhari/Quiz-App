class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> shuffledAnswer() {
    final shuffledanswer = List.of(answers);
    shuffledanswer.shuffle();
    return shuffledanswer;
  }
}
