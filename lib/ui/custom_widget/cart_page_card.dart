import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:week_3_task/ui/screens/product/product_detail.dart';

class CartScreenCard extends StatelessWidget {
  const CartScreenCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 80.h,
        padding: EdgeInsets.only(right: 10.w, left: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: Color.fromARGB(255, 168, 197, 169),
        ),
        child: SizedBox(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PrdouctDetailScreen()));
            },
            child: Row(
              children: [
                SizedBox(
                  height: 70.h,
                  width: 80.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset(
                      'assets/plant3.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                SizedBox(
                  height: 70.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 15.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 10.r,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text('0'),
                          SizedBox(
                            width: 8.w,
                          ),
                          Container(
                            height: 15.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(),
                            ),
                            child: Icon(
                              Icons.remove,
                              size: 10.r,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 70.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.more_vert),
                      SizedBox(
                        height: 19.h,
                      ),
                      Text('\$23.3')
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
