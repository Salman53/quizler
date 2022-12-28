import 'package:flutter/material.dart';
import 'package:quizler/quiz_Brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

/*Abstraction is hiding the details and implementation of the code.
Encapsulation is hiding the data and controlling the visibility of the code.
Abstraction is the method of hiding the unwanted information.
Whereas encapsulation is a method to hide the data in a single entity or unit along with a method to protect information from outside.*/

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
        ),

        )
        ),
      );
  }
}
class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List <Icon> scoreKeeper =[];

  void checkAnswer(bool userPickedAnswer){
    setState(() {

      if(quizBrain.isFinished() == true){

        Alert(
          context: context,
          title: 'Finished',
          desc: 'You have reached the end of the quiz!'
        ).show();

        quizBrain.reset();
        scoreKeeper = [];
      }

      else {
        bool correctAnswer = quizBrain.getCorrectAnswer();
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(const Icon(Icons.check, color: Colors.green));

        }
        else {
          scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
        }
        quizBrain.nextQuestion();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:<Widget>[
         Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                   quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(

              style: ElevatedButton.styleFrom(
              primary: Colors.green,
    ),
              onPressed: () {

                checkAnswer(true);
              },

              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
        child: ElevatedButton(

        style: ElevatedButton.styleFrom(
        primary: Colors.red,
        ),
          onPressed: () {

           checkAnswer(false);
    },

        child: const Text(
         'False',
        style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        ),
        ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        ),

    Row(
    children: scoreKeeper,
    )
    ],
    );
  }
}

