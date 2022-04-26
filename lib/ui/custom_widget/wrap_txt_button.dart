import 'package:flutter/material.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustWrapButton1 extends StatelessWidget {
  String txt1;
  String btntxt;
  CustWrapButton1({
    required this.txt1,
    required this.btntxt,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          txt1,
          style: TextStyle(color: gry),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              btntxt,
              style: TextStyle(
                color: darkgren,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w800,
              ),
            ))
      ],
    );
  }
}

class CustWrapButton2 extends StatelessWidget {
  String txt1;
  String btntxt;
  double wdth;
  CustWrapButton2({
    required this.txt1,
    required this.btntxt,
    required this.wdth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 20.h,
        width: wdth.w,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.start,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                btntxt,
                style: TextStyle(
                  color: darkgren,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Text(
              txt1,
              style: TextStyle(color: gry),
            ),
          ],
        ),
      ),
    );
  }
}
