import 'package:flutter/material.dart';
import '../../../core/constant/colors.dart';

class CustomButtonAppBar extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomButtonAppBar({Key? key, required this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: MaterialButton(
        minWidth: 10,
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, color: AppColor.primaryColor),
        ),
      ),
    );
  }
}
