import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';

class WProductDetailShimmer extends StatelessWidget {
  const WProductDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Shimmer.fromColors(
          highlightColor: Colors.grey[100]!,
          baseColor: Colors.grey[300]!,
          child: Container(
            height: 120,
            width: double.maxFinite,
            color: AppColors.whiteColor,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Shimmer.fromColors(
          highlightColor: Colors.grey[100]!,
          baseColor: Colors.grey[300]!,
          child: Container(
            height: 420,
            width: double.maxFinite,
            color: AppColors.whiteColor,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Shimmer.fromColors(
          highlightColor: Colors.grey[100]!,
          baseColor: Colors.grey[300]!,
          child: Container(
            height: 420,
            width: double.maxFinite,
            color: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }
}
