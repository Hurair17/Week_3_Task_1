import 'package:flutter/material.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3_task/ui/custom_widget/card.dart';
import 'package:week_3_task/ui/custom_widget/card_Htile.dart';
import 'package:week_3_task/ui/custom_widget/text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3_task/ui/screens/cart/cart1.dart';
import 'package:week_3_task/ui/screens/cart/cart2.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12, top: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.ctfassets.net/hrltx12pl8hq/3j5RylRv1ZdswxcBaMi0y7/b84fa97296bd2350db6ea194c0dce7db/Music_Icon.jpg'),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Cart1()));
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
                                child: Icon(
                                  Icons.shopping_cart_sharp,
                                  size: 20.r,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
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
                    TextFomField(
                      hint: 'Search Plant',
                      icn: Icon(Icons.search),
                      wdth: 8.w,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 30.h,
                      child: TabBar(
                        unselectedLabelColor: gry,
                        isScrollable: true,
                        indicator: BoxDecoration(
                            border: Border.all(color: lightgreen),
                            borderRadius: BorderRadius.circular(50),
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
              Container(
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
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: const [
                                HorizontalCard(),
                                SizedBox(
                                  width: 10,
                                ),
                                HorizontalCard(),
                                SizedBox(
                                  width: 10,
                                ),
                                HorizontalCard(),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
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
                            height: 60.h,
                            // width: 90.w,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  HomeScreenDownCard(),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  HomeScreenDownCard(),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  HomeScreenDownCard(),
                                ]),
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
    );
  }
}
