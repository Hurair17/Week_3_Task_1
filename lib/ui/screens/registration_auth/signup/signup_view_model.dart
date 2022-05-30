import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:week_3_task/core/models/validation_model/signup_model.dart';
import 'package:week_3_task/ui/screens/root.dart';

class SignUpFormProvider extends ChangeNotifier {
  bool? isNotifiable = false;
  SignUpModel signUpModel = SignUpModel();

  void toggleNotification({bool? isNotifiable = true}) {
    this.isNotifiable = isNotifiable;
    notifyListeners();
  }

  String? nameValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Name';
    }
  }

  String? emailValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your email';
    }
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return ("Please enter a valid email");
    }
  }

  String? password;
  String? passwordValidation(String? password) {
    if (password!.isEmpty) {
      return 'Please Enter Your Password';
    }
  }

  // String? confirmValidation(String? value) {
  //   if (value!.isEmpty) {
  //     return 'Please Enter Your Password';
  //   } else if (value != password) {
  //     return 'Password Does Not Match';
  //   }
  // }

  final _auth = FirebaseAuth.instance;
  void signUp(
      String email, String password, String name, BuildContext context) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => {userRegistration(context, name)});
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  userRegistration(context, String name) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    // UserModel userModel = UserModel();

    signUpModel.email = user!.email;
    signUpModel.userId = user.uid;
    signUpModel.name = name;

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(signUpModel.toMap());
    Fluttertoast.showToast(msg: "Account Created Successfully");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RootBar()),
    );
  }
}
