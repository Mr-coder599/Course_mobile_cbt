import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../data/questions.dart';

class Option {
  final String code;
  final String text;
  final bool isCorrect;

  Option({required this.code, required this.text, required this.isCorrect});
}

class Question {
  final String text;
  final List<Option> options;
  final String solution;

  Question({required this.text, required this.options, required this.solution});
}

final class ndquestions extends StatelessWidget {
  ndquestions({Key? key}) : super(key: key);
//question methods

  final List<Question> questions = [
    Question(
      text: 'Atom consists of the following except?',
      options: [
        Option(code: 'A', text: 'proton', isCorrect: false),
        Option(code: 'B', text: 'electron', isCorrect: false),
        Option(code: 'C', text: 'nucleus', isCorrect: false),
        Option(code: 'D', text: 'Electrolyte', isCorrect: true),
      ],
      solution: 'Electrolyte',
    ),
    Question(
      text: 'The S.I unit of mass is _____',
      options: [
        Option(code: 'A', text: 'meter', isCorrect: false),
        Option(code: 'B', text: 'kilogram', isCorrect: true),
        Option(code: 'C', text: 'newton', isCorrect: false),
        Option(code: 'D', text: 'pound', isCorrect: false),
      ],
      solution: 'kilogram',
    ),
    Question(
      text:
          'The instrument that can be used to correct short sightedness is ________',
      options: [
        Option(code: 'A', text: 'converging mirror', isCorrect: false),
        Option(code: 'B', text: 'converging lens', isCorrect: false),
        Option(code: 'C', text: 'diverging lens', isCorrect: true),
        Option(code: 'D', text: 'plane mirror', isCorrect: false),
      ],
      solution: 'diverging lens',
    ),
    Question(
      text: 'symbol of lead is _____________',
      options: [
        Option(code: 'A', text: 'Ld', isCorrect: false),
        Option(code: 'B', text: 'Pb', isCorrect: true),
        Option(code: 'C', text: 'Ag', isCorrect: false),
        Option(code: 'D', text: 'Au', isCorrect: false),
      ],
      solution: 'Pb',
    ),
    Question(
      text: 'The S.I unit of mass is _____',
      options: [
        Option(code: 'A', text: 'meter', isCorrect: false),
        Option(code: 'B', text: 'kilogram', isCorrect: true),
        Option(code: 'C', text: 'newton', isCorrect: false),
        Option(code: 'D', text: 'pound', isCorrect: false),
      ],
      solution: 'kilogram',
    ),
    Question(
      text: 'The instrument for measuring Rainfall is',
      options: [
        Option(code: 'A', text: 'thermometer', isCorrect: false),
        Option(code: 'B', text: 'anometer', isCorrect: false),
        Option(code: 'C', text: 'rain guage', isCorrect: true),
        Option(code: 'D', text: 'weather guage', isCorrect: false),
      ],
      solution: 'rain guage',
    ),
    Question(
      text: 'The instrument for measuring Rainfall is',
      options: [
        Option(code: 'A', text: 'thermometer', isCorrect: false),
        Option(code: 'B', text: 'anometer', isCorrect: false),
        Option(code: 'C', text: 'rain guage', isCorrect: true),
        Option(code: 'D', text: 'weather guage', isCorrect: false),
      ],
      solution: 'rain guage',
    ),
    Question(
      text:
          'A simple unicellular organism which lives in pond and reproduces by binary fission is',
      options: [
        Option(code: 'A', text: 'chlamydomnas', isCorrect: false),
        Option(code: 'B', text: 'mucor', isCorrect: false),
        Option(code: 'C', text: 'amoeba', isCorrect: true),
        Option(code: 'D', text: 'Yeast', isCorrect: false),
      ],
      solution: 'amoeba',
    ),
    Question(
      text: 'The instrument for measuring Rainfall is',
      options: [
        Option(code: 'A', text: 'thermometer', isCorrect: false),
        Option(code: 'B', text: 'anometer', isCorrect: false),
        Option(code: 'C', text: 'rain guage', isCorrect: true),
        Option(code: 'D', text: 'weather guage', isCorrect: false),
      ],
      solution: 'rain guage',
    ),
    Question(
      text:
          'The workdone in raising a load of 6.00kg of iron ore to the surface from a depth of 90m is _________',
      options: [
        Option(code: 'A', text: '54J’', isCorrect: true),
        Option(code: 'B', text: '5400J’', isCorrect: false),
        Option(code: 'C', text: '5.4J', isCorrect: false),
        Option(code: 'D', text: '540J', isCorrect: false),
      ],
      solution: 'rain guage',
    ),
    Question(
      text: 'which of the following is a balanced equation?',
      options: [
        Option(
            code: 'A', text: 'NaOH + H2SO ----- NaSO4 + H2O', isCorrect: false),
        Option(
            code: 'B',
            text: '2NaOH + H2SO4 ----- Na2SO2 + 2H2O',
            isCorrect: true),
        Option(
            code: 'C', text: 'NaOH + H2SO4 ------ NaSO +H2O', isCorrect: false),
        Option(
            code: 'D',
            text: 'NaOH +H2SO4 2 ----- NaSO4 + 2H2O',
            isCorrect: false),
      ],
      solution: 'rain guage',
    ),
    Question(
      text:
          'A change of state where a substance changes directly from solid to gas is',
      options: [
        Option(code: 'A', text: 'vapourization’’', isCorrect: false),
        Option(code: 'B', text: 'Boiling’’', isCorrect: false),
        Option(code: 'C', text: 'Sublimation’', isCorrect: true),
        Option(code: 'D', text: 'Melting', isCorrect: false),
      ],
      solution: 'Sublimation',
    ),
    Question(
      text: 'One of the elements below is a non-metal',
      options: [
        Option(code: 'A', text: 'mercury', isCorrect: false),
        Option(code: 'B', text: 'Liver', isCorrect: false),
        Option(code: 'C', text: 'carbon', isCorrect: true),
        Option(code: 'D', text: 'lead', isCorrect: false),
      ],
      solution: 'carbon',
    ),
    Question(
      text: 'The part of ear responsible for hearing is ______________',
      options: [
        Option(code: 'A', text: 'cochlea', isCorrect: true),
        Option(code: 'B', text: 'Pinna', isCorrect: false),
        Option(code: 'C', text: 'Ossicle', isCorrect: false),
        Option(code: 'D', text: 'ear drum', isCorrect: false),
      ],
      solution: 'cochlea',
    ),
    Question(
      text: 'Energy from sun is ________________ energy',
      options: [
        Option(code: 'A', text: 'Kinetic’', isCorrect: false),
        Option(code: 'B', text: 'Radiant’', isCorrect: true),
        Option(code: 'C', text: 'Potential', isCorrect: false),
        Option(code: 'D', text: 'Electrical', isCorrect: false),
      ],
      solution: 'Radiant',
    ),
    Question(
      text: 'An example of a chemical change is _______',
      options: [
        Option(code: 'A', text: 'melting of ice', isCorrect: false),
        Option(code: 'B', text: 'dissolution of salt water', isCorrect: false),
        Option(code: 'C', text: 'rusting of iron', isCorrect: true),
        Option(code: 'D', text: 'magnetization of blade', isCorrect: false),
      ],
      solution: 'rusting of iron',
    ),
    Question(
      text: 'Which of the following substance is an insulator',
      options: [
        Option(code: 'A', text: 'iron', isCorrect: false),
        Option(code: 'B', text: 'Zinc', isCorrect: false),
        Option(code: 'C', text: 'rubber', isCorrect: true),
        Option(code: 'D', text: 'Silver', isCorrect: false),
      ],
      solution: 'rubber',
    ),
    Question(
      text:
          'A gas explode (slight explosion) with a top sound when a burning splint is introduced to it. This confirms __________',
      options: [
        Option(code: 'A', text: 'Nitrogen', isCorrect: false),
        Option(code: 'B', text: 'Carbon', isCorrect: false),
        Option(code: 'C', text: 'Hydrogen', isCorrect: true),
        Option(code: 'D', text: 'Oxygen', isCorrect: false),
      ],
      solution: 'Hydrogen',
    ),
    Question(
      text:
          'Radioactive decay emits the following particles except ____________',
      options: [
        Option(code: 'A', text: 'Gamma ray', isCorrect: false),
        Option(code: 'B', text: 'Alpha particles', isCorrect: false),
        Option(code: 'C', text: 'beta particles', isCorrect: true),
        Option(code: 'D', text: 'Neutron', isCorrect: true),
      ],
      solution: 'Neutron',
    ),
    Question(
      text: 'Respiratory organs in man do not include ________',
      options: [
        Option(code: 'A', text: 'Gills', isCorrect: true),
        Option(code: 'B', text: 'Lungs', isCorrect: false),
        Option(code: 'C', text: 'Nose', isCorrect: false),
        Option(code: 'D', text: 'Trachea', isCorrect: false),
      ],
      solution: 'Gills',
    ),
    Question(
      text: 'The valency of combing power of Aluminium (AL) is ________',
      options: [
        Option(code: 'A', text: '+3', isCorrect: true),
        Option(code: 'B', text: '+2', isCorrect: false),
        Option(code: 'C', text: '+4', isCorrect: false),
        Option(code: 'D', text: '+1', isCorrect: false),
      ],
      solution: '+3',
    ),
    Question(
      text: 'The biting teeth is ____________',
      options: [
        Option(code: 'A', text: 'incisors', isCorrect: false),
        Option(code: 'B', text: 'cannies', isCorrect: true),
        Option(code: 'C', text: 'carnassial teeth', isCorrect: false),
        Option(code: 'D', text: 'molars', isCorrect: false),
      ],
      solution: 'cannies',
    ),
    Question(
      text: 'The skin as a sense organ is major for _____',
      options: [
        Option(code: 'A', text: 'Excretion', isCorrect: false),
        Option(code: 'B', text: 'Feeling', isCorrect: true),
        Option(code: 'C', text: 'Smelling', isCorrect: false),
        Option(code: 'D', text: 'Slapping', isCorrect: false),
      ],
      solution: 'Feeling',
    ),
    Question(
      text: 'The force field around the bar magnet is called ____________',
      options: [
        Option(code: 'A', text: 'magnetic field', isCorrect: false),
        Option(code: 'B', text: 'magnetic bar', isCorrect: false),
        Option(code: 'C', text: 'magnetic force', isCorrect: true),
        Option(code: 'D', text: 'magnetic push', isCorrect: false),
      ],
      solution: 'magnetic force',
    ),
    Question(
      text: 'A positively charged ion is called ___',
      options: [
        Option(code: 'A', text: 'anion', isCorrect: false),
        Option(code: 'B', text: 'atom', isCorrect: false),
        Option(code: 'C', text: 'cation', isCorrect: true),
        Option(code: 'D', text: 'element', isCorrect: false),
      ],
      solution: 'cation',
    ),
    Question(
      text: 'The sickness caused by tsetse fly is ____',
      options: [
        Option(code: 'A', text: 'typhoid fever', isCorrect: false),
        Option(code: 'B', text: 'diarrhea', isCorrect: true),
        Option(code: 'C', text: 'dysentery', isCorrect: false),
        Option(code: 'D', text: 'sleeping sickness', isCorrect: true),
      ],
      solution: 'sleeping sickness',
    ),
    Question(
      text: 'Hydrogen is a ______________ gas',
      options: [
        Option(code: 'A', text: 'black', isCorrect: false),
        Option(code: 'B', text: 'colourless', isCorrect: true),
        Option(code: 'C', text: 'yellow', isCorrect: false),
        Option(code: 'D', text: 'white', isCorrect: false),
      ],
      solution: 'colourless',
    ),
    Question(
      text: 'Force is measured in ______',
      options: [
        Option(code: 'A', text: 'metre', isCorrect: false),
        Option(code: 'B', text: 'Newton', isCorrect: true),
        Option(code: 'C', text: 'kilogram', isCorrect: false),
        Option(code: 'D', text: 'seconds', isCorrect: false),
      ],
      solution: 'Newton',
    ),
    Question(
      text: 'Air contains about _____ of Oxygen',
      options: [
        Option(code: 'A', text: '78%', isCorrect: false),
        Option(code: 'B', text: '0.06%', isCorrect: false),
        Option(code: 'C', text: '20%', isCorrect: true),
        Option(code: 'D', text: '38%', isCorrect: false),
      ],
      solution: '20%',
    ),
    Question(
      text: 'Two main types of Joint are',
      options: [
        Option(code: 'A', text: 'flexible and rigid', isCorrect: false),
        Option(code: 'B', text: 'movable and immovable', isCorrect: true),
        Option(code: 'C', text: 'static and dynamic', isCorrect: false),
        Option(code: 'D', text: 'solid and liquid', isCorrect: false),
      ],
      solution: 'movable and immovable',
    ),
    Question(
      text: 'The following insects are diseases vectors except',
      options: [
        Option(code: 'A', text: 'blackfly', isCorrect: false),
        Option(code: 'B', text: 'butterfly', isCorrect: true),
        Option(code: 'C', text: 'mosquito', isCorrect: false),
        Option(code: 'D', text: 'tsetse fly', isCorrect: false),
      ],
      solution: 'butterfly',
    ),
    Question(
      text: 'Which of the following process is similar to rusting',
      options: [
        Option(code: 'A', text: 'condensation', isCorrect: false),
        Option(code: 'B', text: 'burning', isCorrect: true),
        Option(code: 'C', text: 'decomposition', isCorrect: false),
        Option(code: 'D', text: 'diffusion', isCorrect: false),
      ],
      solution: 'burning',
    ),
    Question(
      text: 'Which of the following process is similar to rusting',
      options: [
        Option(code: 'A', text: 'condensation', isCorrect: false),
        Option(code: 'B', text: 'burning', isCorrect: true),
        Option(code: 'C', text: 'decomposition', isCorrect: false),
        Option(code: 'D', text: 'diffusion', isCorrect: false),
      ],
      solution: 'burning',
    ),
    Question(
      text: 'A pure drinkable water must have',
      options: [
        Option(code: 'A', text: 'pH1', isCorrect: false),
        Option(code: 'B', text: 'pH7', isCorrect: true),
        Option(code: 'C', text: 'pH6', isCorrect: false),
        Option(code: 'D', text: 'pH14', isCorrect: false),
      ],
      solution: 'pH7',
    ),
    Question(
      text: 'Which of the following is a vertebrae.',
      options: [
        Option(code: 'A', text: 'centipede', isCorrect: false),
        Option(code: 'B', text: 'earthworm', isCorrect: false),
        Option(code: 'C', text: 'mouse', isCorrect: true),
        Option(code: 'D', text: 'octopus', isCorrect: false),
      ],
      solution: 'mouse',
    ),
    Question(
      text:
          'A car covers a distance of 60m in 30s? what is the average speed of the car?',
      options: [
        Option(code: 'A', text: '5m/s', isCorrect: true),
        Option(code: 'B', text: '10m/s', isCorrect: false),
        Option(code: 'C', text: '2m/s', isCorrect: false),
        Option(code: 'D', text: '8m/s', isCorrect: false),
      ],
      solution: '5m/s',
    ),
    Question(
      text: 'The botanical name of maize is',
      options: [
        Option(code: 'A', text: 'zea mays', isCorrect: true),
        Option(code: 'B', text: 'zea spp', isCorrect: false),
        Option(code: 'C', text: 'mays spp', isCorrect: true),
        Option(code: 'D', text: 'zea maydis', isCorrect: false),
      ],
      solution: 'zea mays',
    ),
    Question(
      text: 'Reflected sound is called',
      options: [
        Option(code: 'A', text: 'echo', isCorrect: true),
        Option(code: 'B', text: 'mirage', isCorrect: false),
        Option(code: 'C', text: 'noise', isCorrect: true),
        Option(code: 'D', text: 'wave', isCorrect: false),
      ],
      solution: 'echo',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Question> getShuffledQuestions() {
      List<Question> shuffledQuestions = List.from(questions);
      shuffledQuestions.shuffle();
      return shuffledQuestions;
    }

    return Scaffold(
      body: QuizPage(getShuffledQuestions()),
    );
  }
}

class QuizPage extends StatefulWidget {
  final List<Question> questions;
  late final User user;
  QuizPage(this.questions);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  int correctAnswers = 0;
  int remainingTime = 1800; // Set the initial time in seconds
  bool isQuizEnded = false;

// Create a timer that updates the remaining time every second
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          timer.cancel();
          isQuizEnded = true;
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Time Up!'),
              content: Text('You ran out of time!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showResult();
                  },
                  child: Text('Show Result'),
                ),
              ],
            ),
          );
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

