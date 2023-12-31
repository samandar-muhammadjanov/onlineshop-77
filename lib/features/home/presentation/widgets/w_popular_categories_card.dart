import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_popular_categories_shimmer.dart';

import '../../../../assets/constants/constants.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../auth/presentation/widgets/w_gap.dart';
import '../bloc/categories/categories_bloc.dart';

class WPopularCategoriesCard extends StatelessWidget {
  const WPopularCategoriesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            LocaleKeys.popolarCategories.tr(),
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ),
        const WGap(
          height: 10,
        ),
        BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesInitial) {
              return const WPopularCategoriesShimmer();
            } else if (state is CategoriesLoading) {
              return const WPopularCategoriesShimmer();
            } else if (state is CategoriesError) {
              return Text(state.error);
            } else if (state is CategoriesLoaded) {
              return SizedBox(
                height: 64,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    final item = state.categories[index];
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppConstants.kWhiteColor,
                          border: Border.all(
                            color: AppConstants.kBackgroundColor,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        title: Text(
                          item.name,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppConstants.kPrimaryColor,
                            border: Border.all(
                              color:
                                  AppConstants.kPrimaryColor.withOpacity(0.016),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: item.icon.split(".").last != "svg"
                                ? Image.network(
                                    "https://backendmaster.pythonanywhere.com${item.icon}",
                                    color: AppConstants.kWhiteColor,
                                  )
                                : SvgPicture.network(
                                    "https://backendmaster.pythonanywhere.com${item.icon}",
                                    color: AppConstants.kWhiteColor,
                                  ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            return const WPopularCategoriesShimmer();
          },
        ),
      ],
    );
  }
}
