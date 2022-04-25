import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:week_3_task/ui/custom_widget/text_form_field.dart';
import 'package:week_3_task/ui/custom_widget/wavy_path.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              child: Image.asset(
                'assets/loginimage.webp',
                fit: BoxFit.fitWidth,
              ),
              clipper: BottomWaveClipper(),
            ),
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
                          color: darkgren,
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
                  TextFomField(
                    hint: 'Full Name',
                    icn: Icon(
                      Icons.person,
                      color: darkgren,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFomField(
                    hint: '*****',
                    icn: Icon(
                      Icons.lock,
                      color: darkgren,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
              child: Row(
                children: [
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
                      color: darkgren,
                      fontSize: 12.sp,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
