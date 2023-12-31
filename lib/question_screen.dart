import 'package:flutter/material.dart';
import 'package:quizz_app/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/models/quiz_question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
    required this.question,
  });

  final void Function(String answer) onSelectAnswer;

  final QuizQuestion question;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.question.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...widget.question.getShuffeldAnswers().map(
              (answer) {
                return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    widget.onSelectAnswer(answer);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
