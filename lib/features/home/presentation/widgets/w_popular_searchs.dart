import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/search/search_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_popular_searchs_shimmer.dart';

import '../../../../assets/assets.dart';
import '../../../../assets/constants/constants.dart';
import '../../../../generated/locale_keys.g.dart';
import '../bloc/popularSearchs/popular_searchs_bloc.dart';

class WPopularSearchs extends StatelessWidget {
  const WPopularSearchs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: double.infinity,
      color: AppConstants.kWhiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.popularSearches.tr(),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: AppConstants.kGreyTextColor,
            ),
          ),
          const SizedBox(height: 12),
          BlocBuilder<PopularSearchsBloc, PopularSearchsState>(
            builder: (context, state) {
              if (state is PopularSearchsInitial) {
                return const WPopularSearchsShimmer();
              } else if (state is PopularSearchsLoading) {
                return const WPopularSearchsShimmer();
              } else if (state is PopularSearchsLoaded) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.popularSearchs.length < 8
                      ? state.popularSearchs.length
                      : 8,
                  itemBuilder: (context, index) {
                    final item = state.popularSearchs[index];
                    return ListTile(
                      onTap: () {
                        context
                            .read<SearchBloc>()
                            .add(GetSearchProductsEvent(item.searchTerm));
                      },
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 0,
                      leading: SvgPicture.asset(AppAssets.star),
                      title: Text(
                        item.searchTerm,
                      ),
                      trailing: SvgPicture.asset(
                        AppAssets.chevronRight,
                      ),
                    );
                  },
                );
              } else if (state is PopularSearchsError) {
                print(state.error);
                return const SizedBox();
              }
              return const WPopularSearchsShimmer();
            },
          )
        ],
      ),
    );
  }
}
