import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/features/categories/presentation/blocs/categories_bloc.dart';
import 'package:onlineshop_77/features/common/widgets/w_podcategories_parent.dart';

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
              color: AppColors.darkGreyColor, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 18,
        ),
        BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            if (state.status.isSuccess) {
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
