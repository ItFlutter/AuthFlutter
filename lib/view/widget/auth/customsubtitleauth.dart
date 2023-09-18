import 'package:flutter/material.dart';

class CustomSubtitleAuth extends StatelessWidget {
  final String text;
  final Color color;
  bool? center;
  CustomSubtitleAuth(
      {Key? key, required this.text, required this.color, this.center = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: center! ? TextAlign.center : null,
      style: TextStyle(fontSize: 15, color: color, fontWeight: FontWeight.w400),
    );
  }
}
