import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:week_3_task/core/models/validation_model/login_model.dart';
import 'package:week_3_task/core/services/firebase_auth.dart';

import '../../../../locator.dart';
import '../../root.dart';

class LogInFormProvider extends ChangeNotifier {
  bool? isNotifiable = false;
  LogInModel logInModel = LogInModel();
  final _authService = locator<AuthService>();

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

  // void signIn(String email, String password, BuildContext context) async {
  //   try {
  //     await _auth
  //         .signInWithEmailAndPassword(email: email, password: password)
  //         .then((uid) {
  //       Fluttertoast.showToast(msg: "Login Successful");

  //       Navigator.of(context)
  //           .push(MaterialPageRoute(builder: (context) => RootBar()));
  //       // Get.offAll()
  //     });
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: e.toString());
  //   }
  // }
  // void signIn(String email, String password, BuildContext context) async {
  //   try {
  //     final authResult =
  //         await _authService.loginWithEmailAndPassword(logInModel);
  //     // await _auth
  //     //     .signInWithEmailAndPassword(email: email, password: password)
  //     //     .then((uid) {
  //     // Fluttertoast.showToast(msg: "Login Successful");
  //     if (authResult.status) {
  //       // await Get.offAll(RootBar());
  //       Navigator.of(context)
  //           .push(MaterialPageRoute(builder: (context) => RootBar()));
  //     } else {
  //       Get.snackbar('Login Failed', authResult.error!);
  //     }
  //     // Navigator.of(context)
  //     //     .push(MaterialPageRoute(builder: (context) => RootBar()));
  //     // Get.offAll()
  //     // });
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: e.toString());
  //   }
  // }
  Future<void> login() async {
    final authResult = await _authService.loginWithEmailAndPassword(logInModel);
    if (authResult.status) {
      await Get.to(RootBar());
    } else {
      Get.snackbar('Login Failed', authResult.error!);
    }
  }
}
