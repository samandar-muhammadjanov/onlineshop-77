// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/core/utils/size_config.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/layout/layout_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/search/search_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/searchsys/saerchsys_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_empty_result.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_horizontal_products_card.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_layout.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_product_shimmer.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_search_card.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_search_initial.dart';
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
        BlocBuilder<SearchsysBloc, SearchsysState>(
          builder: (context, state) {
            if (state is OnSearchInitial) {
              return const WSearchInitial();
            } else if (state is OnSearchChange) {
              return const WCompleteSearchResult();
            } else if (state is OnSearchResult || state is OnPopularSearch) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    color: AppConstants.kWhiteColor,
                    child: const WLayout(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BlocBuilder<SearchBloc, SearchState>(
                      builder: (context, state) {
                        if (state is SearchInitial) {
                          return const WProductShimmer();
                        } else if (state is SearchLoading) {
                          return const WProductShimmer();
                        } else if (state is SearchLoaded) {
                          if (state.products.results.isEmpty) {
                            return const WEmptyResult();
                          }
                          return BlocBuilder<LayoutBloc, LayoutState>(
                            builder: (context, layoutState) {
                              if (layoutState.isVertical) {
                                return WHorizontalProductsCard(state: state);
                              } else {
                                return WSearchCard(state: state);
                              }
                            },
                          );
                        } else if (state is SearchError) {
                          return Text(state.error);
                        } else {
                          return const WProductShimmer();
                        }
                      },
                    ),
                  )
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        )
      ],
    );
  }
}
