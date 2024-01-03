import 'dart:math';

import 'package:flutter/material.dart';

class BMICalculate {
  final int height;
  final int weight;
  double? _bmiResult;
  BMICalculate({required this.weight, required this.height});

  String calculateBMI() {
    _bmiResult = weight / pow(height / 100, 2);
    return _bmiResult!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmiResult == null) {
      throw Exception("Loading...");
    }
    return _bmiResult! >= 25
        ? "Over Weight"
        : _bmiResult! > 18.5
        ? "Normal"
        : "Under Weight";
  }

  String getInterpretation() {
    if (_bmiResult == null) {
      throw Exception("Loading...");
    }
    return _bmiResult! >= 25
        ? "You have an higher than normal body weight. Try to exercise more."
        : _bmiResult! > 18.5
        ? "You have an normal body weight. Congratulations!"
        : "Your body weight is quite low, you should eat more!";
  }
}
