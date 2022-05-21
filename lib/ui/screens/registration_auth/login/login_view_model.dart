import 'package:flutter/material.dart';

class LogInFormProvider extends ChangeNotifier {
  bool? isNotifiable = false;

  void toggleNotification({bool? isNotifiable = true}) {
    this.isNotifiable = isNotifiable;
    notifyListeners();
  }
}
