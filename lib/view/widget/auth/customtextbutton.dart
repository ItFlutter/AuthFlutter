import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color color;
  final FontWeight? fontWeight;
  const CustomTextButton(
      {Key? key,
      required this.text,
      this.onPressed,
      required this.color,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 0)),
          onPressed: onPressed,
          child: Text(
            text,
            style:
                TextStyle(fontSize: 13, color: color, fontWeight: fontWeight),
          )),
    );
  }
}
