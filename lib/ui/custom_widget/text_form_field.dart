import 'package:flutter/material.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFomField extends StatelessWidget {
  String hint;
  Icon icn;

  bool obsecure;

  TextFomField({
    required this.hint,
    required this.icn,
    this.obsecure = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure,
      decoration: InputDecoration(
        prefixIcon: icn,
        prefixIconColor: darkgren,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 177, 203, 178), width: 20),
          borderRadius: BorderRadius.circular(15.w),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 177, 203, 178), width: 20),
            borderRadius: BorderRadius.circular(15.w)),
        hintText: hint,
        filled: true,
        fillColor: const Color.fromARGB(255, 177, 203, 178),
      ),
    );
  }
}
