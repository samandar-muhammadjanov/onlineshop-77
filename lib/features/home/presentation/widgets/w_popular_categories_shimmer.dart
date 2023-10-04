import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class WPopularCategoriesShimmer extends StatelessWidget {
  const WPopularCategoriesShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 8,
        ),
        padding: const EdgeInsets.only(left: 16),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppConstants.kWhiteColor,
                  border: Border.all(
                    color: AppConstants.kWhiteColor,
                  ),
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                title: const Text(
                  "Для женщин",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppConstants.kWhiteColor,
                      border: Border.all(
                          color: AppConstants.kWhiteColor.withOpacity(0.016))),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
