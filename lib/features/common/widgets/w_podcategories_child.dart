import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/features/common/widgets/w_podcategories_child_child.dart';
import 'package:onlineshop_77/features/categories/data/models/caregories_model.dart';

class WPodCategoriesChild extends StatelessWidget {
  const WPodCategoriesChild({super.key, required this.category});
  final CategoryChild category;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedShape: Border.all(color: AppColors.whiteColor),
      shape: Border.all(color: AppColors.whiteColor),
      tilePadding: const EdgeInsets.fromLTRB(40, 0, 15, 0),
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
                child: SvgPicture.asset(AppAssets.check)),
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
      children: category.childs == null
          ? []
          : List.generate(
              (category.childs as List).length,
              (index) {
                final categoryChildChild = category.childs[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: WPodCategoriesChildChild(category: categoryChildChild),
                );
              },
            ),
    );
  }
}
