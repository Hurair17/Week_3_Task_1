import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:week_3_task/ui/custom_widget/eleveted_button.dart';
import 'package:week_3_task/ui/custom_widget/text_form_field.dart';
import 'package:week_3_task/ui/custom_widget/wrap_txt_button.dart';
import 'package:week_3_task/ui/screens/registration_auth/login/login.dart';
import 'package:week_3_task/ui/screens/root.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                  widthFactor: 20.w,
                  alignment: Alignment.topLeft,
                  child: const ArrowBackIconBtn()),
              SizedBox(
                height: 40.h,
              ),
              Stack(
                children: [
                  Column(
                    children: [
                      Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: darkgren,
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Create your new account',
                          style: TextStyle(color: gry),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: -15.w,
                    height: 110.h,
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
                padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
                child: Column(
                  children: [
                    TextFomField(
                        hint: 'Full Name',
                        icn: Icon(
                          Icons.person,
                          color: darkgren,
                        )),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFomField(
                        hint: 'jhonsmith@gmail.com',
                        icn: Icon(
                          Icons.email,
                          color: darkgren,
                        )),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFomField(
                      hint: 'Password',
                      icn: Icon(
                        Icons.lock,
                        color: darkgren,
                      ),
                      obsecure: true,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFomField(
                      hint: 'Confirm Password',
                      icn: Icon(
                        Icons.lock,
                        color: darkgren,
                      ),
                      obsecure: true,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Wrap(
                      children: [
                        CustWrapButton2(
                          txt1: 'Team of use',
                          btntxt: 'By signing you agree to our',
                          wdth: 270.w,
                        ),
                        CustWrapButton2(
                          txt1: 'privacy notice',
                          btntxt: 'and',
                          wdth: 160.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              CustElevetedButton(next: RootBar(), txt: 'Sign Up'),
              Center(
                child: CustWrapButton1(
                  txt1: 'Already have an account?',
                  btntxt: 'Log in',
                  nxtscreen: Login(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArrowBackIconBtn extends StatelessWidget {
  const ArrowBackIconBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: lightgreen),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back_ios,
          color: darkgren,
        ),
        splashRadius: 20.r,
      ),
    );
  }
}
