import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/core/routers/app_router.dart';
import 'package:onlineshop_77/core/utils/extentions.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_custom_button.dart';
import 'package:onlineshop_77/features/common/widgets/w_appbar_language_item.dart';
import 'package:onlineshop_77/features/common/widgets/w_profile_body_details.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

class WProfileUnAuth extends StatelessWidget {
  const WProfileUnAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leadingWidth: 92,
        elevation: 0.5,
        centerTitle: true,
        leading: const WAppBarLanguageItem(),
        title: SvgPicture.asset(
          AppAssets.logo,
          width: 77,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            Text(
              LocaleKeys.logoutTitle.tr(),
              style: context.textTheme.displaySmall!.copyWith(color: AppColors.blackColor),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              LocaleKeys.logoutSubtitle.tr(),
              textAlign: TextAlign.center,
              style: context.textTheme.bodySmall!.copyWith(color: AppColors.greyTextColor),
            ),
            const SizedBox(
              height: 16,
            ),
            WCustomButton(
              text: LocaleKeys.logIn.tr(),
              onPressed: () => Navigator.pushNamed(context, Routes.login),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 75, child: Divider(color: AppColors.hintColor)),
                const SizedBox(width: 8),
                Text(
                  LocaleKeys.or.tr(),
                  style: context.textTheme.labelMedium!.copyWith(
                    color: AppColors.greyTextColor,
                  ),
                ),
                const SizedBox(width: 8),
                const SizedBox(width: 75, child: Divider(color: AppColors.hintColor)),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            WCustomButton(
              text: LocaleKeys.signIn.tr(),
              onPressed: () => Navigator.pushNamed(context, Routes.signIn),
              hasBorder: true,
            ),
            const SizedBox(height: 16),
            const Divider(color: AppColors.hintColor),
            const SizedBox(height: 16),
            WProfileBodyDetail()
          ],
        ),
      ),
    );
  }
}
