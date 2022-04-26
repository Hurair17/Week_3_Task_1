import 'package:flutter/material.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3_task/ui/custom_widget/text_form_field.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12, top: 15, right: 15),
              child: Column(
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
                    wdth: 10.w,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
