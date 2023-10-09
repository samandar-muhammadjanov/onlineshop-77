import 'package:flutter/material.dart';
import 'package:onlineshop_77/core/utils/size_config.dart';
import 'package:onlineshop_77/features/common/widgets/w_search_panel.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const WSearchPanel(),
        // BlocBuilder<SearchsysBloc, SearchsysState>(
        //   builder: (context, state) {
        //     if (state is OnSearchInitial) {
        //       return const WSearchInitial();
        //     } else if (state is OnSearchChange) {
        //       return const WCompleteSearchResult();
        //     } else if (state is OnSearchResult || state is OnPopularSearch) {
        //       return Column(
        //         children: [
        //           Container(
        //             padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        //             color: AppColors.whiteColor,
        //             child: const WLayout(),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.all(16.0),
        //             child: BlocBuilder<SearchBloc, SearchState>(
        //               builder: (context, state) {
        //                 if (state is SearchInitial) {
        //                   return const WProductShimmer();
        //                 } else if (state is SearchLoading) {
        //                   return const WProductShimmer();
        //                 } else if (state is SearchLoaded) {
        //                   if (state.products.results.isEmpty) {
        //                     return const WEmptyResult();
        //                   }
        //                   return BlocBuilder<LayoutBloc, LayoutState>(
        //                     builder: (context, layoutState) {
        //                       if (layoutState.isVertical) {
        //                         return WHorizontalProductsCard(state: state);
        //                       } else {
        //                         return WSearchCard(state: state);
        //                       }
        //                     },
        //                   );
        //                 } else if (state is SearchError) {
        //                   return Text(state.error);
        //                 } else {
        //                   return const WProductShimmer();
        //                 }
        //               },
        //             ),
        //           )
        //         ],
        //       );
        //     } else {
        //       return const SizedBox();
        //     }
        //   },
        // )
      ],
    );
  }
}
