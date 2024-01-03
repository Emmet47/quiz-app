import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/models/quiz_question.dart';
import 'package:quizz_app/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({
    super.key,
    required this.question,
    required this.userAnswer,
  });

  final QuizQuestion question;
  final String userAnswer;

  @override
  Widget build(BuildContext context) {
    final QuizQuestion whereQuestion =
        questions.firstWhere((e) => question.text == e.text);

    final int indexOf = questions.indexOf(whereQuestion);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer: question.answers.first ==
                userAnswer, //true veya false dönürüyor. Ve çalışıyor.
            questionIndex: indexOf,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.text,
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  userAnswer,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 202, 171, 252),
                  ),
                ),
                Text(
                  question.answers.first,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 181, 254, 246),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
