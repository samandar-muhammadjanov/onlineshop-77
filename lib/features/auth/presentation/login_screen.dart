import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/core/routers/app_router.dart';
import 'package:onlineshop_77/core/utils/extentions.dart';
import 'package:onlineshop_77/features/auth/data/datasource/auth_datasource.dart';
import 'package:onlineshop_77/features/auth/presentation/registration_screen.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_custom_button.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_elevated_button.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_gap.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_text_field.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

import 'widgets/w_forgot_password.dart';
import 'widgets/intro_header_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

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
      // AuthDataSourceImpl.login(loginController.text, passwordController.text, context);
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
      backgroundColor: AppColors.whiteColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            AppAssets.arrowLeftSm,
            color: AppColors.blackColor,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 20, 20, MediaQuery.of(context).viewPadding.bottom + 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntroHeaderWidget(text: LocaleKeys.welcome.tr()),
              TextFieldWithTitle(
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
              TextFieldWithTitle(
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
                    color: AppColors.darkGreyColor,
                  ),
                ),
              ),
              const WForgotPassword(),
              const Spacer(),
              WElevatedButton(
                color: isValid ? AppColors.primaryColor : AppColors.greyColor,
                onPressed: _submit,
                child: Text(
                  LocaleKeys.logIn.tr(),
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.blackColor),
                ),
              ),
              const WGap(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: Divider(color: AppColors.hintColor)),
                  const SizedBox(width: 8),
                  Text(
                    LocaleKeys.wannabeSeller.tr(),
                    style: context.textTheme.labelMedium!.copyWith(
                      color: AppColors.greyTextColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(child: Divider(color: AppColors.hintColor)),
                ],
              ),
              const WGap(height: 8),
              WCustomButton(
                text: LocaleKeys.signIn.tr(),
                onPressed: () => Navigator.pushReplacementNamed(context, Routes.signIn),
                hasBorder: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
