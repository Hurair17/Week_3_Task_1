import 'package:flutter/material.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustElevetedButton extends StatelessWidget {
  final Widget next;
  final String txt;
  int wdt;
  int hight;
  int buttonRaduis;
  CustElevetedButton({
    required this.next,
    required this.txt,
    this.hight = 45,
    this.wdt = 320,
    this.buttonRaduis = 25,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: darkgren,
        onPrimary: black,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRaduis.r)),
        minimumSize: Size(wdt.w, hight.h),
        alignment: Alignment.center,
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => next));
      },
      child: Text(
        txt,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
