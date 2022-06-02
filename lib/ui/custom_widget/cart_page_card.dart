// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:week_3_task/core/constants/color.dart';
import 'package:week_3_task/core/models/cart_model.dart';
import 'package:week_3_task/ui/screens/cart/cart_view_model.dart';
import 'package:week_3_task/ui/screens/home/home_view_model.dart';

class CartScreenCard extends StatelessWidget {
  CartModel? cartModel;
  int? count;

  CartScreenCard({Key? key, this.cartModel, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartViewModel cart = Provider.of<CartViewModel>(context);
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
            onTap: () {},
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: lightgreen.withOpacity(0.7)),
                  height: 60.h,
                  width: 60.w,
                  child: Image.network(
                    '${cartModel!.imgUrl}',
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
                        "${cartModel!.title}",
                        style: TextStyle(
                            color: green,
                            fontWeight: FontWeight.w600,
                            fontSize: 17.sp),
                      ),
                      Text(
                        '${cartModel!.shortInfo}',
                        style: TextStyle(color: gry, fontSize: 12.sp),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              cart.incrementQuantity(cartModel!.cartId);
                            },
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
                            '${cartModel!.quantity}',
                            // 's',
                            style: TextStyle(color: green),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          InkWell(
                            onTap: () {
                              // cart.removeItem(
                              //     productDetailById.id,
                              //     productDetailById.price,
                              //     productDetailById.title,
                              //     productDetailById.shortInfo,
                              //     productDetailById.imgUrl,
                              //     productDetailById.quantity);
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
                Spacer(),
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
                                    // cart.remove(ProductId);
                                    cart.deleteCartPlant(cartModel!.cartId!);
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
                        '\$ ${cartModel!.price}',
                        style: TextStyle(
                            color: green, fontWeight: FontWeight.w800),
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
