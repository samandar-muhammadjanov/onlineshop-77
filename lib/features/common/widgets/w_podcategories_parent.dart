import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/features/common/widgets/w_podcategories_child.dart';
import 'package:onlineshop_77/features/categories/data/models/caregories_model.dart';

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
          collapsedShape: Border.all(color: AppColors.whiteColor),
          shape: Border.all(color: AppColors.whiteColor),
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
                      color: AppColors.borderColor,
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
                  color: AppColors.blackColor,
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
