import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3_task/core/constants/color.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image.asset('assets/plant1.png'),
        Container(
          width: 180.w,
          color: black,
        ),

        Positioned(
          top: 40.h,
          child: Container(
            width: 180.w,
            height: 180.h,
            color: lightgreen,
            // decoration: BoxDecoration,
          ),
        )
      ],
    );
  }
}
