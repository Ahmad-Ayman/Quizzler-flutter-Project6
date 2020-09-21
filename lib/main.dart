import 'package:flutter/material.dart';
import 'Quiz_Brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  Quiz_Brain quizBrain = Quiz_Brain();

  void checkAnswers(bool userPickedAnswer) {
    setState(() {
      if (quizBrain.isFinished() == true) {
        print("Quiz Finished");
        Alert(
          context: context,
          title: 'Finished!',
          desc:
              'You\'ve completed the quiz with score $numberOfCorrectAnswers out of 10',
        ).show();
        quizBrain.resetQuestions();
        scoreKeeper = [];
        numberOfCorrectAnswers = 0;
      } else {
        int pos = quizBrain.currentPos();
        print("Question Number $pos");
        bool correctAnswer = quizBrain.getQuestionsAnswer();
        if (userPickedAnswer == correctAnswer) {
          print('user get it right');
          scoreKeeper.add(
            Icon(Icons.check, color: Colors.green),
          );
          numberOfCorrectAnswers++;
        } else {
          print('user get it wrong');
          scoreKeeper.add(
            Icon(Icons.close, color: Colors.red),
          );
        }
        if (quizBrain.currentPos() == quizBrain.getQuestionBankSize() - 1) {
          print("Quiz Finished");
          Alert(
            context: context,
            title: 'Finished!',
            desc:
                'You\'ve completed the quiz with score $numberOfCorrectAnswers out of 10',
          ).show();
          quizBrain.resetQuestions();
          scoreKeeper = [];
          numberOfCorrectAnswers = 0;
        } else
          quizBrain.nextQuestion();
      }
    });
  }

  int numberOfCorrectAnswers = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: quizBrain.getPic(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionsText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  //The user picked true.
                  checkAnswers(true);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  //The user picked false.
                  checkAnswers(false);
                },
              ),
            ),
          ),
          //TODO: Add a Row here as your score keeper
          Card(
            color: Colors.black,
            child: Row(
              children: scoreKeeper,
            ),
          ),
        ],
      ),
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
