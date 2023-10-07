import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';

class WEmptyResult extends StatelessWidget {
  const WEmptyResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.emptySearch),
        const Text(
          "Ничего не найдено",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const Text(
          "Упс! Мы не смогли найти ни одного подходящего результата по вашему запросу",
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.greyTextColor),
        )
      ],
    );
  }
}
