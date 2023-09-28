import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:onlineshop_77/core/utils/size_config.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/search/search_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_product_item.dart';

class WSearchCard extends StatelessWidget {
  const WSearchCard({
    super.key,
    required this.state,
  });
  final SearchLoaded state;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnimationLimiter(
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: state.products.results.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 16,
          crossAxisSpacing: 12,
          crossAxisCount: 2,
          childAspectRatio: wi(0.598),
        ),
        itemBuilder: (context, index) {
          final item = state.products.results[index];
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 500),
            columnCount: 2,
            child: FadeInAnimation(
              child: WProductItem(item: item),
            ),
          );
        },
      ),
    );
  }
}
