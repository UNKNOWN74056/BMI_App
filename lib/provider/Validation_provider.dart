import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/Validation_item.dart';

class validaiton extends ChangeNotifier {
  late validaitonitem _height = validaitonitem(null, null);
  late validaitonitem _weight = validaitonitem(null, null);

  //controllers
  TextEditingController heightController = TextEditingController();
  TextEditingController waightController = TextEditingController();
  /////////////////////////////////////////////

  //dispsoe the controller
  void disposeControllers() {
    heightController.dispose();
    waightController.dispose();
  }

  // Getters for validation errors
  validaitonitem get height => _height;
  validaitonitem get weight => _weight;
  // Email validation function
  void validatehight(String value) {
    if (value.isEmpty) {
      _height = validaitonitem(value, "Enter your height");
    } else if (!isNumeric(value)) {
      _height = validaitonitem(value, 'Only numeric characters are allowed');
    } else {
      _height = validaitonitem(value, null);
    }
    notifyListeners();
  }

  void validateweight(String value) {
    if (value.isEmpty) {
      _weight = validaitonitem(value, "Enter your weight");
    } else if (!isNumeric(value)) {
      _weight = validaitonitem(value, 'Only numeric characters are allowed');
    } else {
      _weight = validaitonitem(value, null);
    }
    notifyListeners();
  }

  bool get isvalid {
    if (_height.Value != null && _weight.Value != null) {
      return true;
    } else {
      return false;
    }
  }

  bool isNumeric(String value) {
    // Use a regular expression to check if the value contains only numeric characters
    return RegExp(r'^[0-9]+$').hasMatch(value);
  }
}
