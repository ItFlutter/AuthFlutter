import 'package:flutter/material.dart';

class CustomTitleAuth extends StatelessWidget {
  final String text;
  final Color color;
  double? size = 18;
  CustomTitleAuth(
      {Key? key, required this.text, required this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: size, color: color, fontWeight: FontWeight.bold),
    );
  }
}
