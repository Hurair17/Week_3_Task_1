import 'package:flutter/material.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormField extends StatelessWidget {
  final String hint;
  final Icon icn;
  final double wdth;
  final bool obsecure;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? Function(String?)? onSaved;
  final String? Function(String?)? onChanged;

  // final String? Function(String?)? validator;
  const CustomFormField({
    this.onChanged,
    this.onSaved,
    this.controller,
    this.validator,
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
            prefixIconColor: green,
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(color: darkgren),
            focusColor: darkgren,
            iconColor: lightgreen,
          ),
          cursorColor: darkgren,
          validator: validator,
          controller: controller,
          onSaved: onSaved,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
