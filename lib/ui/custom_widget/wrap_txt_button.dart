import 'package:flutter/material.dart';
import 'package:week_3_task/core/constants/color.dart';

class CustWrapButton extends StatelessWidget {
  String txt1;
  String btntxt;
  CustWrapButton({
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
