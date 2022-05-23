// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:week_3_task/core/constants/color.dart';
import 'package:week_3_task/ui/screens/cart/cart_view_model.dart';
import 'package:week_3_task/ui/screens/product/product_detail_view_mode.dart';

class CartScreenCard extends StatelessWidget {
  String? id;
  final String? ProductId;
  String? title;
  String? shortInfo;
  String? imgUrl;
  int? quantity;
  double? price;

  CartScreenCard({
    Key? key,
    this.ProductId,
    this.id,
    this.title,
    this.shortInfo,
    this.imgUrl,
    this.quantity,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartViewModel>(context);
    print(id);
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
              // Navigator.push(
              //     context,
              // MaterialPageRoute(
              // builder: (context) =>  PrdouctDetailScreen()));
            },
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.yellow),
                  height: 60.h,
                  width: 60.w,
                  child: Image.asset(
                    '$imgUrl',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                SizedBox(
                  height: 70.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$title",
                        style: TextStyle(
                            color: green,
                            fontWeight: FontWeight.w600,
                            fontSize: 17.sp),
                      ),
                      Text(
                        '$shortInfo',
                        style: TextStyle(color: gry, fontSize: 12.sp),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () => cart.addQuantity(id!, quantity!),
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
                            quantity.toString(),
                            style: TextStyle(color: green),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          InkWell(
                            onTap: () {
                              context
                                  .read<ProductDetailViewModel>()
                                  .decrement();
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
                // const Spacer(),
                SizedBox(
                  height: 70.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                    cart.remove(ProductId);
                                  },
                                  value: value,
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 9.r,
                                        ),
                                        Text(
                                          value,
                                          style: TextStyle(
                                              fontSize: 12.sp, color: green),
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
                        '\$ $price',
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
