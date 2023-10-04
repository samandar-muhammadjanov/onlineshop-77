import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:onlineshop_77/core/utils/exports.dart';
import 'package:onlineshop_77/features/home/data/model/m_regions.dart';
import 'package:onlineshop_77/features/home/data/repositories/data_repository.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/region/regions_bloc.dart';

class WRegions extends StatefulWidget {
  const WRegions({
    super.key,
  });

  @override
  State<WRegions> createState() => _WRegionsState();
}

class _WRegionsState extends State<WRegions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Регион",
          style: TextStyle(
              color: AppConstants.kDarkGreyColor, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppConstants.kGreyColor,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Самаркандская область"),
              SvgPicture.asset(AppAssets.chevronRight)
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Район/город",
          style: TextStyle(
              color: AppConstants.kDarkGreyColor, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppConstants.kGreyColor,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Все"),
              SvgPicture.asset(AppAssets.chevronRight)
            ],
          ),
        ),
      ],
    );
  }
}
