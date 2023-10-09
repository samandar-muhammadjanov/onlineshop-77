import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/core/routers/app_router.dart';
import 'package:onlineshop_77/core/utils/extentions.dart';
import 'package:onlineshop_77/features/profile/presentation/widgets/w_profile_body_items.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

class WProfileBodyDetail extends StatelessWidget {
  WProfileBodyDetail({
    super.key,
  });

  ValueNotifier<bool> switcherListener = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.backgroundColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: SvgPicture.asset(AppAssets.bellProfile),
            minLeadingWidth: 0,
            contentPadding: EdgeInsets.zero,
            title: Text(
              LocaleKeys.notification.tr(),
              style: context.textTheme.headlineLarge!.copyWith(
                color: AppColors.blackColor,
              ),
            ),
            trailing: ValueListenableBuilder(
              builder: (BuildContext context, value, Widget? child) {
                return CupertinoSwitch(
                  value: value,
                  onChanged: (value) {
                    switcherListener.value = value;
                  },
                );
              },
              valueListenable: switcherListener,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        ProfileActionItem(
          onPressed: () => Navigator.pushNamed(context, Routes.dashboard),
          svg: AppAssets.privacy,
          title: LocaleKeys.termsofuse.tr(),
        ),
        const SizedBox(
          height: 12,
        ),
        ProfileActionItem(
          onPressed: () => Navigator.pushNamed(context, Routes.dashboard),
          svg: AppAssets.about,
          title: LocaleKeys.aboutApp.tr(),
        ),
      ],
    );
  }
}
