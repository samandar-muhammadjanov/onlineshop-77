import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/home/data/model/m_product_detail.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_pd_image_detail.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_pd_main_details.dart';

class WProductImages extends StatelessWidget {
  const WProductImages({
    super.key,
    required this.product,
  });
  final ProductDetail product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: AppConstants.kWhiteColor),
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
