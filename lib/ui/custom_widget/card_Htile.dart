import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:week_3_task/core/constants/color.dart';

// ignore: must_be_immutable
class HomeScreenDownCard extends StatelessWidget {
  String? id;
  final String? productId;
  String? title;
  String? shortInfo;
  String? imgUrl;
  int? quantity;
  double? price;
  HomeScreenDownCard({
    Key? key,
    this.id,
    this.productId,
    this.title,
    this.shortInfo,
    this.imgUrl,
    this.quantity,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(5.r),
              height: 50.h,
              width: 70.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: lightgreen,
              ),
              child: Image.asset(
                '$imgUrl',
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$title',
                    style: TextStyle(
                        color: green,
                        fontWeight: FontWeight.w600,
                        fontSize: 17.sp),
                  ),
                  Text(
                    '$shortInfo',
                    style: TextStyle(color: gry, fontSize: 12.sp),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
