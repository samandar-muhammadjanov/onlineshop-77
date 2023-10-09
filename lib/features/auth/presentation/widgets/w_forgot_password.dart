import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/core/utils/extentions.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

class WForgotPassword extends StatelessWidget {
  const WForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => AppSingleton.showForgotPassword(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          LocaleKeys.forgotPassword.tr(),
          style: context.textTheme.bodySmall!.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
