// ignore_for_file: body_might_complete_normally_nullable

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
  }

  String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Password';
    }
  }

  String? emailValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Password';
    }
  }

  String? confirmValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Password';
    }
  }
}
