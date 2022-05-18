import 'package:flutter/material.dart';
import 'package:week_3_task/core/models/validation_model.dart';

class LogINFormProvider extends ChangeNotifier {
  ValidationModel _name = ValidationModel(null, null);
  ValidationModel _password = ValidationModel(null, null);

  // Getters
  ValidationModel get name => _name;
  ValidationModel get password => _password;

  bool get isValid {
    if (_name.value != null && _password.value != null) {
      return true;
    } else {
      return false;
    }
  }

  //Setters
  void validateName(String value) {
    if (value.length >= 6) {
      _name = ValidationModel(value, null);
    } else {
      _name = ValidationModel(
          null, 'Please Enter an Email with length 6 character');
    }
    notifyListeners();
  }

  void validatePassword(String value) {
    if (value.length >= 5) {
      _password = ValidationModel(value, null);
    } else {
      _password = ValidationModel(null, 'Enter Password atleast 5 character');
    }
    notifyListeners();
  }
}
