import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_3_task/ui/screens/cart/cart_view_model.dart';
import 'package:week_3_task/ui/screens/product/product_detail_view_mode.dart';
import 'package:week_3_task/ui/screens/registration_auth/signup/signup_view_model.dart';
import 'ui/screens/registration_auth/login/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => CartItemsViewModel()),
      ChangeNotifierProvider(create: (_) => ProductDetailViewModel()),
      // ChangeNotifierProvider(create: (_) => SignUpFormProvider()),
      // ChangeNotifierProvider(create: (_) => LogInFormProvider()),
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
        return Login();
      },
    );
  }
}
