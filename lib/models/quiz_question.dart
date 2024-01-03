class QuizQuestion {
  const QuizQuestion(this.text, this.answers, {this.userAnswer});
  final String text;
  final List<String> answers;
  final String? userAnswer;

  List<String> getShuffeldAnswers() {
    final shuffeldList = List.of(answers);
    shuffeldList.shuffle();
    return shuffeldList;
  }

  QuizQuestion setUserAnswer({required String answer}) {
    return QuizQuestion(
      text,
      answers,
      userAnswer: answer,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'answers': answers,
      'userAnswer': userAnswer,
    };
  }
}
