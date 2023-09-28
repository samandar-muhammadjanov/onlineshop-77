// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/auth/data/repositories/data_repository.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

import 'widgets/w_forgot_password.dart';
import 'widgets/w_login.dart';
import 'widgets/w_login_form.dart';
import 'widgets/w_login_intro.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "/auth/login";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, dynamic> userData = {"login": "", "password": ""};
  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      DataRepository.login(userData["login"], userData["password"], context);
    }
  }

  void _getLogin(
    String login,
  ) {
    userData["login"] = login;
    setState(() {});
  }

  void _getPassword(String password) {
    userData["password"] = password;
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
              LoginFormWidget(
                formKey: _formKey,
                getLogin: _getLogin,
                getPassword: _getPassword,
              ),
              const WForgotPassword(),
              const Spacer(),
              WLogin(
                formKey: _formKey,
                login: userData["login"],
                password: userData["password"],
                onPressed: _submit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
