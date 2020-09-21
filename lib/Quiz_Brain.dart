import 'package:flutter/material.dart';

import 'Questions.dart';

class Quiz_Brain {
  int _questionNumber = 0;
  List<Questions> _questionBank = [
    Questions(
      q: 'Number of broomsticks are flown in a full game of Quidditch is 15 ?',
      a: true,
      i: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/q1.jpg'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
      )),
    ),
    Questions(
      q: 'The First Character To Die In The Deathly Hallows Part 1 Was Dobby ?',
      a: false,
      i: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/q2.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
        ),
      ),
    ),
    Questions(
      q: 'Neville Longbottom\'s Greatest Fear Is Snape ?',
      a: true,
      i: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/q3.png'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
      )),
    ),
    Questions(
      q: 'Harry Potter\'s Middle Name Is James ?',
      a: true,
      i: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/q4.jpg'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
      )),
    ),
    Questions(
      q: 'Igor Karkaroff Put Harry\'s Name In The Goblet Of Fire ?',
      a: false,
      i: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/q5.jpg'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
      )),
    ),
    Questions(
      q: 'Hermione\'s First Boyfriend Was Cedric Diggory ?',
      a: false,
      i: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/q6.jpg'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
      )),
    ),
    Questions(
      q: 'The Basilisk Was One Of Voldermort\'s Horcruxes ?',
      a: false,
      i: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/q7.jpg'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
      )),
    ),
    Questions(
      q: 'Norbert Was Hagrid\'s Pet Hippogriff ?',
      a: false,
      i: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/q8.jpg'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
      )),
    ),
    Questions(
      q: 'Brian Is One Of Dumbledore\'s Middle Names ?',
      a: true,
      i: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/q9.jpg'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
      )),
    ),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  BoxDecoration getPic() {
    return _questionBank[_questionNumber].image;
  }

  String getQuestionsText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionsAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  int getQuestionBankSize() {
    return _questionBank.length;
  }

  bool isFinished() {
    if (_questionNumber > _questionBank.length - 1) {
      return true;
    } else
      return false;
  }

  void resetQuestions() {
    _questionNumber = 0;
  }

  int currentPos() {
    return _questionNumber;
  }
}
