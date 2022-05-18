import 'package:flutter/material.dart';
import 'package:week_3_task/core/models/validation_model.dart';

class SignUpFormProvider extends ChangeNotifier {
  ValidationModel _email = ValidationModel(null, null);
  ValidationModel _password = ValidationModel(null, null);
  ValidationModel _confirmPassword = ValidationModel(null, null);
  ValidationModel _name = ValidationModel(null, null);

  // Getters
  ValidationModel get email => _email;
  ValidationModel get password => _password;
  ValidationModel get cPassword => _confirmPassword;
  ValidationModel get name => _name;

  bool get isValid {
    if (_email.value != null &&
        _password.value != null &&
        _confirmPassword.value != null &&
        _name.value != null) {
      return true;
    } else {
      return false;
    }
  }

  //Setters
  void validateEmail(String value) {
    if (value.length >= 6) {
      _email = ValidationModel(value, null);
    } else {
      _email = ValidationModel(
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

  void validateName(String value) {
    if (value.length >= 3) {
      _name = ValidationModel(value, null);
    } else {
      _name = ValidationModel(null, 'Please enter a  name');
    }
    notifyListeners();
  }

  void confirmPassword(String value) {
    if (value.length >= 5) {
      _confirmPassword = ValidationModel(value, null);
    } else {
      _confirmPassword = ValidationModel(null, 'Please Confrim Your Password');
    }
    notifyListeners();
  }

  void submitData() {
    _confirmPassword = ValidationModel(null, 'Please Input Your Data');

    notifyListeners();
  }
}
