import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/home/data/model/m_categories.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_podcategories_child.dart';

class WPodCategoriesParent extends StatelessWidget {
  const WPodCategoriesParent({super.key, required this.categories});
  final List<Categories> categories;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (ctx, i) {
        final category = categories[i];
        var isAnyChildSelected =
            category.childs.any((element) => element.isChecked == true);
        return ExpansionTile(
          collapsedShape: Border.all(color: AppConstants.kWhiteColor),
          shape: Border.all(color: AppConstants.kWhiteColor),
          title: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 20,
                  width: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: AppConstants.kBorderColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                category.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppConstants.kBlackColor,
                ),
              )
            ],
          ),
          children: List.generate(category.childs.length, (index) {
            final childCategories = category.childs[index];
            return WPodCategoriesChild(category: childCategories);
          }),
        );
      },
    );
  }
}
