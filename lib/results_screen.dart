import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/models/quiz_question.dart';
import 'package:quizz_app/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.answeredQuestions,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<QuizQuestion> answeredQuestions;

  @override
  Widget build(BuildContext context) {
    final List<String> correctAnswersNum = [];
    for (var i = 0; i < questions.length; i++) {
      if (questions[i].answers.first == answeredQuestions[i].userAnswer) {
        correctAnswersNum.add(i.toString());
      } else {
        continue;
      }
    }

    final numTotalQuestions = questions.length;
    int numCorrectQuestions = correctAnswersNum.length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(answeredQuestions: answeredQuestions),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
