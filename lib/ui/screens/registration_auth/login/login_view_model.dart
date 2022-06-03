import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:week_3_task/core/models/validation_model/login_model.dart';
import 'package:week_3_task/core/services/firebase_auth.dart';

import '../../../../core/services/database_service.dart';
import '../../root.dart';

class LogInFormProvider extends ChangeNotifier {
  bool? isNotifiable = false;
  LogInModel logInModel = LogInModel();
  final _auth = FirebaseAuth.instance;

  final auth = FirebaseAuthServices().auth;
  final _dbService = DatabaseService();

  void toggleNotification({bool? isNotifiable = true}) {
    this.isNotifiable = isNotifiable;
    notifyListeners();
  }

  String? nameValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Name';
    }
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return ("Please enter a valid email");
    }
  }

  String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Password';
    }
  }

  void signIn(String email, String password, BuildContext context) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) {
        Fluttertoast.showToast(msg: "Login Successful");

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => RootBar()));
        // Get.offAll()
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
