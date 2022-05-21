import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:week_3_task/ui/custom_widget/custom_form_field.dart';
import 'package:week_3_task/ui/custom_widget/wavy_path.dart';
import 'package:week_3_task/ui/custom_widget/wrap_txt_button.dart';
import 'package:week_3_task/ui/screens/registration_auth/login/login_view_model.dart';
import 'package:week_3_task/ui/screens/registration_auth/signup/signup.dart';
import 'package:week_3_task/ui/screens/root.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Bool Check for Remember Me
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<LogINFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              // Top Plant Image with Bottom wavy
              ClipPath(
                child: Image.asset(
                  'assets/plant1.jpg',
                  fit: BoxFit.fitWidth,
                ),
                // Bottom Wavy Shape

                clipper: BottomWaveClipper(),
              ),

              // User Welcome Text and Side Image Stack
              Stack(
                children: [
                  Column(
                    children: [
                      Center(
                        child: Text(
                          'Welcome back',
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            color: darkgren,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Login to your account',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: gry,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Side Plant Image
                  Positioned(
                    right: -20.w,
                    child: RotationTransition(
                      turns: const AlwaysStoppedAnimation(300 / 360),
                      child: Image.asset(
                        'assets/side.png',
                        width: 90.w,
                      ),
                    ),
                  ),
                ],
              ),

              // TextFields Form
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
                child: Column(
                  children: [
                    CustomFormField(
                      hint: 'Full Name',
                      icn: Icon(
                        Icons.person,
                        color: darkgren,
                      ),
                      errorText: validationService.name.error,
                      onChanged: (String value) {
                        validationService.validateName(value);
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomFormField(
                      hint: '*******',
                      icn: Icon(
                        Icons.person,
                        color: darkgren,
                      ),
                      errorText: validationService.password.error,
                      onChanged: (String value) {
                        validationService.validatePassword(value);
                      },
                      obsecure: true,
                    ),
                  ],
                ),
              ),

              //Remember Button
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: Row(
                  children: [
                    //CheckBox Button
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      activeColor: darkgren,
                    ),
                    Text(
                      'Remember me',
                      style: TextStyle(
                        color: gry,
                        fontSize: 12.sp,
                      ),
                    ),
                    const Spacer(),

                    //Forget Password Button
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(
                          color: darkgren,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 130.h,
              ),

              //Text Button of Login
              Center(
                child: TextButton(
                  onPressed: () {
                    if (!validationService.isValid) {
                      final snackBar = SnackBar(
                        content: const Text('Please Input Your Data'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RootBar()));
                    }
                  },
                  child: Text(
                    'LogIn',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: darkgren,
                    fixedSize: Size(350.w, 45.h),
                    shape: const StadiumBorder(),
                  ),
                ),
              ),

              //Wrap Sign Up Text Button
              Center(
                child: CustWrapButton1(
                  txt1: 'Don\'t have an account',
                  btntxt: 'Sign Up',
                  nxtscreen: SignUp(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
