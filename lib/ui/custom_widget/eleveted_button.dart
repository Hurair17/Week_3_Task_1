import 'package:flutter/material.dart';
import 'package:week_3_task/core/constants/color.dart';

class CustElevetedButton extends StatelessWidget {
  Widget next;
  String txt;
  CustElevetedButton({
    required this.next,
    required this.txt,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: darkgren,
        onPrimary: black,
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        minimumSize: const Size(320, 45),
        alignment: Alignment.center,
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => next));
      },
      child: const Text(
        'Log in',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
