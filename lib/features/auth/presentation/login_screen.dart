// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/auth/data/repositories/data_repository.dart';
import 'package:onlineshop_77/features/auth/presentation/registration_screen.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_custom_button.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_elevated_button.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_gap.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_text_field.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

import 'widgets/w_forgot_password.dart';
import 'widgets/w_login_intro.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "/auth/login";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isValid = false;
  void _submit() {
    if (_formKey.currentState!.validate()) {
      DataRepository.login(
          loginController.text, passwordController.text, context);
    }
  }

  bool isPasswordVisible = false;
  void showPassword() {
    isPasswordVisible = !isPasswordVisible;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.kWhiteColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            AppAssets.arrowLeftSm,
            color: AppConstants.kBlackColor,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              20.0, 20, 20, MediaQuery.of(context).viewPadding.bottom + 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginIntroductionWidget(text: LocaleKeys.welcome.tr()),
              WTextField(
                controller: loginController,
                title: LocaleKeys.login.tr(),
                hint: LocaleKeys.enterLogin.tr(),
                onFieldSubmitted: (value) => _submit(),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '*reuqired';
                  }
                  return null;
                },
              ),
              const WGap(height: 16),
              WTextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: isPasswordVisible,
                controller: passwordController,
                title: LocaleKeys.password.tr(),
                hint: LocaleKeys.enterPassword.tr(),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '*reuqired';
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
              const WForgotPassword(),
              const Spacer(),
              WElevatedButton(
                color: isValid
                    ? AppConstants.kPrimaryColor
                    : AppConstants.kGreyColor,
                onPressed: _submit,
                child: Text(
                  LocaleKeys.logIn.tr(),
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppConstants.kBlackColor),
                ),
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
          ),
        ),
      ),
    );
  }
}
