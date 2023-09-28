// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_categories_shimmer.dart';
import '/features/home/presentation/bloc/categories/categories_bloc.dart';
import '/features/home/presentation/widgets/w_category_child.dart';
import '/features/home/presentation/widgets/w_category_items.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool isParentCategory = false;
  int categoryIndex = 0;
  void _routeToChild(bool isParentCategory, int categoryIndex) {
    setState(() {
      this.isParentCategory = isParentCategory;
      this.categoryIndex = categoryIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesInitial) {
          return const WCategoryShimmer();
        } else if (state is CategoriesLoading) {
          return const WCategoryShimmer();
        } else if (state is CategoriesLoaded) {
          if (!isParentCategory) {
            return WCategoryItems(
              routeToChild: _routeToChild,
              state: state,
            );
          } else {
            return WCategoryChild(
              categoryIndex: categoryIndex,
              state: state,
              routeToChild: _routeToChild,
            );
          }
        } else if (state is CategoriesError) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const WCategoryShimmer();
        }
      },
    );
  }
}
