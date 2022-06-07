import 'package:firebase_auth/firebase_auth.dart';
import '../models/auth_result.dart';
import '../models/validation_model/login_model.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  User? user;
  bool isLogin = false;

  AuthService() {
    doSetup();
  }

  doSetup() {
    user = _auth.currentUser;
    isLogin = user != null;
  }

  Future<AuthResult> loginWithEmailAndPassword(LogInModel body) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: body.email!, password: body.password!);
      if (credential.user != null) {
        isLogin = true;
        user = credential.user;
        return AuthResult(status: true);
      } else {
        return AuthResult(status: false, error: 'Login failed');
      }
    } on FirebaseAuthException catch (e) {
      return AuthResult(status: false, error: e.message);
    }
  }
}
