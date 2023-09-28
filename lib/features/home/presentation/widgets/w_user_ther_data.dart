import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/core/utils/extentions.dart';
import 'package:onlineshop_77/features/home/data/model/m_user_data.dart';

import '../../../../assets/constants/constants.dart';

class WUserOtherData extends StatelessWidget {
  const WUserOtherData({
    super.key,
    required this.item,
  });

  final UserData item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 12,
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppConstants.kBackgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppConstants.kGreyColor,
            ),
          ),
          child: Row(
            children: [
              SvgPicture.asset(AppAssets.phone),
              const SizedBox(
                width: 8,
              ),
              Text(
                item.phoneNumber.formatPhoneNumberWithSpaces(),
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppConstants.kBackgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppConstants.kGreyColor,
            ),
          ),
          child: Row(
            children: [
              SvgPicture.asset(AppAssets.mapMarker),
              const SizedBox(
                width: 8,
              ),
              Text(
                item.address.name,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              )
            ],
          ),
        ),
      ],
    );
  }
}
