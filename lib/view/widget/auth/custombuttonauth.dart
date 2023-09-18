import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class CustomAuthButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomAuthButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: Get.width,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(vertical: 13),
      color: AppColor.primaryColor,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
