import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/core/routers/app_router.dart';
import 'package:onlineshop_77/core/utils/extentions.dart';

import '../../../../generated/locale_keys.g.dart';
import '../registration_screen.dart';
import 'w_custom_button.dart';

class WRegistrationButtons extends StatelessWidget {
  const WRegistrationButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        WCustomButton(
          text: LocaleKeys.signIn.tr(),
          onPressed: () {},
        ),
        const Gap(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 30, child: Divider(color: AppColors.hintColor)),
            const SizedBox(width: 8),
            Text(
              LocaleKeys.urSeller.tr(),
              style: context.textTheme.labelMedium!.copyWith(
                color: AppColors.greyTextColor,
              ),
            ),
            const SizedBox(width: 8),
            const SizedBox(width: 30, child: Divider(color: AppColors.hintColor)),
          ],
        ),
        const Gap(),
        WCustomButton(
          text: LocaleKeys.logIn.tr(),
          onPressed: () => Navigator.pushReplacementNamed(context, Routes.login),
          hasBorder: true,
        )
      ],
    );
  }
}
