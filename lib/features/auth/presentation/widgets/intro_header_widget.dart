import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/core/utils/extentions.dart';

import '../../../../assets/constants/constants.dart';
import '../../../../generated/locale_keys.g.dart';

class IntroHeaderWidget extends StatelessWidget {
  const IntroHeaderWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: context.textTheme.displayMedium!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          LocaleKeys.welcomeSub.tr(),
          style: context.textTheme.headlineSmall!.copyWith(
            color: AppColors.greyTextColor,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
