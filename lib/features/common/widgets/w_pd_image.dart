import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/features/common/widgets/w_pd_image_detail.dart';
import 'package:onlineshop_77/features/common/widgets/w_pd_main_details.dart';
import 'package:onlineshop_77/features/create_ads/domain/entities/ads_entity.dart';

class WProductImages extends StatelessWidget {
  const WProductImages({
    super.key,
    required this.product,
  });

  final AdsEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: AppColors.whiteColor),
      child: Column(
        children: [
          WPDImageDetail(photos: product.photos),
          const SizedBox(
            height: 16,
          ),
          WPDMainDetails(product: product),
        ],
      ),
    );
  }
}
