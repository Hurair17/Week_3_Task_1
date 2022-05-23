import 'package:flutter/material.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3_task/ui/custom_widget/card.dart';
import 'package:week_3_task/ui/custom_widget/card_htile.dart';
import 'package:week_3_task/ui/custom_widget/text_form_field.dart';
import 'package:badges/badges.dart';
import 'package:week_3_task/ui/screens/home/home_view_model.dart';

import 'package:week_3_task/ui/screens/product/product_detail_view_mode.dart';
import 'package:week_3_task/ui/screens/cart/cart1.dart';
import 'package:provider/provider.dart';

import '../cart/cart_view_model.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, value, child) => SingleChildScrollView(
        child: SafeArea(
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CircleAvatar and CartIcon Button
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage('assets/my1.jpg'),
                          ),
                          const Spacer(),
                          // Cart Icon Button
                          // Consumer<CartViewModel>(
                          //   builder: (context, value, child) =>
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Cart1()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: darkgren,
                              ),
                              width: 30.w,
                              height: 30.h,
                              alignment: Alignment.topRight,
                              child: Center(
                                // Cart Badge for Number of items in Cart
                                child: Badge(
                                  showBadge:
                                      context.read<CartViewModel>().getlable,
                                  badgeContent: Text(
                                      '${context.watch<CartViewModel>().itemCount}'),
                                  badgeColor: Colors.white,
                                  child: Icon(
                                    Icons.shopping_cart_sharp,
                                    size: 20.r,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Let\'s find your plants!',
                        style: TextStyle(color: darkgren, fontSize: 40.sp),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      //Custom Text Field
                      TextFomField(
                        val: false,
                        txt: 'Search',
                        hint: 'Search Plant',
                        icn: const Icon(Icons.search),
                        wdth: 8.w,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),

                      // TabBar
                      SizedBox(
                        height: 30.h,
                        child: TabBar(
                          unselectedLabelColor: gry,
                          isScrollable: true,
                          indicator: BoxDecoration(
                              border: Border.all(color: lightgreen),
                              borderRadius: BorderRadius.circular(50.r),
                              color: lightgreen),
                          labelColor: darkgren,
                          labelStyle: TextStyle(
                              color: green,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700),
                          unselectedLabelStyle:
                              TextStyle(color: gry, fontSize: 13.sp),
                          tabs: const [
                            Tab(
                              text: 'Reccomended',
                            ),
                            Tab(
                              text: 'Top',
                            ),
                            Tab(
                              text: 'Indoor',
                            ),
                            Tab(
                              text: 'Outdoor',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                // TabBar View
                SizedBox(
                  height: 330.h,
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 240.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: value.plants.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return HorizontalCard(
                                    plant: value.plants[index],
                                    id: value.plants[index].id,
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Recent View',
                              style: TextStyle(
                                  color: green,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            SizedBox(
                              height: 50.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: value.plants.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return HomeScreenDownCard(
                                    plant: value.plants[index],
                                    id: value.plants[index].id,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Center(
                        child: Text('Top das'),
                      ),
                      const Center(
                        child: Text('Indoor'),
                      ),
                      const Center(
                        child: Text('Outdoor'),
                      ),
                    ],
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
