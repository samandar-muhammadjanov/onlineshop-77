import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/core/utils/size_config.dart';
import 'package:shimmer/shimmer.dart';

class WProductShimmer extends StatelessWidget {
  const WProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 16,
        crossAxisSpacing: 12,
        crossAxisCount: 2,
        childAspectRatio: wi(0.66),
      ),
      itemBuilder: (context, index) => Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 130,
              decoration: const BoxDecoration(
                color: AppConstants.kWhiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(
              color: AppConstants.kWhiteColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        color: AppConstants.kWhiteColor,
                        borderRadius: BorderRadius.circular(6)),
                    child: const Text(
                      "г. Ташкент",
                      style: TextStyle(
                        color: AppConstants.kWhiteColor,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: const Text(
                    "Оригинальные кроссовки Nike Air Max 97",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: const Text(
                    "Вчера, 19:20",
                    style: TextStyle(
                        fontSize: 10, color: AppConstants.kWhiteColor),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(color: AppConstants.kWhiteColor),
                      children: [
                        TextSpan(
                          text: "4 820 000  ",
                          style: TextStyle(
                            color: AppConstants.kWhiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: "UZS",
                          style: TextStyle(
                            color: AppConstants.kWhiteColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
