import 'package:flutter/material.dart';

class SuhuProvider with ChangeNotifier {
  double celsius = 0;
  double fahrenheit = 0;
  double kelvin = 0;
  double reamur = 0;

  double get getcelsius => celsius;
  double get getfahrenheit => fahrenheit;
  double get getkelvin => kelvin;
  double get getreamur => reamur;

  void konversi(double input) {
    celsius = input;
    fahrenheit = (input * 9 / 5) + 32;
    kelvin = input + 273.15;
    reamur = input * 4 / 5;
    notifyListeners();
  }
}
