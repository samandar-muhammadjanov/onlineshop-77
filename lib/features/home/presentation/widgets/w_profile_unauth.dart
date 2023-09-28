import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/auth/presentation/login_screen.dart';
import 'package:onlineshop_77/features/auth/presentation/registration_screen.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_custom_button.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_profile_body_details.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

class WProfileUnAuth extends StatelessWidget {
  const WProfileUnAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.kWhiteColor,
      appBar: AppBar(
        elevation: 0.4,
        title: Text(
          LocaleKeys.profile.tr(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.logoutTitle.tr(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                LocaleKeys.logoutSubtitle.tr(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppConstants.kDarkGreyColor),
              ),
              const SizedBox(
                height: 16,
              ),
              WCustomButton(
                text: LocaleKeys.logIn.tr(),
                onPressed: () =>
                    Navigator.pushNamed(context, LoginScreen.routeName),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Divider(),
                  Text(LocaleKeys.or.tr()),
                  const Divider(),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              WCustomButton(
                text: LocaleKeys.signIn.tr(),
                onPressed: () =>
                    Navigator.pushNamed(context, RegistrationScreen.routeName),
                hasBorder: true,
              ),
              const SizedBox(
                height: 20,
              ),
              const WProfileBodyDetail()
            ],
          ),
        ),
      ),
    );
  }
}
