import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/home/data/model/m_product_detail.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

class WPDLocation extends StatefulWidget {
  const WPDLocation({
    super.key,
    required this.address,
  });
  final Address address;

  @override
  State<WPDLocation> createState() => _WPDLocationState();
}

class _WPDLocationState extends State<WPDLocation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppConstants.kWhiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              LocaleKeys.location.tr(),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SvgPicture.asset(AppAssets.mapMarker),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.address.district.region.name,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Container(
            height: 180,
            color: AppConstants.kDarkGreyColor,
          )
        ],
      ),
    );
  }
}
