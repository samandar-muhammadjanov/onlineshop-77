import 'package:onlineshop_77/assets/constants/app_colors.dart';
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';

class WProfileBodyItem extends StatelessWidget {
  const WProfileBodyItem(
      {super.key, required this.svg, required this.title, this.onPressed});
  final String svg;
  final String title;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.backgroundColor),
            borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          minLeadingWidth: 0,
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(
            svg,
            width: 24,
            color: AppColors.greyTextColor,
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
