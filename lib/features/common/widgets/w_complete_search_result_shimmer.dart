import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class WCompleteSearchResultShimmer extends StatelessWidget {
  const WCompleteSearchResultShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 0,
      leading: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: SvgPicture.asset(
          AppAssets.search,
          width: 20,
          height: 20,
          color: AppColors.blackColor,
        ),
      ),
      title: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 30,
          width: 80,
          color: AppColors.blackColor,
        ),
      ),
      trailing: SvgPicture.asset(AppAssets.chevronRight),
    );
  }
}
