import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_3_task/ui/screens/cart/cart_view_model.dart';
import 'package:week_3_task/ui/screens/home/home.dart';
import 'package:week_3_task/ui/screens/home/home_view_model.dart';
import 'package:week_3_task/ui/testing/test_screen.dart';
import 'ui/screens/registration_auth/login/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: ((context) => CartViewModel())),
      ChangeNotifierProvider(create: (_) => HomeViewModel()),
    ], child: const MaterialApp(home: MyApp())),
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
        // return Login();
        return Material(child: Login());
      },
    );
  }
}
