// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/core/utils/exports.dart';
import 'package:onlineshop_77/core/utils/size_config.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_complete_search_result_shimmer.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_empty_result.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

class WCompleteSearchResult extends StatelessWidget {
  const WCompleteSearchResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: AppConstants.kWhiteColor,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.recommendation.tr(),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: AppConstants.kGreyTextColor,
            ),
          ),
          BlocBuilder<SearchCompleteResultBloc, SearchCompleteResultState>(
            builder: (context, resultState) {
              if (resultState is SearchCompleteResultError) {
                return Text(resultState.error);
              } else if (resultState is SearchCompleteResultLoaded) {
                if (resultState.result.isEmpty) {
                  return const WEmptyResult(); 
                }
                return ListView.builder(
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
                );
              }
              return const WCompleteSearchResultShimmer();
            },
          ),
        ],
      ),
    );
  }
}
