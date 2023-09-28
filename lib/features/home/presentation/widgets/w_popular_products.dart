import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_product_card.dart';

import '../../../../assets/constants/constants.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../auth/presentation/widgets/w_gap.dart';

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
          const WGap(
            height: 8,
          ),
          Text(
            LocaleKeys.subtextPopularProducts.tr(),
            style: const TextStyle(
              color: AppConstants.kGreyTextColor,
            ),
          ),
          const WGap(
            height: 16,
          ),
          const WProductCards()
        ],
      ),
    );
  }
}
