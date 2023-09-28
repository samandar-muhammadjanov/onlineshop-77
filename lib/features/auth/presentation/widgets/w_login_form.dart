// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../assets/assets.dart';
import '../../../../assets/constants/constants.dart';
import '../../../../generated/locale_keys.g.dart';
import 'w_gap.dart';
import 'w_text_field.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({
    super.key,
    required this.formKey,
    required this.getLogin,
    required this.getPassword,
  });
  final GlobalKey<FormState> formKey;
  final Function(String) getLogin;
  final Function(String) getPassword;
  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WTextField(
          onSaved: (value) {
            widget.getLogin(value);
          },
          title: LocaleKeys.login.tr(),
          hint: LocaleKeys.enterLogin.tr(),
          validator: (value) {
            if (value!.isEmpty) {
              return '';
            }
            return null;
          },
        ),
        const WGap(height: 16),
        WTextField(
          keyboardType: TextInputType.visiblePassword,
          onSaved: (value) {
            widget.getPassword(value);
          },
          obscureText: isPasswordVisible,
          title: LocaleKeys.password.tr(),
          hint: LocaleKeys.enterPassword.tr(),
          validator: (value) {
            if (value!.isEmpty) {
              return '';
            }
            return null;
          },
          suffix: IconButton(
            onPressed: showPassword,
            icon: SvgPicture.asset(
              isPasswordVisible ? AppAssets.eyeOpen : AppAssets.eyeClosed,
              color: AppConstants.kDarkGreyColor,
            ),
          ),
        ),
      ],
    );
  }

  void showPassword() {
    isPasswordVisible = !isPasswordVisible;
    setState(() {});
  }
}
