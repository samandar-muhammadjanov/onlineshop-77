import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/features/common/widgets/w_product_card.dart';

import '../../../../generated/locale_keys.g.dart';

class WPopularProducts extends StatelessWidget {
  const WPopularProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.popularProducts.tr(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            LocaleKeys.subtextPopularProducts.tr(),
            style: const TextStyle(
              color: AppColors.greyTextColor,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const WProductCards()
        ],
      ),
    );
  }
}
