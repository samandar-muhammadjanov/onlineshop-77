import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/core/utils/exports.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_podcategories_parent.dart';

class WPodCategories extends StatefulWidget {
  const WPodCategories({super.key});

  @override
  State<WPodCategories> createState() => _WPodCategoriesState();
}

class _WPodCategoriesState extends State<WPodCategories> {
  List<dynamic> selectedCategories = [];
  bool checkBoxes = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Подкатегории",
          style: TextStyle(
              color: AppConstants.kDarkGreyColor, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 18,
        ),
        BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoaded) {
              return WPodCategoriesParent(categories: state.categories);
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
