// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:week_3_task/core/models/plant.dart';
import 'package:provider/provider.dart';
import 'package:week_3_task/ui/custom_widget/wavy_path.dart';
import 'package:week_3_task/ui/screens/product/product_detail.dart';

import '../screens/home/home_view_model.dart';

class HorizontalCard extends StatelessWidget {
  Plant? plant;
  HorizontalCard({
    Key? key,
    this.plant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final homeViewModal = Provider.of<HomeViewModel>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PrdouctDetailScreen(
                        // id: id,
                        plant: plant,
                      )));
        },
        child: Stack(
          children: [
            Container(
              width: 180.w,
            ),
            Positioned(
              top: 50.h,
              child: Container(
                width: 180.w,
                height: 190.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: lightgreen,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 160, left: 5, right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${plant!.type}',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      Row(
                        children: [
                          Text('${plant!.title}'),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white),
                            height: 15.h,
                            width: 50.w,
                            // width: 20.w,
                            child: Center(
                              child: Text(
                                '\$ ${plant?.price}',
                                style: TextStyle(
                                    color: darkgren,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
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
                    color: darkgren.withOpacity(0.4),
                  ),
                ),
                clipper: BottomWaveClipper(),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Image.network(
                '${plant!.imgUrl}',
                width: 120.w,
                height: 190.h,
              ),
              height: 190,
            ),
          ],
        ),
      ),
    );
  }
}
