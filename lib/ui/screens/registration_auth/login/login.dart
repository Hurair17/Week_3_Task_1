import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:week_3_task/ui/custom_widget/eleveted_button.dart';
import 'package:week_3_task/ui/custom_widget/text_form_field.dart';
import 'package:week_3_task/ui/custom_widget/wavy_path.dart';
import 'package:week_3_task/ui/custom_widget/wrap_txt_button.dart';
import 'package:week_3_task/ui/screens/registration_auth/signup/signup.dart';
import 'package:week_3_task/ui/screens/root.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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

              // User Welcome Text and Side Image
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
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
                child: Column(
                  children: [
                    // Text Field for Name And Password
                    TextFomField(
                      hint: 'Full Name',
                      val: true,
                      txt: 'name',
                      icn: Icon(
                        Icons.person,
                        color: darkgren,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFomField(
                      val: true,
                      txt: 'password',
                      hint: '********',
                      icn: Icon(
                        Icons.lock,
                        color: darkgren,
                        size: 20,
                      ),
                      obsecure: true,
                    ),
                  ],
                ),
              ),
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
                height: 120.h,
              ),

              //Bottom Login Button
              const Center(
                child: CustElevetedButton(
                  next: RootBar(),
                  txt: 'Login',
                ),
              ),

              //Wrap Sign Up Text Button
              const Center(
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
