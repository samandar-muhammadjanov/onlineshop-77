import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop_77/features/common/widgets/w_popular_categories.dart';
import 'package:onlineshop_77/features/common/widgets/w_popular_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ProductBloc>().add(GetProductsEvent(''));
      },
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          WPopularProducts(),
          WPopularCategories(),
        ],
      ),
    );
  }
}
