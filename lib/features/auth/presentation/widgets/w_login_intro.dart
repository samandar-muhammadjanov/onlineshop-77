import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../assets/constants/constants.dart';
import '../../../../generated/locale_keys.g.dart';

class LoginIntroductionWidget extends StatelessWidget {
  const LoginIntroductionWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          LocaleKeys.welcomeSub.tr(),
          style: const TextStyle(
              color: AppConstants.kDarkGreyColor,
              fontWeight: FontWeight.w500,
              fontSize: 12),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
