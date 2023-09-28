import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';

import '../../../../generated/locale_keys.g.dart';
import '../login_screen.dart';
import '../registration_screen.dart';
import 'w_custom_button.dart';

class WRegistrationButtons extends StatelessWidget {
  const WRegistrationButtons(
      {super.key,
      required this.formKey,
      required this.userData,
      required this.sumit});
  final GlobalKey<FormState> formKey;
  final Map<String, dynamic> userData;
  final Function() sumit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WCustomButton(
          text: LocaleKeys.signIn.tr(),
          onPressed: () {
            sumit();
          },
        ),
        const Gap(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Divider(),
            Text(
              LocaleKeys.urSeller.tr(),
              style: const TextStyle(
                  color: AppConstants.kDarkGreyColor, fontSize: 12),
            ),
            const Divider(),
          ],
        ),
        const Gap(),
        WCustomButton(
          text: LocaleKeys.logIn.tr(),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, LoginScreen.routeName),
          hasBorder: true,
        )
      ],
    );
  }
}
