import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:week_3_task/ui/screens/product/product_detail.dart';

class HomeScreenDownCard extends StatelessWidget {
  const HomeScreenDownCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PrdouctDetailScreen()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50.h,
              width: 70.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  'assets/plant3.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Column(
              children: [
                Text(
                  'Calathea',
                  style: TextStyle(
                      color: green,
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp),
                ),
                Text(
                  'Its spines don\'t grow',
                  style: TextStyle(color: gry, fontSize: 12.sp),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
