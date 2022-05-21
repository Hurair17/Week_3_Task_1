import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3_task/core/constants/color.dart';

import 'package:week_3_task/ui/custom_widget/wrap_txt_button.dart';

import 'package:week_3_task/ui/screens/registration_auth/login/login.dart';

import 'package:week_3_task/ui/screens/registration_auth/signup/signup_view_model.dart';
import 'package:week_3_task/ui/screens/root.dart';
import 'package:week_3_task/ui/custom_widget/custom_form_field.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Arow Back Icon Button
                Align(
                    widthFactor: 15.w,
                    alignment: Alignment.topLeft,
                    child: const ArrowBackIconBtn()),
                SizedBox(
                  height: 40.h,
                ),
                Stack(
                  children: [
                    // Top Button
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
                    // Image From Side
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
                  padding:
                      const EdgeInsets.only(top: 30.0, left: 20, right: 20),
                  child: Column(
                    children: [
                      // Form TextFormFields with down Height
                      CustomFormField(
                        hint: 'Name',
                        icn: Icon(
                          Icons.person,
                          color: darkgren,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Your Name';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomFormField(
                        hint: 'Email',
                        icn: Icon(
                          Icons.mail,
                          color: darkgren,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Your Email';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomFormField(
                        hint: 'Password',
                        obsecure: true,
                        icn: Icon(
                          Icons.person,
                          color: darkgren,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Your Password';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomFormField(
                        hint: 'Confirm Password',
                        icn: Icon(
                          Icons.person,
                          color: darkgren,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Cofirm Your Password';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      // Wrap Text
                      Wrap(
                        children: [
                          CustWrapButton2(
                            txt1: ' Term of use',
                            btntxt: 'By signing you agree to our',
                            wdth: 270.w,
                          ),
                          CustWrapButton2(
                            txt1: ' privacy notice',
                            btntxt: 'and',
                            wdth: 160.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      Center(
                        // SignUp Button
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RootBar()));
                            } else {
                              null;
                            }
                          },
                          child: Text(
                            'SignUp',
                            style: TextStyle(fontSize: 20.sp),
                          ),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: darkgren,
                            fixedSize: Size(370.w, 45.h),
                            shape: const StadiumBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Already Have acount Login Screen Button
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
      ),
    );
  }
}

// Top Arrow Back Icon Button
class ArrowBackIconBtn extends StatelessWidget {
  const ArrowBackIconBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r), color: lightgreen),
      child: Center(
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: darkgren,
          ),
          splashRadius: 15.r,
        ),
      ),
    );
  }
}
