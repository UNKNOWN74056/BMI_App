import 'package:flutter/material.dart';

class BmiProvider with ChangeNotifier {
  int _currentIndex = 0;
  double _h = 0;
  double _w = 0;
  String _result = "";

  int get currentIndex => _currentIndex;
  double get h => _h;
  double get w => _w;
  String get result => _result;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setHeight(double height) {
    _h = height;
    notifyListeners();
  }

  void setWeight(double weight) {
    _w = weight;
    notifyListeners();
  }

  void setResult(String bmi) {
    _result = bmi;
    notifyListeners();
  }

  void calculateBMI() {
    double finalResult = _w / (_h * _h / 1000);
    _result = finalResult.toStringAsFixed(2);
    notifyListeners();
  }
}