// ... (checkAnswer, goToPreviousQuestion, resetQuiz, and build methods remain the same)
// Add the following method to show the quiz result
  void showResult() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Quiz Result'),
        content: Text('Correct Answers: $correctAnswers/${questions.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
// resetQuiz();
              startTimer(); // Restart the timer for the next quiz
            },
            child: Text('Play Again'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
// Check if the quiz is ended and show the result if needed
    if (isQuizEnded) {
      return Center(
        child: ElevatedButton(
          onPressed: showResult,
          child: Text('Show Result'),
        ),
      );
    }
// return Center();
// }
//return Ui

//end return
    void checkAnswer(bool userAnswer) {
      setState(() {
        if (userAnswer ==
            widget.questions[questionIndex].options
                .firstWhere((option) => option.code == 'A')
                .isCorrect) {
          correctAnswers++;
        }
        if (questionIndex < widget.questions.length - 1) {
          questionIndex++;
        }
      });
    }

    void goToPreviousQuestion() {
      setState(() {
        if (questionIndex > 0) {
          questionIndex--;
        }
      });
    }

    void resetQuiz() {
      setState(() {
        questionIndex = 0;
        correctAnswers = 0;
      });
    }

    String getFormattedTime() {
      int hours = remainingTime ~/ 2100;
      int minutes = (remainingTime % 2100) ~/ 60;
      int seconds = remainingTime % 60;

      String hoursStr = (hours % 24).toString().padLeft(2, '0');
      String minutesStr = minutes.toString().padLeft(2, '0');
      String secondsStr = seconds.toString().padLeft(2, '0');

      return "$hoursStr:$minutesStr:$secondsStr";
    }

// @override
//  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question Page'),
      ),
      body: Column(
// mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Time Remaining: ${getFormattedTime()}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            widget.questions[questionIndex].text,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          for (Option option in widget.questions[questionIndex].options)
            ElevatedButton(
              onPressed: () => checkAnswer(option.isCorrect),
              child: Text(option.text),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20.0)),
                elevation: MaterialStateProperty.all<double>(0.0),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blueAccent),
//   shadowColor: MaterialStateProperty.all<Color>(Colors.amberAccent),
                minimumSize: MaterialStateProperty.all(Size(50, 50)),
                fixedSize: MaterialStateProperty.all(Size(320, 50)),
                side:
                    MaterialStateProperty.all(BorderSide(color: Colors.white)),
              ),
            ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (questionIndex > 0)
                ElevatedButton(
                  onPressed: goToPreviousQuestion,
                  child: Text('Previous'),
                ),
              SizedBox(width: 10),
              if (questionIndex < widget.questions.length - 1)
                ElevatedButton(
                  onPressed: () {
                    checkAnswer(true);
                  },
                  child: Text('Next'),
                ),
              if (questionIndex == widget.questions.length - 1)
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Quiz Result'),
                        content: Column(
                          children: [
                            Text(
                                'Correct Answers: $correctAnswers/${questions.length}'),
                          ],
                        ),
// Text(
//                             'Correct Answers: $correctAnswers/${widget.questions.length}'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              resetQuiz();
                            },
                            child: Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text('Submit'),
                ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(30)),
              child: Text(
                "Go to home",
                style: TextStyle(color: Colors.white, fontSize: 19),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
