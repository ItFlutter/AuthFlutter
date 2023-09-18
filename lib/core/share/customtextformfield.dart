import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../function/validator.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  bool? password = false;
  bool? number = false;
  final String? Function(String?)? validator;
  final void Function()? onPressedSuffixIcon;

  CustomTextFormField({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.password,
    this.number,
    this.onPressedSuffixIcon,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: number == true ? TextInputType.number : TextInputType.name,
      obscureText: password == true ? true : false,
      cursorColor: AppColor.primaryColor,
      decoration: InputDecoration(
          isDense: true,
          prefixIcon: Icon(prefixIcon, color: AppColor.primaryColor, size: 25),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColor.primaryColor)),
          hintText: hintText,
          suffixIcon: IconButton(
              onPressed: onPressedSuffixIcon,
              icon: Icon(
                suffixIcon,
                size: 25,
                color: AppColor.grey2,
              )),
          hintStyle: const TextStyle(
              color: AppColor.grey2,
              fontSize: 14,
              fontWeight: FontWeight.w300)),
    );
  }
}
