import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:week_3_task/core/models/cartModel.dart';
import 'package:week_3_task/ui/custom_widget/cart_page_card.dart';
import 'package:week_3_task/ui/custom_widget/eleveted_button.dart';
import 'package:week_3_task/ui/screens/cart/cart_view_model.dart';

import 'package:week_3_task/ui/screens/product/product_detail_view_mode.dart';
import 'package:week_3_task/ui/screens/root.dart';
import 'package:provider/provider.dart';

class Cart2 extends StatelessWidget {
  String? id;
  Cart2({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50.h, left: 15.w, right: 15.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icon Buttun with Navigation POP to go back
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
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.more_vert_sharp))
                ],
              ),

              // List of Cart Items
              SizedBox(
                  height: 360.h,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: cartViewModel.itemCount,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: CartScreenCard(
                            ProductId: cartViewModel.items.keys.toList()[index],
                            id: cartViewModel.items.values.toList()[index].id,
                            title: cartViewModel.items.values
                                .toList()[index]
                                .title,
                            quantity: cartViewModel.items.values
                                .toList()[index]
                                .quantity,
                            shortInfo: cartViewModel.items.values
                                .toList()[index]
                                .shortInfo,
                            price: cartViewModel.items.values
                                .toList()[index]
                                .price,
                            imgUrl: cartViewModel.items.values
                                .toList()[index]
                                .imgUrl,
                          ),
                        );
                      })),

              //Calculaion of Prices
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                // Bottom Calculation of Prices
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: TextStyle(color: green, fontSize: 15.sp),
                        ),
                        Text(
                          '\$ ${(cartViewModel.totalAmount).toStringAsFixed(2)}',
                          style: TextStyle(color: green, fontSize: 15.sp),
                        )
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping cost',
                          style: TextStyle(color: green, fontSize: 15.sp),
                        ),
                        Text(
                          '\$10.40',
                          style: TextStyle(color: green, fontSize: 15.sp),
                        )
                      ],
                    ),
                    Divider(
                      color: gry,
                      height: 45.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                              color: green,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '\$ ${(10.40 + cartViewModel.totalAmount).toStringAsFixed(2)}',
                          style: TextStyle(
                              color: green,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    // Button: Place Your Order
                    const CustElevetedButton(
                      next: RootBar(),
                      txt: 'Place your order',
                      hight: 40,
                      wdt: 350,
                      buttonRaduis: 10,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
