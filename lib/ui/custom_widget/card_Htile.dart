// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:week_3_task/core/constants/color.dart';
import 'package:week_3_task/core/models/plant.dart';
import 'package:week_3_task/ui/screens/product/product_detail.dart';

class HomeScreenDownCard extends StatelessWidget {
  String? id;
  final String? ProductId;
  String? title;
  String? shortInfo;
  String? imgUrl;
  int? quantity;
  double? price;
  HomeScreenDownCard({
    Key? key,
    this.id,
    this.ProductId,
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
        onTap: () {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => PrdouctDetailScreen(
          //                 id: id,
          //               )));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(5.r),
              height: 50.h,
              width: 70.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.yellow,
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
