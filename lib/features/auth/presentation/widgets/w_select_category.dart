import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_category_modalpopup.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

import '../registration_screen.dart';

class WSelectCategory extends StatefulWidget {
  const WSelectCategory({
    super.key,
  });

  @override
  State<WSelectCategory> createState() => _WSelectCategoryState();
}

class _WSelectCategoryState extends State<WSelectCategory> {
  late String value = LocaleKeys.selectCategory.tr();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.category.tr(),
          style: const TextStyle(
            color: AppColors.darkGreyColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Gap(),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: AppColors.transparent,
              builder: (context) => WCategoryModalPopup(),
            );
          },
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.centerLeft,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // BlocBuilder<CategoryBloc, CategoryState>(
                //   builder: (context, state) {
                //     return Text(
                //       state.name == "" ? value : state.name,
                //     );
                //   },
                // ),
                SvgPicture.asset(AppAssets.chevronDown)
              ],
            ),
          ),
        )
      ],
    );
  }
}
