import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_3_task/ui/screens/registration_auth/login/login.dart';
import 'package:week_3_task/ui/screens/root.dart';
import '../../core/services/firebase_auth.dart';
import '../../locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authService = locator<AuthService>();
  @override
  void initState() {
    _initialSetup();
    super.initState();
  }

  _initialSetup() async {
    await Future.delayed(const Duration(seconds: 2));
    if (_authService.isLogin) {
      Get.to(const RootBar());
    } else {
      Get.offAll(Login());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
