import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/core/utils/size_config.dart';
import 'package:onlineshop_77/features/search/presentation/blocs/search_bloc.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';
import 'package:highlight_text/highlight_text.dart';

class WCompleteSearchResult extends StatelessWidget {
  const WCompleteSearchResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: AppColors.whiteColor,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.recommendation.tr(),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.greyTextColor,
            ),
          ),
          // BlocBuilder<SearchCompleteResultBloc, SearchCompleteResultState>(
          //   builder: (context, resultState) {
          //     if (resultState is SearchCompleteResultError) {
          //       return Text(resultState.error);
          //     } else if (resultState is SearchCompleteResultLoaded) {
          //       if (resultState.result.isEmpty) {
          //         return const WEmptyResult();
          //       }
          //       return ListView.builder(
          //         shrinkWrap: true,
          //         physics: const NeverScrollableScrollPhysics(),
          //         itemCount: resultState.result.length,
          //         itemBuilder: (context, index) {
          //           final item = resultState.result[index];
          //           return ListTile(
          //             onTap: () {
          //               context.read<SearchsysBloc>().add(OnSearchResultEvent());
          //               context.read<SearchBloc>().add(GetSearchProductsEvent("?search=${item.name}"));
          //               FocusScope.of(context).unfocus();
          //             },
          //             contentPadding: EdgeInsets.zero,
          //             minLeadingWidth: 0,
          //             leading: SvgPicture.asset(
          //               AppAssets.search,
          //               color: AppColors.primaryColor,
          //             ),
          //             title:
          //                 // BlocBuilder<SearchedTextBloc, SearchedTextState>(
          //                 //   builder: (context, searchState) {
          //                 //     if (searchState is SearchedTextLoaded) {
          //                 //       return
          //                 TextHighlight(
          //               text: item.name,
          //               words: {
          //                 // searchState.text: HighlightedWord(
          //                 //     padding: const EdgeInsets.only(left: 4),
          //                 //     decoration: BoxDecoration(
          //                 //         borderRadius: BorderRadius.circular(4), color: AppColors.orangeColor)),
          //               },
          //               matchCase: true,
          //               maxLines: 1,
          //               textStyle: const TextStyle(
          //                 fontSize: 16,
          //                 color: AppColors.blackColor,
          //                 fontWeight: FontWeight.w500,
          //               ),
          //             ),
          //             // }
          //             //     return const SizedBox();
          //             //   },
          //             // ),
          //             trailing: SvgPicture.asset(
          //               AppAssets.chevronRight,
          //             ),
          //           );
          //         },
          //       );
          //     }
          //     return const WCompleteSearchResultShimmer();
          //   },
          // ),
        ],
      ),
    );
  }
}
