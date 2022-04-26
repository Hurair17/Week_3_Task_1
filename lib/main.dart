import 'package:flutter/material.dart';
import 'package:week_3_task/ui/screens/root.dart';
import 'ui/screens/registration_auth/login/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    const MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_) {
        return RootBar();
      },
    );
  }
}
