import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audioplayers.dart';

class QuizPageSetup extends StatefulWidget {
  const QuizPageSetup({Key? key}) : super(key: key);

  @override
  State<QuizPageSetup> createState() => _QuizPageSetupState();
}

class _QuizPageSetupState extends State<QuizPageSetup> {
  List<Icon> scorekeeper = [];

  void checkAnswer(String userPickedAnswer) {
    String correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (quizBrain.isFinished()) {
        int correctAnswers =
            scorekeeper.where((icon) => icon.icon == Icons.check).length;

        Alert(
          context: context,
          title: "Congrats!",
          desc:
              "You completed the Quiz.\nScore: $correctAnswers/${scorekeeper.length}",
        ).show();
        quizBrain.reset();
        scorekeeper = [];
      } else {
        if (correctAnswer == userPickedAnswer) {
          playCorrectSound();
          scorekeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          playIncorrectSound();
          scorekeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBrain.nextQuestion();
      }
    });
  }

  QuizBrain quizBrain = QuizBrain();

  AudioCache audioCache = AudioCache();
  void loadAudio() {
    audioCache.loadAll(['correct.mp3', 'incorrect.mp3']);
  }

  void playCorrectSound() {
    audioCache.play('correct.mp3');
  }

  void playIncorrectSound() {
    audioCache.play('incorrect.mp3');
  }

  @override
  void initState() {
    super.initState();
    loadAudio();
  }

  @override
  Widget build(BuildContext context) {
    print(scorekeeper);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getquestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        ...quizBrain.getAnswerChoices().asMap().entries.map((entry) {
          int index = entry.key;
          String choice = entry.value;
          Color buttonColor;

          switch (index) {
            case 0:
              buttonColor = Colors.green;
              break;
            case 1:
              buttonColor = Colors.red;
              break;
            case 2:
              buttonColor = Colors.blue;
              break;
            case 3:
              buttonColor = Colors.yellow;
              break;
            default:
              buttonColor = Colors.grey;
          }

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(buttonColor),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  checkAnswer(choice);
                },
                child: Text(
                  choice,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}
