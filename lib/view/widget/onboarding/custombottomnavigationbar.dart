import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final String buttonText1;
  final String buttonText2;
  final bool isFirstPage;
  final void Function()? onPressedButton1;
  final void Function()? onPressedButton2;
  const CustomBottomNavigationBar(
      {Key? key,
      required this.buttonText1,
      required this.isFirstPage,
      required this.buttonText2,
      required this.onPressedButton1,
      required this.onPressedButton2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isFirstPage
        ? Row(
            children: [
              const Spacer(),
              Container(
                  width: 150,
                  height: 75,
                  padding: const EdgeInsets.only(right: 22, bottom: 20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: onPressedButton2,
                    color: AppColor.primaryColor,
                    textColor: Colors.white,
                    child: Text(
                      buttonText2,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  )),
            ],
          )
        : Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 40, bottom: 20),
                child: MaterialButton(
                  onPressed: onPressedButton1,
                  child: Text(
                    buttonText1,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: AppColor.primaryColor),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: 150,
                height: 75,
                padding: const EdgeInsets.only(right: 22, bottom: 20),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: onPressedButton2,
                  color: AppColor.primaryColor,
                  textColor: Colors.white,
                  child: Text(
                    buttonText2,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          );
  }
}
