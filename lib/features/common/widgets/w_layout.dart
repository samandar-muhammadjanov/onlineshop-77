import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/features/common/widgets/w_filter_modal_sheet.dart';
import 'package:onlineshop_77/features/common/widgets/w_mini_categories_modal_sheet.dart';

class WLayout extends StatelessWidget {
  const WLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.transparent,
                builder: (context) => WMiniCategoriesModalSheet(value: 'state.category'),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.backgroundColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "state.category",
                      overflow: TextOverflow.ellipsis,
                    ),
                    SvgPicture.asset(AppAssets.chevronDown)
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: AppColors.transparent,
                          builder: (context) => const SafeArea(
                            child: Padding(
                              padding: EdgeInsets.only(top: 60),
                              child: WFilterModalSheet(),
                            ),
                          ),
                        );
                      },
                      child: Container(
                          padding: const EdgeInsets.all(4),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.backgroundColor, borderRadius: BorderRadius.circular(8)),
                          child: SvgPicture.asset(AppAssets.filter))),
                  const SizedBox(
                    width: 9,
                  ),
                  InkWell(
                    onTap: () {
                      // context.read<LayoutBloc>().add(VerticalOnEvent());
                    },
                    child: SvgPicture.asset(
                      AppAssets.horizontal,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  InkWell(
                    onTap: () {
                      // context.read<LayoutBloc>().add(VerticalOffEvent());
                    },
                    child: SvgPicture.asset(
                      AppAssets.grid,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
