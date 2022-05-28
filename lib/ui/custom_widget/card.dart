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
  String? id;
  HorizontalCard({
    Key? key,
    this.plant,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeViewModal = Provider.of<HomeViewModel>(context);
    final productDetailById = Provider.of<HomeViewModel>(context).findById(id);

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: InkWell(
        onTap: () {
          homeViewModal.addItem(
              productDetailById.id,
              productDetailById.price,
              productDetailById.title,
              productDetailById.shortInfo,
              productDetailById.imgUrl,
              productDetailById.quantity);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PrdouctDetailScreen(
                        id: id,
                      )));
        },
        child: Stack(
          children: [
            Container(
              width: 180.w,
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
                  color: Color.fromARGB(255, 46, 59, 47),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 80.0, left: 5, right: 5),
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
                                color: Color.fromARGB(255, 235, 230, 230)),
                            height: 20.h,
                            width: 50.w,
                            // width: 20.w,
                            child: Center(
                              child: Text(
                                '\$ ${plant?.price}',
                                style: TextStyle(
                                    color: lightgreen,
                                    fontSize: 13.sp,
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
              // child: ClipPath(
              child: Container(
                width: 180.w,
                height: 170.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.r),
                    topLeft: Radius.circular(15.r),
                  ),
                  color: Color.fromARGB(255, 208, 131, 36),
                ),
              ),
              //   clipper: BottomWaveClipper(),
              // ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Image.asset(
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
