import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:week_3_task/ui/custom_widget/wavy_path.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image.asset('assets/plant1.png'),
        Container(
          width: 180.w,
          // color: Colors.white,
        ),

        Positioned(
          top: 120.h,
          child: Container(
            width: 180.w,
            height: 120.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.r),
                bottomRight: Radius.circular(15.r),
              ),
              color: Colors.green[100],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0, left: 5, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Indoor',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  Row(
                    children: [
                      Text('Peace Lily'),
                      Spacer(),
                      Container(
                        height: 20.h,
                        // width: 20.w,
                        child: Text('\$18.9'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 50.h,
          child: ClipPath(
            child: Container(
              width: 180.w,
              height: 170.h,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.r),
                  topLeft: Radius.circular(15.r),
                ),
                color: Colors.green[300],
              ),
              //TODO: Add Image Here
            ),
            clipper: BottomWaveClipper(),
          ),
        ),
        Positioned(
          left: -30,
          top: 0,
          child: Image.asset('assets/plant1.png'),
          height: 190,
        ),
      ],
    );
  }
}
