import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
  });

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              color: Color.fromARGB(255, 237, 223, 252),
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          ),
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(30),
              highlightColor: const Color.fromARGB(50, 255, 255, 255),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(width: 0.6, color: Colors.grey),
                  color: Colors.transparent,
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 9, horizontal: 35),
                  child: const Text(
                    'Start Quiz',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
