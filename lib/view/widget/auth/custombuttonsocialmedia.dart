import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constant/colors.dart';

class CustomButtonSocialMedia extends StatelessWidget {
  final void Function()? onTap;
  final String svgName;
  const CustomButtonSocialMedia({
    Key? key,
    required this.svgName,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: CircleAvatar(
            maxRadius: 18,
            backgroundColor: AppColor.grey.withOpacity(0.3),
            child: SvgPicture.asset(svgName)),
      ),
    );
  }
}
