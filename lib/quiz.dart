import 'package:flutter/material.dart';
import 'package:quizz_app/models/quiz_question.dart';
import 'package:quizz_app/start_screen.dart';
import 'package:quizz_app/question_screen.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<QuizQuestion> answeredQuestion = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      startIndex = 0;
      answeredQuestion = [];
      activeScreen = 'questions-screen';
    });
  }

  int startIndex = 0;

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        question: questions[startIndex],
        onSelectAnswer: (answer) {
          answeredQuestion
              .add(questions[startIndex].setUserAnswer(answer: answer));
          if (startIndex + 1 == questions.length) {
            activeScreen = 'results-screen';
          } else {
            startIndex++;
          }
          setState(() {});
        },
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        onRestart: restartQuiz,
        answeredQuestions: answeredQuestion,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 163, 15, 168)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
