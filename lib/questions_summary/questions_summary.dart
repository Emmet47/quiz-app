import 'package:flutter/material.dart';
import 'package:quizz_app/models/quiz_question.dart';
import 'package:quizz_app/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({
    super.key,
    required this.answeredQuestions,
  });
  final List<QuizQuestion> answeredQuestions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: answeredQuestions.map(
            (data) {
              return SummaryItem(
                question: data,
                userAnswer: data.userAnswer.toString(),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
