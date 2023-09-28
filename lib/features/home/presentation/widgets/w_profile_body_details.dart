import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/core/utils/extentions.dart';
import 'package:onlineshop_77/features/home/presentation/settings_screen.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_language_modal_popup.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_profile_body_items.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

class WProfileBodyDetail extends StatelessWidget {
  const WProfileBodyDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WProfileBodyItem(
          onPressed: () =>
              Navigator.pushNamed(context, SettingsScreen.routeName),
          svg: AppAssets.settings,
          title: LocaleKeys.settings.tr(),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          decoration: BoxDecoration(
              border: Border.all(color: AppConstants.kBackgroundColor),
              borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            minLeadingWidth: 0,
            contentPadding: EdgeInsets.zero,
            title: Text(
              LocaleKeys.notification.tr(),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            trailing: CupertinoSwitch(
              value: true,
              onChanged: (value) {},
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              backgroundColor: AppConstants.kTransparent,
              context: context,
              builder: (context) => const WLanguageModalPopup(),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            decoration: BoxDecoration(
                border: Border.all(color: AppConstants.kBackgroundColor),
                borderRadius: BorderRadius.circular(8)),
            child: ListTile(
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.zero,
              title: Text(
                LocaleKeys.lang.tr(),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    Text(LocaleKeys.langCode.tr()),
                    const SizedBox(
                      width: 8,
                    ),
                    context.localizedFlag(context)
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        WProfileBodyItem(
          svg: AppAssets.file,
          title: LocaleKeys.termsofuse.tr(),
        ),
        const SizedBox(
          height: 12,
        ),
        WProfileBodyItem(
          svg: AppAssets.info,
          title: LocaleKeys.aboutus.tr(),
        ),
      ],
    );
  }
}
