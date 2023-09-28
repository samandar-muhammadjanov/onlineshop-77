import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:shimmer/shimmer.dart';

class WPopularSearchsShimmer extends StatelessWidget {
  const WPopularSearchsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 0,
      leading: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: SvgPicture.asset(
          AppAssets.star,
          width: 25,
        ),
      ),
      title: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: const Text(
          "Ноутбуки и планшеты",
        ),
      ),
      trailing: SvgPicture.asset(AppAssets.chevronRight),
    );
  }
}
