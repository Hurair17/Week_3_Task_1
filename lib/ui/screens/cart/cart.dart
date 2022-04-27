import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3_task/core/constants/color.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50.h, left: 15.w, right: 15.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 30.h,
                    width: 30.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ),
                ),
                Text(
                  'My Cart',
                  style: TextStyle(
                      color: green,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_sharp))
              ],
            ),
            Container(
              height: 400.h,
              child: ListView(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
