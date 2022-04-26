import 'package:flutter/material.dart';
import 'package:week_3_task/core/constants/color.dart';

class CustElevetedButton extends StatelessWidget {
  final Widget next;
  final String txt;
  const CustElevetedButton({
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
