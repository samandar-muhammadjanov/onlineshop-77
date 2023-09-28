// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/core/utils/size_config.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_gap.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/layout/layout_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/search/search_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_horizontal_products_card.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_layout.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_popular_categories_card.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_search_card.dart';

import 'widgets/w_product_card.dart';
import 'widgets/w_search_panel.dart';
import 'widgets/w_comlete_search_result.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const WSearchPanel(),
        BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state is SearchError) {
              return Text(state.error);
            } else if (state is SearchLoaded) {
              return Column(
                children: [
                  Container(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      decoration:
                          const BoxDecoration(color: AppConstants.kWhiteColor),
                      child: const WLayout()),
                  BlocBuilder<LayoutBloc, LayoutState>(
                    builder: (context, layoutState) {
                      if (layoutState.isVertical) {
                        return WHorizontalProductsCard(state: state);
                      } else {
                        return WSearchCard(
                          state: state,
                        );
                      }
                    },
                  ),
                ],
              );
            }
            return Column(
              children: [
                const WCompleteSearchResult(),
                const WGap(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: const BoxDecoration(
                    color: AppConstants.kWhiteColor,
                  ),
                  child: const WPopularCategoriesCard(),
                ),
                const WGap(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: WProductCards(),
                ),
                const WGap(
                  height: 16,
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
