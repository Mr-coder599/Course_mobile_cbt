import 'package:course_material_app/data/questions.dart';
import 'package:flutter/material.dart';

class ResultQuiz extends StatefulWidget {
  const ResultQuiz({Key? key}) : super(key: key);

  @override
  State<ResultQuiz> createState() => _ResultQuizState();
}

class _ResultQuizState extends State<ResultQuiz> {
  int calculateScore() {
    int score = 0;
    for (var question in questions) {
      if (question.selectedOption != null &&
          question.selectedOption!.isCorrect) {
        score++;
      }
    }
    return score;
  }

  @override
  Widget build(BuildContext context) {
    int totalQuestions = questions.length;
    int score = calculateScore();

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $score out of $totalQuestions questions correctly!',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//
//
//   return MaterialApp(
//     home:
//   );
// }
