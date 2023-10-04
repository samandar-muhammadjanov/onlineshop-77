// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/layout/layout_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/miniCategory/mini_category_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_filter_modal_sheet.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_mini_categories_modal_sheet.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

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
            BlocBuilder<MiniCategoryBloc, MiniCategoryState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    backgroundColor: AppConstants.kTransparent,
                    builder: (context) =>
                        WMiniCategoriesModalSheet(value: state.category),
                  ),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppConstants.kBackgroundColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.category,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SvgPicture.asset(AppAssets.chevronDown)
                      ],
                    ),
                  ),
                );
              },
            ),
            BlocBuilder<LayoutBloc, LayoutState>(
              builder: (context, state) {
                return Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: AppConstants.kTransparent,
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
                                  color: AppConstants.kBackgroundColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: SvgPicture.asset(AppAssets.filter))),
                      const SizedBox(
                        width: 9,
                      ),
                      InkWell(
                        onTap: () {
                          context.read<LayoutBloc>().add(VerticalOnEvent());
                        },
                        child: SvgPicture.asset(
                          AppAssets.horizontal,
                          color: state.isVertical
                              ? AppConstants.kPrimaryColor
                              : AppConstants.kGreyTextColor,
                        ),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      InkWell(
                        onTap: () {
                          context.read<LayoutBloc>().add(VerticalOffEvent());
                        },
                        child: SvgPicture.asset(AppAssets.grid,
                            color: !state.isVertical
                                ? AppConstants.kPrimaryColor
                                : AppConstants.kGreyTextColor),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
