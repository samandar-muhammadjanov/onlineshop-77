import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop_77/features/auth/presentation/registration_screen.dart';

import '../../../../assets/constants/constants.dart';
import '../../../../generated/locale_keys.g.dart';
import 'w_custom_button.dart';
import 'w_gap.dart';

class WLogin extends StatelessWidget {
  const WLogin({
    super.key,
    required this.formKey,
    required this.login,
    required this.password,
    required this.onPressed,
  });
  final GlobalKey<FormState> formKey;
  final String login;
  final String password;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WCustomButton(
          text: LocaleKeys.logIn.tr(),
          onPressed: onPressed,
        ),
        const WGap(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Divider(),
            Text(
              LocaleKeys.wannabeSeller.tr(),
              style: const TextStyle(
                  color: AppConstants.kDarkGreyColor, fontSize: 12),
            ),
            const Divider(),
          ],
        ),
        const WGap(height: 8),
        WCustomButton(
          text: LocaleKeys.signIn.tr(),
          onPressed: () => Navigator.pushReplacementNamed(
              context, RegistrationScreen.routeName),
          hasBorder: true,
        )
      ],
    );
  }
}
