import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/productBloc/product_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_product_shimmer.dart';

import '../../../../core/utils/size_config.dart';
import 'w_product_item.dart';

class WProductCards extends StatelessWidget {
  const WProductCards({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        print(state);
        if (state is ProductInitial) {
          return const WProductShimmer();
        } else if (state is ProductLoading) {
          return const WProductShimmer();
        } else if (state is ProductError) {
          return Text(state.error);
        } else if (state is ProductLoaded) {
          return AnimationLimiter(
            child: GridView.builder(
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
        return const WProductShimmer();
      },
    );
  }
}
