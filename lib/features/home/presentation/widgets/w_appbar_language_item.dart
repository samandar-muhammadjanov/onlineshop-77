
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/core/utils/extentions.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_language_modal_popup.dart';

class WAppBarLanguageItem extends StatelessWidget {
  const WAppBarLanguageItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: AppConstants.kTransparent,
          context: context,
          builder: (context) => const WLanguageModalPopup(),
        );
      },
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          context.localizedFlag(context),
          const SizedBox(
            width: 5,
          ),
          Text(
            context.locale.languageCode.toUpperCase(),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          SvgPicture.asset(
            AppAssets.chevronDown,
            color: AppConstants.kBlackColor,
          )
        ],
      ),
    );
  }
}
