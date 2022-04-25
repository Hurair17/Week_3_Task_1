import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height.h - 55.h);

    path.quadraticBezierTo(size.width.w / 3.25, size.height.h - 10.h,
        size.width, size.height.h - 100.h);

    path.lineTo(size.width.w, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
