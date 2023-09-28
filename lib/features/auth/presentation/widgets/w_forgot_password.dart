import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../assets/constants/constants.dart';
import '../../../../core/singleton/singleton.dart';
import '../../../../generated/locale_keys.g.dart';

class WForgotPassword extends StatelessWidget {
  const WForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppSingleton.showForgotPassword(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          LocaleKeys.forgotPassword.tr(),
          style: const TextStyle(color: AppConstants.kPrimaryColor),
        ),
      ),
    );
  }
}
