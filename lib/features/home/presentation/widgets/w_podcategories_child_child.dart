import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';

class WPodCategoriesChildChild extends StatelessWidget {
  const WPodCategoriesChildChild({super.key, required this.category});
  final dynamic category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
                height: 20,
                width: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: AppConstants.kBorderColor,
                  ),
                ),
                child: SvgPicture.asset(AppAssets.check)),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            category["name"],
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppConstants.kBlackColor,
            ),
          ),
        ],
      ),
    );
  }
}
