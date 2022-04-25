import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3_task/core/constants/color.dart';

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
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 10.h),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: lightgreen),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: darkgren,
                    ),
                    splashRadius: 20.r,
                  ),
                ),
              ),
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
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
