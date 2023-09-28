// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_gap.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_product_card.dart';

import 'w_popular_categories_card.dart';

class WPopularCategories extends StatelessWidget {
  const WPopularCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WPopularCategoriesCard(),
        WGap(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: WProductCards(),
        ),
        WGap(
          height: 16,
        )
      ],
    );
  }
}
