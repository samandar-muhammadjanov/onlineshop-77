// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/categories/categories_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/layout/layout_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_filter.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';
import 'package:parent_child_checkbox/parent_child_checkbox.dart';

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
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(LocaleKeys.allPosts.tr()),
                  SvgPicture.asset(AppAssets.chevronDown)
                ],
              ),
            ),
            BlocBuilder<LayoutBloc, LayoutState>(
              builder: (context, state) {
                return Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                      GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const WFilter();
                              },
                            );
                          },
                          child: SvgPicture.asset(AppAssets.filter))
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
