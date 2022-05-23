import 'package:flutter/material.dart';

class SignUpFormProvider extends ChangeNotifier {
  bool? isNotifiable = false;

  void toggleNotification({bool? isNotifiable = true}) {
    this.isNotifiable = isNotifiable;
    notifyListeners();
  }

  String? nameValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Name';
    }
    return '';
  }

  String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Password';
    }
    return '';
  }

  String? emailValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Password';
    }
    return '';
  }

  String? confirmValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Password';
    }
    return '';
  }
}
