import 'package:flutter/material.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ValButton extends StatelessWidget {
  final Widget next;
  final String txt;
  final int wdt;
  final int hight;
  final int buttonRaduis;
  final bool check;
  const ValButton({
    required this.next,
    required this.txt,
    this.hight = 45,
    this.wdt = 320,
    this.buttonRaduis = 25,
    this.check = false,
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
        if (check == true) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => next));
        } else {
          null;
        }
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
