// ignore_for_file: body_might_complete_normally_nullable, duplicate_ignore

import 'package:flutter/material.dart';

class LogInFormProvider extends ChangeNotifier {
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
}
