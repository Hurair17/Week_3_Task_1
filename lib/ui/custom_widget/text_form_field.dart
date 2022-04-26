import 'package:flutter/material.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFomField extends StatelessWidget {
  final String hint;
  final Icon icn;

  final bool obsecure;

  const TextFomField({
    required this.hint,
    required this.icn,
    this.obsecure = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lightgreen,
        borderRadius: BorderRadius.circular(20.r),
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
        cursorColor: darkgren,
      ),
    );
  }
}
