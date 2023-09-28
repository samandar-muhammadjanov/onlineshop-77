// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/search/search_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/searchCompleteResults/search_result_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/searchOnchanged/search_onchanged_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_complete_search_result_shimmer.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_popular_searchs.dart';

class WCompleteSearchResult extends StatelessWidget {
  const WCompleteSearchResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchOnchangedBloc, SearchOnchangedState>(
      builder: (context, state) {
        if (state.isChanged) {
          return BlocBuilder<SearchCompleteResultBloc,
              SearchCompleteResultState>(
            builder: (context, resultState) {
              if (resultState is SearchCompleteResultError) {
                return Text(resultState.error);
              }
              if (resultState is SearchCompleteResultLoaded) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  width: double.infinity,
                  color: AppConstants.kWhiteColor,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: resultState.result.length,
                    itemBuilder: (context, index) {
                      final item = resultState.result[index];
                      return ListTile(
                        onTap: () {
                          context
                              .read<SearchBloc>()
                              .add(GetSearchProductsEvent(item.name));
                        },
                        contentPadding: EdgeInsets.zero,
                        minLeadingWidth: 0,
                        leading: SvgPicture.asset(
                          AppAssets.search,
                          color: AppConstants.kPrimaryColor,
                        ),
                        title: Text(
                          item.name,
                        ),
                        trailing: SvgPicture.asset(
                          AppAssets.chevronRight,
                        ),
                      );
                    },
                  ),
                );
              }
              return const WCompleteSearchResultShimmer();
            },
          );
        } else {
          return const WPopularSearchs();
        }
      },
    );
  }
}
