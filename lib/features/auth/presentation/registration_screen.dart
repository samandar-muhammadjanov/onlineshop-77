// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/core/utils/size_config.dart';
import 'package:onlineshop_77/features/auth/data/repositories/data_repository.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_login_intro.dart';

import '../../../generated/locale_keys.g.dart';
import 'widgets/w_registration_buttons.dart';
import 'widgets/w_registration_form.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  static const String routeName = "/auth/signin";

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _userData = {
    "fullName": "",
    "productName": "",
    "categoryId": 0,
    "phoneNumber": "",
    "address": "address"
  };
  void _submit() {
    _formKey.currentState!.save();

    DataRepository.registration(
      _userData["fullName"],
      _userData["productName"],
      _userData["categoryId"],
      _userData["phoneNumber"],
      _userData["address"],
      context,
    );
  }

  void _getUserData(String fullName, String productName, int categoryId,
      String phoneNumber, String address) {
    _userData["fullName"] = fullName;
    _userData["productName"] = productName;
    _userData["categoryId"] = categoryId;
    _userData["phoneNumber"] = phoneNumber;
    _userData["address"] = address;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppConstants.kWhiteColor,
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
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
              16, 16, 16, MediaQuery.of(context).viewInsets.bottom + 16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height -
                MediaQuery.of(context).viewPadding.top -
                MediaQuery.of(context).viewPadding.bottom -
                wi(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginIntroductionWidget(
                  text: LocaleKeys.signIn.tr(),
                ),
                WRegistrationForm(
                  formKey: _formKey,
                  getUserData: _getUserData,
                ),
                const Spacer(),
                WRegistrationButtons(
                  formKey: _formKey,
                  userData: _userData,
                  sumit: _submit,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Gap extends StatelessWidget {
  const Gap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10,
    );
  }
}
