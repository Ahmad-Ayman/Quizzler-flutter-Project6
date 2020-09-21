import 'package:flutter/material.dart';

class Questions {
  String questionText;
  bool questionAnswer;
  BoxDecoration image;

  Questions({String q, bool a, BoxDecoration i}) {
    this.questionText = q;
    this.questionAnswer = a;
    this.image = i;
  }
}
