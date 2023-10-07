import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/features/categories/presentation/blocs/categories_bloc.dart';

class WCategoryItems extends StatelessWidget {
  const WCategoryItems({
    super.key,
    required this.state,
    required this.routeToChild,
  });
  final CategoriesLoaded state;
  final Function(bool, int) routeToChild;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 12,
        );
      },
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      itemCount: state.categories.length,
      itemBuilder: (context, index) {
        final category = state.categories[index];
        if (category.icon.isEmpty) {
          return const SizedBox();
        }
        return GestureDetector(
          onTap: () => routeToChild(true, index),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 20,
                        spreadRadius: 0,
                        color: AppColors.blackColor.withOpacity(0.08))
                  ],
                ),
                child: ListTile(
                  minLeadingWidth: 10,
                  leading: const SizedBox(),
                  title: Text(category.name),
                  subtitle: Text("${category.adsCount} объявлений"),
                  trailing: SvgPicture.asset(AppAssets.chevronRight),
                ),
              ),
              Container(
                width: 64,
                height: 64,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 0),
                      blurRadius: 20,
                      spreadRadius: 0,
                      color: AppColors.blackColor.withOpacity(0.08),
                    )
                  ],
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  border:
                  Border.all(color: AppColors.backgroundColor),
                ),
                child: category.icon.split(".").last != "svg"
                    ? Image.network(
                  "https://backendmaster.pythonanywhere.com${category.icon}",
                  width: 32,
                  color: AppColors.primaryColor,
                )
                    : SvgPicture.network(
                  "https://backendmaster.pythonanywhere.com${category.icon}",
                  width: 32,
                  color: AppColors.primaryColor,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
