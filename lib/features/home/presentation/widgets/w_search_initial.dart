import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_gap.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_popular_categories_card.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_popular_searchs.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_product_card.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

class WSearchInitial extends StatelessWidget {
  const WSearchInitial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WPopularSearchs(),
        const WGap(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: const BoxDecoration(
            color: AppConstants.kWhiteColor,
          ),
          child: const WPopularCategoriesCard(),
        ),
        const WGap(
          height: 16,
        ),
        Container(
          color: AppConstants.kBackgroundColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
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
              const WProductCards(),
              const WGap(
                height: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
