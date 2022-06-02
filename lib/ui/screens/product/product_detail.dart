import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:provider/provider.dart';
import 'package:week_3_task/ui/screens/cart/cart2.dart';
import 'package:week_3_task/ui/screens/cart/cart_view_model.dart';
import 'package:week_3_task/ui/screens/home/home_view_model.dart';
import 'package:week_3_task/ui/screens/product/product_view_model.dart';

import '../../../core/models/plant.dart';

class PrdouctDetailScreen extends StatefulWidget {
  Plant? plant;
  // String? id;
  PrdouctDetailScreen({Key? key, required this.plant}) : super(key: key);

  @override
  State<PrdouctDetailScreen> createState() => _PrdouctDetailScreenState();
}

class _PrdouctDetailScreenState extends State<PrdouctDetailScreen> {
  @override
  int count = 1;
  Widget build(BuildContext context) {
    // final homeViewModel = Provider.of<HomeViewModel>(context);
    final cart = Provider.of<CartViewModel>(context);
    int quantity = 1;
    return ChangeNotifierProvider(
      create: (context) => ProductViewModel(),
      child: Consumer<ProductViewModel>(
        builder: (context, value, child) => Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                SizedBox(
                  height: 690.h,
                ),

                // Product Image
                FullScreenWidget(
                  child: Hero(
                    tag: 'Prdouct Image',
                    child: Image.network(
                      '${widget.plant!.imgUrl}',
                      height: 400.h,
                      width: 360.w,
                    ),
                  ),
                ),

                // Top Back Arrow Button and Favorite Icon
                Positioned(
                    top: 50.h,
                    left: 20.w,
                    child: Row(
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
                              )),
                        ),
                        // Spacer(),
                        SizedBox(
                          width: 260.w,
                        ),
                        Container(
                          height: 30.h,
                          width: 30.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 75, 126, 77)),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.heart_broken_sharp,
                                color: Colors.white,
                                size: 20,
                              )),
                        ),
                      ],
                    )),

                // Product Detail List like Name Price Amout etc
                Positioned(
                  top: 400.h,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${widget.plant!.title}',
                                    style: TextStyle(
                                        color: green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.sp),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '\$${widget.plant!.price}',
                                        style: TextStyle(
                                            fontSize: 11.sp, color: gry),
                                      ),
                                      const Star(),
                                      const Star(),
                                      const Star(),
                                      const Star(),
                                      const Star(),
                                    ],
                                  ),
                                ],
                              ),
                              // Spacer(),
                              SizedBox(
                                width: 157.w,
                              ),

                              Row(
                                children: [
                                  // productDetailById.qunatity++,
                                  // homeViewModel.findByIdIncrement(id),
                                  // child:
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        count++;
                                      });
                                    },
                                    child: Container(
                                      height: 15.h,
                                      width: 15.w,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                        color: green,
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        size: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  // ),
                                  Container(
                                    height: 15.h,
                                    width: 25.w,
                                    color: green,
                                    child: Center(
                                      child: Text(
                                        '${count}',
                                        // '${productDetailById.qunatity}',
                                        // homeViewModel.findByIdShow(id),
                                        // '${context.watch<CartViewModel>().show(productDetailById.qunatity)}',

                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  // InkWell(onTap: () {
                                  //   setState(() {
                                  //     count--;
                                  //   });
                                  // }),
                                  // productDetailById.qunatity--,
                                  // homeViewModel.findByIdIdecrement(id),
                                  //   child:
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        count--;
                                      });
                                    },
                                    child: Container(
                                      height: 15.h,
                                      width: 15.w,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                        color: green,
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        size: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                          // ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'About',
                            style: TextStyle(
                                color: green,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          SizedBox(
                            height: 60.h,
                            width: 330.w,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: RichText(
                                maxLines: 4,
                                text: TextSpan(
                                  text: '${widget.plant!.description}',
                                  style:
                                      TextStyle(color: green, fontSize: 12.sp),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          SizedBox(
                            width: 338.w,
                            height: 45.h,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Row(
                                  children: [
                                    const RowWidgetDown(
                                      txt1: 'Height',
                                      txt2: '8.2"',
                                      icon: Icons.height,
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    const RowWidgetDown(
                                        txt1: 'Humdaity',
                                        txt2: '62%',
                                        icon: Icons.water),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    const RowWidgetDown(
                                        txt1: 'Height',
                                        txt2: '8.2"',
                                        icon: Icons.height),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    const RowWidgetDown(
                                        txt1: 'Height',
                                        txt2: '8.2"',
                                        icon: Icons.height),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: green,
                                ),
                                height: 40.h,
                                width: 44.w,
                                child: const Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              InkWell(
                                onTap: () {
                                  cart.totalAmount();
                                  value.putPlantsData(
                                      cartId: widget.plant!.id,
                                      price: widget.plant!.price,
                                      title: widget.plant!.title,
                                      shortInfo: widget.plant!.shortInfo,
                                      imgUrl: widget.plant!.imgUrl,
                                      quantity: count);
                                  cart.getCartPlantsData();
                                  cart.totalAmount();

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Cart2(
                                            // id: productDetailById.id,
                                            )),
                                  );
                                },
                                child: Container(
                                  height: 40.h,
                                  width: 270.w,
                                  decoration: BoxDecoration(
                                    color: green,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.bookmark,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Text(
                                        'Buy Now',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Horizontal ListView of Height Humidity etc
class RowWidgetDown extends StatelessWidget {
  final String txt1;
  final String txt2;
  final IconData icon;
  const RowWidgetDown(
      {Key? key, required this.txt1, required this.txt2, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: green,
          ),
          height: 30.h,
          width: 35.w,
          child: Center(
            child: Icon(
              icon,
              size: 25.r,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 12.w,
        ),
        SizedBox(
          height: 30.h,
          child: Column(
            children: [
              Text(
                txt1,
                style: TextStyle(color: green, fontSize: 12.sp),
              ),
              Text(
                txt2,
                style: TextStyle(
                    color: green, fontSize: 13.sp, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        )
      ],
    );
  }
}

//Product Review Stars
class Star extends StatelessWidget {
  const Star({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.star,
      color: Colors.amber,
      size: 12,
    );
  }
}
