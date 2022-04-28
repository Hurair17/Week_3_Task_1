import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:week_3_task/ui/screens/product/product_detail.dart';
import 'package:provider/provider.dart';
import 'package:week_3_task/ui/screens/cart/cart_view_model.dart';
import 'package:week_3_task/ui/screens/product/product_detail_view_mode.dart';

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
          color: const Color.fromARGB(255, 168, 197, 169),
        ),
        child: SizedBox(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrdouctDetailScreen()));
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
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () =>
                                context.read<CartItemsViewModel>().increment(),
                            child: Container(
                              height: 15.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                border: Border.all(color: green),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 10.r,
                                color: green,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            '${context.watch<CartItemsViewModel>().items}',
                            style: TextStyle(color: green),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          InkWell(
                            onTap: () {
                              context.read<CartItemsViewModel>().decrement();
                            },
                            child: Container(
                              height: 15.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                border: Border.all(color: green),
                              ),
                              child: Icon(
                                Icons.remove,
                                size: 10.r,
                                color: green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 70.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // const Icon(Icons.more_vert),
                      SizedBox(
                        height: 30.h,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            iconDisabledColor: green,
                            iconEnabledColor: green,
                            icon: const Icon(Icons.more_vert_sharp),
                            menuMaxHeight: 25.h,
                            onChanged: (String? newValue) {},
                            items: <String>['Delete']
                                .map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  onTap: () {
                                    context
                                        .read<ProductDetailViewModel>()
                                        .btndecrement();
                                  },
                                  value: value,
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 15.r,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          value,
                                          style: TextStyle(
                                              fontSize: 15.sp, color: green),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                            onTap: () {},
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      Text(
                        '\$ ${context.watch<CartItemsViewModel>().itemPrice}',
                        style: TextStyle(
                            color: lightgreen, fontWeight: FontWeight.w800),
                      )
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
