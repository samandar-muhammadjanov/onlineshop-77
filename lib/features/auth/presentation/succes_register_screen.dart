// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/home/presentation/dashboard.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

class SuccessRegisterScreen extends StatelessWidget {
  const SuccessRegisterScreen({super.key});
  static const String routeName = "/auth/register/success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.kWhiteColor,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            AppAssets.arrowLeftSm,
            color: AppConstants.kBlackColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SvgPicture.asset(AppAssets.successWishlist),
              const SizedBox(
                height: 16,
              ),
              Text(
                LocaleKeys.successTitle.tr(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                LocaleKeys.successSub.tr(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppConstants.kGreyTextColor,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, Dashboard.routeName, (route) => false),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: AppConstants.kWhiteColor,
                  minimumSize: const Size(double.infinity, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  LocaleKeys.main.tr(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
