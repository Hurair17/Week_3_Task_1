import 'package:flutter/material.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormField extends StatelessWidget {
  final String hint;
  final Icon icn;
  final double wdth;
  final bool obsecure;
  final String? errorText;
  final Function(String)? onChanged;

  // final String? Function(String?)? validator;
  const CustomFormField({
    this.onChanged,
    // this.validator,
    this.errorText,
    required this.hint,
    required this.icn,
    this.wdth = 20,
    this.obsecure = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 45.h,
          decoration: BoxDecoration(
            color: lightgreen,
            borderRadius: BorderRadius.circular(wdth.r),
          ),
        ),
        TextFormField(
          obscureText: obsecure,
          decoration: InputDecoration(
              prefixIcon: icn,
              // suffixIconColor: green,
              prefixIconColor: green,
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(color: darkgren),
              focusColor: darkgren,
              errorText: errorText,
              iconColor: lightgreen

              // errorStyle:
              ),

          // validator: validator,
          cursorColor: darkgren,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
