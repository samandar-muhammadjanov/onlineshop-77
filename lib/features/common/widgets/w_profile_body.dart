import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/core/routers/app_router.dart';
import 'package:onlineshop_77/features/common/widgets/w_profile_body_details.dart';
import 'package:onlineshop_77/features/common/widgets/w_profile_body_items.dart';

import '../../../../generated/locale_keys.g.dart';

class WProfileBody extends StatelessWidget {
  const WProfileBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          height: 30,
        ),
        GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, Routes.dashboard),
          child: WProfileBodyItem(
            svg: AppAssets.userProfile,
            title: LocaleKeys.personalInfo.tr(),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, Routes.dashboard),
          child: WProfileBodyItem(
            svg: AppAssets.grid,
            title: LocaleKeys.myProducts.tr(),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const WProfileBodyDetail(),
      ],
    );
  }
}
