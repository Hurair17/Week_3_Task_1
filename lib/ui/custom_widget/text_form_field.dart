import 'package:flutter/material.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFomField extends StatelessWidget {
  final String hint;
  final Icon icn;
  final double wdth;
  final bool obsecure;
  final bool val;
  final String txt;
  const TextFomField({
    required this.hint,
    required this.icn,
    this.wdth = 20,
    this.obsecure = false,
    this.val = false,
    required this.txt,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lightgreen,
        borderRadius: BorderRadius.circular(wdth.r),
      ),
      child: TextFormField(
        obscureText: obsecure,
        decoration: InputDecoration(
          prefixIcon: icn,
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(color: darkgren),
          focusColor: darkgren,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter $hint';
          }
          return null;
        },
        cursorColor: darkgren,
      ),
    );
  }
}
