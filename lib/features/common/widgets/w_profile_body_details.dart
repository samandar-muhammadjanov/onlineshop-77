import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/core/routers/app_router.dart';
import 'package:onlineshop_77/features/common/widgets/w_profile_body_items.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

class WProfileBodyDetail extends StatelessWidget {
  const WProfileBodyDetail({
    super.key,
  });

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
              borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            leading: SvgPicture.asset(
              AppAssets.bell,
              width: 24,
              color: AppColors.greyTextColor,
            ),
            minLeadingWidth: 0,
            contentPadding: EdgeInsets.zero,
            title: Text(
              LocaleKeys.notification.tr(),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            trailing: CupertinoSwitch(
              value: false,
              onChanged: (value) {},
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        WProfileBodyItem(
          onPressed: () =>
              Navigator.pushNamed(context, Routes.dashboard),
          svg: AppAssets.file,
          title: LocaleKeys.termsofuse.tr(),
        ),
        const SizedBox(
          height: 12,
        ),
        WProfileBodyItem(
          onPressed: () =>
              Navigator.pushNamed(context, Routes.dashboard),
          svg: AppAssets.info,
          title: LocaleKeys.aboutApp.tr(),
        ),
      ],
    );
  }
}