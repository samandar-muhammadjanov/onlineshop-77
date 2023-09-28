// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/categories/categories_bloc.dart';

import '../registration_screen.dart';
import 'w_category_child.dart';
import 'w_category_parent.dart';

class WCategoryModalPopup extends StatefulWidget {
  const WCategoryModalPopup({
    super.key,
    this.getCategoryId,
  });
  final Function(int, String)? getCategoryId;
  @override
  State<WCategoryModalPopup> createState() => _WCategoryModalPopupState();
}

class _WCategoryModalPopupState extends State<WCategoryModalPopup> {
  int categoryId = 0;
  bool isParentCategory = true;

  void showChild(bool isChild, int categoryId) {
    isParentCategory = isChild;
    this.categoryId = categoryId;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 36,
          height: 5,
          decoration: BoxDecoration(
            color: AppConstants.kGreyColor,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const Gap(),
        Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: AppConstants.kWhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesLoaded) {
                if (!isParentCategory) {
                  return WCategoryChild(
                    categoryId: categoryId,
                    showChild: showChild,
                    state: state,
                  );
                } else {
                  return WCategoryParent(
                    showChild: showChild,
                    state: state,
                  );
                }
              }
              return const SizedBox(
                height: 300,
                width: double.maxFinite,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
